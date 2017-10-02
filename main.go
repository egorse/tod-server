package main

import (
	"encoding/binary"
	"flag"
	"log"
	"net"
	"time"
)

func main() {
	addr := ":37"

	flag.StringVar(&addr, "addr", ":37", "Interface address to bind and listen")
	flag.Parse()

	laddr, err := net.ResolveUDPAddr("udp", addr)
	if err != nil {
		log.Fatal(err)
	}
	conn, err := net.ListenUDP("udp", laddr)
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()
	log.Printf("listen on %v", addr)

	// The UDP loop
	b := make([]byte, 4)
	for {
		_, client, err := conn.ReadFromUDP(b)
		if err != nil {
			log.Fatal(err)
		}
		// Some of CMs may send non-empty datagram

		// The @time.Now().Unix() returns epoch time
		// The RFC868 specifies the time must be since 00:00 (midnight) 1 January 1900 GMT
		now := time.Now().Unix() + 2208988800
		binary.BigEndian.PutUint32(b, uint32(now))
		conn.WriteToUDP(b, client)
		go log.Printf("reply to %s", client)
	}
}

package sysinfo

import (
	"fmt"

	"golang.org/x/sys/unix"
)

type SystemInfo struct {
	Message string `json:"message"`
	OS      string `json:"os"`
	Arch    string `json:"arch"`
}

func stringify(f [65]byte) string {
	out := make([]byte, 0, 65)
	for _, v := range f[:] {
		if v == 0 {
			break
		}
		out = append(out, v)
	}
	return string(out)
}

func GetInfo() (*SystemInfo, error) {
	var uname unix.Utsname
	if err := unix.Uname(&uname); err != nil {
		return nil, fmt.Errorf("failed to get system info: %w", err)
	}

	return &SystemInfo{
		Message: "Hello, there!",
		OS:      stringify(uname.Sysname) + " " + stringify(uname.Release),
		Arch:    stringify(uname.Machine),
	}, nil
}

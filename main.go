package main

import "runtime"

func main() {
	// Parse flags
	flags := parseFlags()

	// Set log-level
	setLogger(*flags.LogLevel)

	// Read config
	config, err := getConfiguration(flags)
	if err != nil {
		Log.Error.Fatal(err)
	}

	// Set GOMAXPROCS
	runtime.GOMAXPROCS(config.MaxProcs)

	// Add app logic here
}

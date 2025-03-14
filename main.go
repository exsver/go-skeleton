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
	Log.Info.Printf("Setting GOMAXPROCS=%d", config.MaxProcs)
	runtime.GOMAXPROCS(config.MaxProcs)

	Log.Info.Println("App is running")

	// Add app logic here
}

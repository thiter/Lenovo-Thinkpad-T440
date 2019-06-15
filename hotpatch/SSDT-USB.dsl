// USB Port Injector for Lenovo ThinkPad T440.
// Disable ESEL to avoid USB Problems.
// Fix AutoStart after ShutDown if a USB device is Plugged In.
// FingerPrint Reader disabled as it's unsupported on macOS.
// Adds Dock USB Ports Support: "HS03" for USB2 Devices & "SSP3" for USB3 Devices.

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "T440", "_USB", 0)
{
#endif
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        
        Name(RMCF, Package()
        {
            "8086_9c31", Package()
            {
                "port-count", Buffer() { 13, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // USB3 Port (2.0 Device Connected)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // USB3 Port (2.0 Device Connected)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HS03", Package() // Dock USB3 Ports (2.0 Devices Connected)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    //"HS06", Package() // FingerPrint Reader
                    //{
                        //"UsbConnector", 255,
                        //"port", Buffer() { 6, 0, 0, 0 },
                    //},
                    "HS07", Package() // Bluetooth
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package() // Integrated Camera
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "SSP1", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    "SSP2", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 11, 0, 0, 0 },
                    },
                    "SSP3", Package() // Dock USB3 Ports
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 12, 0, 0, 0 },
                    },
                },
            },
        })
    }
    External(ZPTS, MethodObj)
    External(_SB.PCI0.XHC.PMEE, FieldUnitObj)
    Method(_PTS, 1)
    {
        ZPTS(Arg0)
        If (5 == Arg0)
        {
            \_SB.PCI0.XHC.PMEE = 0
        }
    }
    Method(_SB.PCI0.XHC.ESEL)
    {
        // do nothing
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF

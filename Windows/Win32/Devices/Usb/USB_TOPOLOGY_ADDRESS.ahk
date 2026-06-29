#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_TOPOLOGY_ADDRESS {
    #StructPack 4

    PciBusNumber : UInt32

    PciDeviceNumber : UInt32

    PciFunctionNumber : UInt32

    Reserved : UInt32

    RootHubPortNumber : UInt16

    HubPortNumber : UInt16[5]

    Reserved2 : UInt16

}

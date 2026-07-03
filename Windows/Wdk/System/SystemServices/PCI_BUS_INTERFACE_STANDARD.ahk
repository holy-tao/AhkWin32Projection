#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_BUS_INTERFACE_STANDARD {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    ReadConfig : IntPtr

    WriteConfig : IntPtr

    PinToLine : IntPtr

    LineToPin : IntPtr

    RootBusCapability : IntPtr

    ExpressWakeControl : IntPtr

    PrepareMultistageResume : IntPtr

}

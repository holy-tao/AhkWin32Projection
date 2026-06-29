#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    ExpressCapabilities : IntPtr

    DeviceCapabilities : IntPtr

    DeviceControl : IntPtr

    DeviceStatus : IntPtr

    LinkCapabilities : IntPtr

    LinkControl : IntPtr

    LinkStatus : IntPtr

    SlotCapabilities : IntPtr

    SlotControl : IntPtr

    SlotStatus : IntPtr

    RootControl : IntPtr

    RootCapabilities : IntPtr

    RootStatus : IntPtr

    DeviceCapabilities2 : IntPtr

    DeviceControl2 : IntPtr

    DeviceStatus2 : IntPtr

    LinkCapabilities2 : IntPtr

    LinkControl2 : IntPtr

    LinkStatus2 : IntPtr

}

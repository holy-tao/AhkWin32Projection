#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ACPI_INTERFACE_STANDARD2 {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    GpeConnectVector : IntPtr

    GpeDisconnectVector : IntPtr

    GpeEnableEvent : IntPtr

    GpeDisableEvent : IntPtr

    GpeClearStatus : IntPtr

    RegisterForDeviceNotifications : IntPtr

    UnregisterForDeviceNotifications : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_RESET_INTERFACE_STANDARD {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    DeviceReset : IntPtr

    SupportedResetTypes : UInt32

    Reserved : IntPtr

    QueryBusSpecificResetInfo : IntPtr

    DeviceBusSpecificReset : IntPtr

    GetDeviceResetStatus : IntPtr

}

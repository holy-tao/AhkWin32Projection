#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CONTROLLER_OBJECT {
    #StructPack 8

    Type : Int16

    Size : Int16

    ControllerExtension : IntPtr

    DeviceWaitQueue : IntPtr

    Spare1 : UInt32

    Spare2 : Int64

}

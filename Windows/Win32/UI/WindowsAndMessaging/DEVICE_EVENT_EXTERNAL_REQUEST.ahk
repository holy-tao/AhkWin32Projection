#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEVICE_EVENT_EXTERNAL_REQUEST {
    #StructPack 8

    Version : UInt32

    DeviceClass : UInt32

    ButtonStatus : UInt16

    Request : UInt16

    SystemTime : Int64

}

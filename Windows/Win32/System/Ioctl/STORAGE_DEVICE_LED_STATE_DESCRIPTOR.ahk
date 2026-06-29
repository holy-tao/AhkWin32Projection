#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_LED_STATE_DESCRIPTOR {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    State : Int64

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEVICE_EVENT_BECOMING_READY {
    #StructPack 4

    Version : UInt32

    Reason : UInt32

    Estimated100msToReady : UInt32

}

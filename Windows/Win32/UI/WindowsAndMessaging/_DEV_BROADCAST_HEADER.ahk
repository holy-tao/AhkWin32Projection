#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct _DEV_BROADCAST_HEADER {
    #StructPack 4

    dbcd_size : UInt32

    dbcd_devicetype : UInt32

    dbcd_reserved : UInt32

}

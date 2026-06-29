#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the client display.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_display_ioctl
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_DISPLAY_IOCTL {
    #StructPack 4

    /**
     * A byte array that contains information about the client display.
     */
    pDisplayIOCtlData : Int8[256]

    /**
     * An integer that specifies the size of the byte array.
     */
    cbDisplayIOCtlData : UInt32

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the client display.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_display_ioctl
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_DISPLAY_IOCTL extends Win32Struct
{
    static sizeof => 260

    static packingSize => 4

    /**
     * A byte array that contains information about the client display.
     * @type {Array<Byte>}
     */
    pDisplayIOCtlData{
        get {
            if(!this.HasProp("__pDisplayIOCtlDataProxyArray"))
                this.__pDisplayIOCtlDataProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "char")
            return this.__pDisplayIOCtlDataProxyArray
        }
    }

    /**
     * An integer that specifies the size of the byte array.
     * @type {Integer}
     */
    cbDisplayIOCtlData {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }
}

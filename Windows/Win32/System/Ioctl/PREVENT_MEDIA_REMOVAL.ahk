#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides removable media locking data. It is used by the IOCTL_STORAGE_MEDIA_REMOVAL control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-prevent_media_removal
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PREVENT_MEDIA_REMOVAL extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * If this member is <b>TRUE</b>, the media is to be locked. Otherwise, it is not.
     * @type {BOOLEAN}
     */
    PreventMediaRemoval {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}

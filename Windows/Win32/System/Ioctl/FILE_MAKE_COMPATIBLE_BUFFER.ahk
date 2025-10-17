#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the disc to close the current session for. This control code is used for UDF file systems. This structure is used for input when calling FSCTL_MAKE_MEDIA_COMPATIBLE.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-file_make_compatible_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_MAKE_COMPATIBLE_BUFFER extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * If <b>TRUE</b>, indicates the media should be finalized. No new data can be appended to the media.
     * @type {BOOLEAN}
     */
    CloseDisc {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}

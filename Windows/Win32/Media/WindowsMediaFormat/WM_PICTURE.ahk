#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_PICTURE structure is used as the data item for the WM/Picture complex metadata attribute.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wm_picture
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_PICTURE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Pointer to a wide-character null-terminated string containing the multipurpose Internet mail extension (MIME) type of the picture.
     * @type {PWSTR}
     */
    pwszMIMEType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    bPictureType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Pointer to a wide-character null-terminated string containing a description of the picture.
     * @type {PWSTR}
     */
    pwszDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * <b>DWORD</b> value containing the size, in bytes, of the picture data pointed to by <b>pbData</b>.
     * @type {Integer}
     */
    dwDataLen {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to a <b>BYTE</b> array containing the picture data.
     * @type {Pointer<Integer>}
     */
    pbData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A MapiFileTagExt structure specifies a message attachment's type at its creation and its current form of encoding so that it can be restored to its original type at its destination.
 * @remarks
 * 
  * A <b>MapiFileTagExt</b> structure defines the type of an attached file for purposes such as encoding and decoding the file, choosing the correct application to launch when opening it, or any use that requires full information regarding the file type. Client applications can use information in the <b>lpTag</b> and <b>lpEncoding</b> members of this structure to determine what to do with an attachment.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mapi/ns-mapi-mapifiletagext
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 */
class MapiFileTagExt extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * Reserved; must be zero.
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The size, in bytes, of the value defined by the <b>lpTag</b> member.
     * @type {Integer}
     */
    cbTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPBYTE</a></b>
     * 
     * Pointer to an X.400 object identifier indicating the type of the attachment in its original form, for example "Microsoft Excel worksheet".
     * @type {Pointer<Integer>}
     */
    lpTag {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The size, in bytes, of the value defined by the <b>lpEncoding</b> member.
     * @type {Integer}
     */
    cbEncoding {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPBYTE</a></b>
     * 
     * Pointer to an X.400 object identifier indicating the form in which the attachment is currently encoded, for example MacBinary, UUENCODE, or binary.
     * @type {Pointer<Integer>}
     */
    lpEncoding {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

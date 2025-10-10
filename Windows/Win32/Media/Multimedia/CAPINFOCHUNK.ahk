#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CAPINFOCHUNK structure contains parameters that can be used to define an information chunk within an AVI capture file. The WM_CAP_FILE_SET_INFOCHUNK message or capSetInfoChunk macro is used to send a CAPINFOCHUNK structure to a capture window.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-capinfochunk
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class CAPINFOCHUNK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Four-character code that identifies the representation of the chunk data. If this value is <b>NULL</b> and <b>lpData</b> is <b>NULL</b>, all accumulated information chunks are deleted.
     * @type {Integer}
     */
    fccInfoID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the data. If this value is <b>NULL</b>, all <b>fccInfoID</b> information chunks are deleted.
     * @type {Pointer<Void>}
     */
    lpData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size, in bytes, of the data pointed to by <b>lpData</b>. If <b>lpData</b> specifies a null-terminated string, use the string length incremented by one to save the <b>NULL</b> with the string.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}

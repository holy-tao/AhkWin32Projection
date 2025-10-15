#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * Contains information used in getting text from a rich edit control. This structure used with the EM_GETTEXTEX message.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/Controls/em-gettextex">EM_GETTEXTEX</a> message is faster when both <b>lpDefaultChar</b> and <b>lpUsedDefChar</b> are <b>NULL</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-gettextex
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class GETTEXTEX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size, in bytes, of the buffer used to store the retrieved text.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Code page used in the translation. It is <b>CP_ACP</b> for ANSI code page and 1200 for Unicode.
     * @type {Integer}
     */
    codepage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The character used if a wide character cannot be represented in the specified code page. It is used only if the code page is <b>not</b> 1200 (Unicode). If this member is <b>NULL</b>, a system default value is used.
     * @type {PSTR}
     */
    lpDefaultChar{
        get {
            if(!this.HasProp("__lpDefaultChar"))
                this.__lpDefaultChar := PSTR(this.ptr + 16)
            return this.__lpDefaultChar
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPBOOL</a></b>
     * 
     * A flag that indicates whether the default character (<b>lpDefaultChar</b>) was used. This member is used only if the code page is not 1200 or <b>CP_UTF8</b> (Unicode). The flag is <b>TRUE</b> if one or more wide characters in the source string cannot be represented in the specified code page. Otherwise, the flag is <b>FALSE</b>. This member can be NULL.
     * @type {Pointer<BOOL>}
     */
    lpUsedDefChar {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

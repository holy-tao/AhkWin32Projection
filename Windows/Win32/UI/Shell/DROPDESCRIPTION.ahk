#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the image and accompanying text for a drop object.
 * @remarks
 * 
  * Some UI coloring is applied to the text in <b>szInsert</b> if used by specifying %1 in <b>szMessage</b>. The characters %% and %1 are the subset of <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> markers that are processed here.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-dropdescription
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DROPDESCRIPTION extends Win32Struct
{
    static sizeof => 1044

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-dropimagetype">DROPIMAGETYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-dropimagetype">DROPIMAGETYPE</a> indicating the stock image to use.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * Text such as "Move to %1".
     * @type {String}
     */
    szMessage {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * Text such as "Documents", inserted as specified by <b>szMessage</b>.
     * @type {String}
     */
    szInsert {
        get => StrGet(this.ptr + 524, 259, "UTF-16")
        set => StrPut(value, this.ptr + 524, 259, "UTF-16")
    }
}

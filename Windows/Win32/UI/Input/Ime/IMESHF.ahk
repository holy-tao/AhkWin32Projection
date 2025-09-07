#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The header of an opened user dictionary file. Used to get the user dictionary's properties, such as version, title, description, and copyright.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-imeshf
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMESHF extends Win32Struct
{
    static sizeof => 868

    static packingSize => 1

    /**
     * The size of this structure. You must set this value before using the structure.
     * @type {Integer}
     */
    cbShf {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Dictionary version.
     * @type {Integer}
     */
    verDic {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Dictionary title.
     * @type {String}
     */
    szTitle {
        get => StrGet(this.ptr + 4, 47, "UTF-16")
        set => StrPut(value, this.ptr + 4, 47, "UTF-16")
    }

    /**
     * Dictionary description.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 100, 255, "UTF-16")
        set => StrPut(value, this.ptr + 100, 255, "UTF-16")
    }

    /**
     * Dictionary copyright information.
     * @type {String}
     */
    szCopyright {
        get => StrGet(this.ptr + 612, 127, "UTF-16")
        set => StrPut(value, this.ptr + 612, 127, "UTF-16")
    }
}

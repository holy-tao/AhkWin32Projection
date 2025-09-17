#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_CASEIGNORE_LIST structure is an ADSI representation of the Case Ignore List attribute syntax.
 * @remarks
 * A <b>Case Ignore List</b> attribute represents an ordered sequence of case insensitive strings.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_caseignore_list
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_CASEIGNORE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to the next <b>ADS_CASEIGNORE_LIST</b> in the list of case-insensitive strings.
     * @type {Pointer<ADS_CASEIGNORE_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The null-terminated Unicode string value of the current entry of the list.
     * @type {Pointer<Char>}
     */
    String {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

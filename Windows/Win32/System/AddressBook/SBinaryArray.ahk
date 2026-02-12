#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. An array of entry identifiers representing MAPI objects. Uses the same implementation as SBinaryArray.
 * @see https://learn.microsoft.com/windows/win32/api//content/wabdefs/ns-wabdefs-sbinaryarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SBinaryArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the number of entry identifiers.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815817(v=office.12)">SBinary</a>*</b>
     * 
     * Array of variables of type <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815817(v=office.12)">SBinary</a> that specify the entry identifiers.
     * @type {Pointer<SBinary>}
     */
    lpbin {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

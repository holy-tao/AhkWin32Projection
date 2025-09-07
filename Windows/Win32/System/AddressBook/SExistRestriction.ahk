#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an exist restriction which is used to test whether a particular property exists as a column in the table.
 * @remarks
 * The exist restriction is used to guarantee meaningful results for other types of restrictions that involve properties, such as property and content restrictions. When a restriction that involves a property is passed to [IMAPITable::Restrict](imapitable-restrict.md) or [IMAPITable::FindRow](imapitable-findrow.md) and the property does not exist, the results of the restriction are undefined. By creating an **AND** restriction that joins the property restriction with an exist restriction, a caller can be guaranteed accurate results. 
  *   
  * Exist restrictions cannot be used with sub-object properties that have type PT_OBJECT. 
  *   
  * For more information about the **SExistRestriction** structure, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sexistrestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SExistRestriction extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * > Reserved; must be zero.
     * @type {Integer}
     */
    ulReserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Property tag identifying the column to be tested for existence in each row.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Reserved; must be zero.
     * @type {Integer}
     */
    ulReserved2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a size restriction which is used to test the size of a property value for Outlook 2013 and Outlook 2016.
 * @remarks
 * For a general discussion of how restrictions work, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ssizerestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SSizeRestriction extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * > Relational operator that is used in the size comparison. Possible values are as follows: 
     *     
     * RELOP_GE 
     *   
     * > The comparison is made based on a greater or equal first value.
     *     
     * RELOP_GT 
     *   
     * > The comparison is made based on a greater first value.
     *     
     * RELOP_LE 
     *   
     * > The comparison is made based on a lesser or equal first value.
     *     
     * RELOP_LT 
     *   
     * > The comparison is made based on a lesser first value.
     *     
     * RELOP_NE 
     *   
     * > The comparison is made based on unequal values.
     *     
     * RELOP_RE 
     *   
     * > The comparison is made based on LIKE (regular expression) values.
     *     
     * RELOP_EQ 
     *   
     * > The comparison is made based on equal values.
     * @type {Integer}
     */
    relop {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Property tag identifying the property to test.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Count of bytes in the property value.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

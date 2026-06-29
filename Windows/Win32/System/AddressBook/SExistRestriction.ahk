#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct SExistRestriction {
    #StructPack 4

    /**
     * > Reserved; must be zero.
     */
    ulReserved1 : UInt32

    /**
     * > Property tag identifying the column to be tested for existence in each row.
     */
    ulPropTag : UInt32

    /**
     * > Reserved; must be zero.
     */
    ulReserved2 : UInt32

}

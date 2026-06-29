#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a size restriction which is used to test the size of a property value for Outlook 2013 and Outlook 2016.
 * @remarks
 * For a general discussion of how restrictions work, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ssizerestriction
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SSizeRestriction {
    #StructPack 4

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
     */
    relop : UInt32

    /**
     * > Property tag identifying the property to test.
     */
    ulPropTag : UInt32

    /**
     * > Count of bytes in the property value.
     */
    cb : UInt32

}

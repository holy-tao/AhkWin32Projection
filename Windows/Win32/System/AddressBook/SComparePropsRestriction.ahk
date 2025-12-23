#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a compare property restriction, which tests two properties using a relational operator.
 * @remarks
 * The comparison order is  _(property tag 1) (relational operator) (property tag 2)_. The properties to be compared must be of the same type. Attempting to compare properties of different types causes MAPI or the service provider to return the error value MAPI_E_TOO_COMPLEX from the [IMAPITable](imapitableiunknown.md) method to which the structure is passed as a parameter. 
 *   
 * The result of a compare property value restriction is undefined when one or both of the properties do not exist. When a client requires well-defined behavior for such a restriction and is not sure whether the property exists, (for example, it is not a required column of a table) it should create an **AND** restriction to join the compare property restriction with an exist restriction. Use an [SExistRestriction](sexistrestriction.md) structure to define the exist restriction and an [SAndRestriction](sandrestriction.md) structure to define the **AND** restriction. 
 *   
 * The properties specified in the **ulPropTag1** and **ulPropTag2** members can be multi-valued if the service provider supports it. 
 *   
 * For more information about the **SComparePropsRestriction** structure and restrictions in general, see [About Restrictions](about-restrictions.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/scomparepropsrestriction
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SComparePropsRestriction extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * > Relational operator to use to compare the two properties. Possible values are as follows:
     *     
     *   - RELOP_GE: The comparison is made based on a greater or equal first value.
     *       
     *   - RELOP_GT: The comparison is made based on a greater first value.
     *       
     *   - RELOP_LE: The comparison is made based on a lesser or equal first value.
     *       
     *   - RELOP_LT: The comparison is made based on a lesser first value.
     *       
     *   - RELOP_NE: The comparison is made based on unequal values.
     *       
     *   - RELOP_RE: The comparison is made based on LIKE (regular expression) values.
     *       
     *   - RELOP_EQ: The comparison is made based on equal values.
     * @type {Integer}
     */
    relop {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Property tag of the first property to be compared.
     * @type {Integer}
     */
    ulPropTag1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Property tag of the second property to be compared.
     * @type {Integer}
     */
    ulPropTag2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

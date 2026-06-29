#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an error that relate to an operation involving a property for Outlook 2013 and Outlook 2016.
 * @remarks
 * An array of **SPropProblem** structures is returned from the following methods: 
 *   
 * - [IMAPISupport::DoCopyTo](imapisupport-docopyto.md)
 *     
 * - [IMAPISupport::DoCopyProps](imapisupport-docopyprops.md)
 *     
 * - [IMAPIProp::DeleteProps](imapiprop-deleteprops.md)
 *     
 * - [IMAPIProp::SetProps](imapiprop-setprops.md)
 *     
 * - [IMAPIProp::CopyProps](imapiprop-copyprops.md)
 *     
 * - [IMAPIProp::CopyTo](imapiprop-copyto.md)
 *     
 * - [IPropData::HrAddObjProps](ipropdata-hraddobjprops.md)
 *     
 * An **SPropProblem** structure contains an **SCODE** error value that results from an operation trying to modify or delete a MAPI property. 
 *   
 * For more information about how the **SPropProblem** structure works with errors related to properties, see [MAPI Named Properties](mapi-named-properties.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/spropproblem
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SPropProblem {
    #StructPack 4

    /**
     * > An index in an array of property tags.
     */
    ulIndex : UInt32

    /**
     * > Property tag for the property that has the error.
     */
    ulPropTag : UInt32

    /**
     * > Error value describing the problem with the property. This value can be any MAPI [SCODE](scode.md) value.
     */
    scode : Int32

}

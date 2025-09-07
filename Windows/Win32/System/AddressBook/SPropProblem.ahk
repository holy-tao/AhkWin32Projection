#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class SPropProblem extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * > An index in an array of property tags.
     * @type {Integer}
     */
    ulIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Property tag for the property that has the error.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Error value describing the problem with the property. This value can be any MAPI [SCODE](scode.md) value.
     * @type {Integer}
     */
    scode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

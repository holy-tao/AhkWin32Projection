#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of property tags. A property tag is a 32-bit unsigned integer that consists of two parts.
 * @remarks
 * A property tag is a 32-bit unsigned integer that consists of two parts: 
  *   
  * - An identifier in the high-order 16 bits.
  *     
  * - A type in the low-order 16 bits.
  *     
  * The identifier is a numeric value in a particular range. MAPI defines ranges for identifiers to describe what the property is used for and who is responsible for maintaining it. MAPI defines constraints for each of the property tags that it supports in the Mapitags.h header file.
  *   
  * The type indicates the format for the property's value. MAPI defines constants for each of the property types that it supports in the Mapidefs.h header file. 
  *   
  * For more information about property tags and their components, see one of the following topics: 
  *   
  * [MAPI Property Tags](mapi-property-tags.md)
  *   
  * [MAPI Property Identifier Overview](mapi-property-identifier-overview.md)
  *   
  * [MAPI Property Type Overview](mapi-property-type-overview.md)
  *   
  * For a complete list of the single-valued and multi-valued property types, see the appendix, [Property Identifiers and Types](property-identifiers-and-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sproptagarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SPropTagArray extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Count of property tags in the array indicated by the **aulPropTag** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Array of property tags.
     * @type {Array<UInt32>}
     */
    aulPropTag{
        get {
            if(!this.HasProp("__aulPropTagProxyArray"))
                this.__aulPropTagProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__aulPropTagProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a named property. Named properties enable clients to define custom properties in a larger namespace than the MAPI-defined property identifier range.
 * @remarks
 * The **MAPINAMEID** structure is used to describe named properties properties that have identifiers over 0x8000. A property set is an important part a named property. For example PS_PUBLIC_STRINGS or PS_ROUTING_ADDRTYPE are property sets defined by MAPI. 
  *   
  * Named properties enable clients to define custom properties in a larger namespace than is available in the MAPI-defined property identifier range. Property names cannot be used to obtain property values directly; they must first be mapped to property identifiers through the [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md) method. For particular objects such as messages, MAPI reserves a range of property identifiers for custom properties. Therefore, for these objects, clients do not have to use named properties and can save the associated overhead. 
  *   
  * For more information about named properties, see [Named Properties](mapi-named-properties.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapinameid
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class MAPINAMEID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * > Pointer to a [GUID](guid.md) structure defining a particular property set; this member cannot be NULL. Valid values are as follows: 
     *     
     * PS_PUBLIC_STRINGS
     *   
     * > 
     *     
     * PS_MAPI
     *   
     * > 
     *     
     * A client-defined value
     *   
     * >
     * @type {Pointer<Guid>}
     */
    lpguid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * > Value describing the type of value in the **Kind** member. Valid values are as follows: 
     *     
     * MNID_ID 
     *   
     * > The **Kind** member contains an integer value that represents the property name. 
     *     
     * MNID_STRING 
     *   
     * > The **Kind** member contains a Unicode character string representing the property name.
     * @type {Integer}
     */
    ulKind {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    lID {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    lpwstrName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

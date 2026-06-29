#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

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
 */
export default struct MAPINAMEID {
    #StructPack 8


    struct _Kind {
        lID : Int32

        static __New() {
            DefineProp(this.Prototype, 'lpwstrName', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

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
     */
    lpguid : Guid.Ptr

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
     */
    ulKind : UInt32

    /**
     * > Union describing the name of the named property. The name can be either an integer value, stored in **lID**, or a Unicode character string, stored in **lpwstrName**.
     */
    Kind : MAPINAMEID._Kind

}

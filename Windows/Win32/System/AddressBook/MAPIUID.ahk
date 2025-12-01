#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MAPIUID is a byte-order independent version of a GUID structure that is used to uniquely identify a service provider.
 * @remarks
 * A **MAPIUID** structure is a **GUID** structure put into Intel® processor byte order. 
 *   
 * MAPI creates **MAPIUID** structures in a way that makes it very rare for two different items to have the same identifier. **MAPIUID** structures can be stored as binary properties or as files, without regard to the byte ordering of the computer storing or accessing the information. 
 *   
 *  **MAPIUID** structures are used: 
 *   
 * - To identify a profile section.
 *     
 * - In the entry identifiers of message store and address book objects to identify the responsible service provider.
 *     
 * - In the **PR_SEARCH_KEY** ([PidTagSearchKey](pidtagsearchkey-canonical-property.md)) property of messages.
 *     
 * To generate a **MAPIUID** identifier for a search key, service providers call [IMAPISupport::NewUID](imapisupport-newuid.md).
 *   
 * When a client transmits a message across a network, it should use a protocol or transmission format that does not change the byte order of **MAPIUID** data. 
 *   
 * For more information about how **MAPIUID** structures are used, see the following topics: 
 *   
 * [Registering Service Provider Unique Identifiers](registering-service-provider-unique-identifiers.md)
 *   
 * [Setting Transport Order](setting-transport-order.md)
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapiuid
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class MAPIUID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * > An array that contains a 16-byte identifier.
     * @type {Array<Byte>}
     */
    ab{
        get {
            if(!this.HasProp("__abProxyArray"))
                this.__abProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__abProxyArray
        }
    }
}

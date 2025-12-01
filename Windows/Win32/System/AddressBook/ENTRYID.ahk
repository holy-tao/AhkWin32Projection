#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * ENTRYID contains an entry identifier for a MAPI object. This article describes its syntax, members, and remarks.
 * @remarks
 * The **ENTRYID** structure is used by message store and address book providers to construct unique identifiers for their objects. Entry identifiers are used to identify the following types of objects: 
 *   
 * - Message stores
 *     
 * - Folders
 *     
 * - Messages
 *     
 * - Address book containers
 *     
 * - Distribution lists
 *     
 * - Messaging users
 *     
 * - Status objects
 *     
 * - Profile sections
 *     
 * Each provider uses a format for the **ENTRYID** structure that makes sense for that provider. 
 *   
 * Entry identifiers cannot be compared directly because one object can be represented by two different binary values. To determine whether two entry identifiers represent the same object, call the [IMAPISession::CompareEntryIDs](imapisession-compareentryids.md) method. 
 *   
 * When a client calls an object's [IMAPIProp::GetProps](imapiprop-getprops.md) method to retrieve its entry identifier, the object returns the most permanent form of the entry identifier. A client can verify that an entry identifier is long-term by checking that none of the flags are set in the first byte of the **abFlags** member. 
 *   
 * When a client accesses an entry identifier through a column in a table, most likely this entry identifier is short-term instead of long-term. Short-term entry identifiers can be used to open their corresponding objects only in the current MAPI session. A client can verify that an entry identifier is short-term by checking that all of the flags are set in the first byte of the **abFlags** member. 
 *   
 * Some entry identifiers are short-term, but have long-term use. Such an entry identifier will have one or more of the appropriate flags set in the first byte of its **abFlags** member. 
 *   
 * An **ENTRYID** structure resembles a [FLATENTRY](flatentry.md) structure. However, there are some differences: 
 *   
 * - An **ENTRYID** structure does not store the size of the entry identifier; a **FLATENTRY** structure does. 
 *     
 * - An **ENTRYID** structure stores the flag data and the rest of the entry identifier separately; a **FLATENTRY** structure stores the flag data with the rest of the entry identifier. 
 *     
 * - An **ENTRYID** structure is passed as a parameter to the methods of the [IMAPIProp](imapipropiunknown.md) interface and to the following **OpenEntry** methods: [IABLogon::OpenEntry](iablogon-openentry.md), [IAddrBook::OpenEntry](iaddrbook-openentry.md), [IMAPIContainer::OpenEntry](imapicontainer-openentry.md), [IMAPISession::OpenEntry](imapisession-openentry.md), [IMAPISupport::OpenEntry](imapisupport-openentry.md), [IMsgStore::OpenEntry](imsgstore-openentry.md), [IMSLogon::OpenEntry](imslogon-openentry.md)
 *     
 * - An **ENTRYID** structure is used to store an entry identifier on disk. A **FLATENTRY** structure is used to store an entry identifier in a file or pass it in a stream of bytes. 
 *     
 * Clients should always pass in naturally aligned entry identifiers. Although providers should handle arbitrarily aligned entry identifiers, clients should not expect this behavior. Failure to pass a good aligned entry identifier to a method can cause an alignment fault on RISC processors. 
 *   
 * The natural alignment factor, typically 8 bytes, is the largest data type supported by the CPU, and usually the same alignment factor used by the system memory allocator. A naturally aligned memory address allows the CPU to access any data type it supports at that address without generating an alignment fault. For RISC CPUs, a data type of size N bytes must usually be aligned on an even multiple of N bytes, with the address being an even multiple of N.
 *   
 * For more information, see [Entry Identifiers](mapi-entry-identifiers.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/entryid
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ENTRYID extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * > Bitmask of flags that provide information that describes the object. Only the first byte of the flags, **abFlags[0]**, may be set by the provider; the other three are reserved. These flags must not be set for permanent entry identifiers; they are only set for short-term entry identifiers. To clients, this structure is read-only. The following flags can be set in **abFlags[0]**:
     *     
     * MAPI_NOTRECIP 
     *   
     * > The entry identifier cannot be used as a recipient on a message.
     *     
     * MAPI_NOTRESERVED 
     *   
     * > Other users cannot access the entry identifier.
     *     
     * MAPI_NOW 
     *   
     * > The entry identifier cannot be used at other times.
     *     
     * MAPI_SHORTTERM 
     *   
     * > The entry identifier is short-term. All other values in this byte must be set unless other uses of the entry identifier are enabled.
     *     
     * MAPI_THISSESSION 
     *   
     * > The entry identifier cannot be used on other sessions.
     * @type {Array<Byte>}
     */
    abFlags{
        get {
            if(!this.HasProp("__abFlagsProxyArray"))
                this.__abFlagsProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__abFlagsProxyArray
        }
    }

    /**
     * > Indicates an array of binary data that is used by service providers. The client application cannot use this array.
     * @type {Array<Byte>}
     */
    ab{
        get {
            if(!this.HasProp("__abProxyArray"))
                this.__abProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__abProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes FLATENTRY and provides syntax, members, and additional remarks.
 * @remarks
 * A **FLATENTRY** structure resembles an [ENTRYID](entryid.md) structure. However, there are some differences: 
  *   
  * - A **FLATENTRY** structure stores the size of the entry identifier; **ENTRYID** does not. 
  *     
  * - A **FLATENTRY** structure stores the flag data together with the rest of the entry identifier; **ENTRYID** stores them separately. 
  *     
  * - A **FLATENTRY** structure is used to store an entry identifier in a file or pass it in a stream of bytes whereas an **ENTRYID** structure is used by the [IMAPIProp](imapipropiunknown.md) interface methods and by the following **OpenEntry** methods: [IABLogon::OpenEntry](iablogon-openentry.md), [IAddrBook::OpenEntry](iaddrbook-openentry.md), [IMAPIContainer::OpenEntry](imapicontainer-openentry.md), [IMAPISession::OpenEntry](imapisession-openentry.md), [IMAPISupport::OpenEntry](imapisupport-openentry.md), [IMsgStore::OpenEntry](imsgstore-openentry.md), [IMSLogon::OpenEntry](imslogon-openentry.md)
  *     
  * - A **FLATENTRY** structure is used to store an entry identifier in a file or pass it in a stream of bytes. An **ENTRYID** structure is used to store an entry identifier on disk.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/flatentry
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class FLATENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Count of bytes in the **abEntry** member.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > The complete entry identifier that includes the array of flags and binary data.
     * @type {Array<Byte>}
     */
    abEntry{
        get {
            if(!this.HasProp("__abEntryProxyArray"))
                this.__abEntryProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__abEntryProxyArray
        }
    }
}

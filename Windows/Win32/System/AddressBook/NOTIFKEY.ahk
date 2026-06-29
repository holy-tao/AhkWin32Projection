#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the syntax, members, and remarks for NOTIFKEY, which uniquely identifies a connection between an advise sink, an advise source, and MAPI.
 * @remarks
 * The [Subscribe](imapisupport-subscribe.md) and [Notify](imapisupport-notify.md) methods of [IMAPISupport](imapisupportiunknown.md) use the **NOTIFKEY** structure to generate notifications to the appropriate advise sink about the appropriate advise source. 
 *   
 * Service providers generate notification keys when their **Advise** method is called and they want to call **Subscribe** to handle the notification registration and the subsequent sending of notifications. A notification key can be the entry identifier of the advise source or it can be any other identifying item such as a constant. For example, a message store provider might use the path of a folder as its notification key. 
 *   
 * The notification key should work across multiple processes. 
 *   
 * The scope requirements for a notification key resemble those for a long-term entry identifier. However, unlike an entry identifier, a notification key must be binary-comparable. Typically, a notification key includes a **GUID** value defined by the service provider followed by other provider-specific information unique to the object. 
 *   
 * For a discussion of the use of the **NOTIFKEY** structure to manage the connections between the advise sinks and the objects that generate the notifications, see [Supporting Event Notification](supporting-event-notification.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/notifkey
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct NOTIFKEY {
    #StructPack 4

    /**
     * > Count of bytes in the **ab** member.
     */
    cb : UInt32

    /**
     * > Array of bytes describing the notification key.
     */
    ab : Int8[1]

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides the property info, members, and remarks for NEWMAIL_NOTIFICATION, which describes information that relates to the arrival of a new message.
 * @remarks
 * The **NEWMAIL_NOTIFICATION** structure is one of the members of the union of structures included in the **info** member of the [NOTIFICATION](notification.md) structure. When the **info** member of a **NOTIFICATION** structure contains a **NEWMAIL_NOTIFICATION** structure, the **ulEventType** member of the **NOTIFICATION** structure is set to  _fnevNewMail._
  *   
  * MAPI uses the **NEWMAIL_NOTIFICATION** structure only as a member of the **NOTIFICATION** structure, which holds information about a notification event for the advise sink. 
  *   
  * For more information about notification, see the topics described in the following table.
  *   
  * |**Topic**|**Description**|
  * |:-----|:-----|
  * |[Event Notification in MAPI](event-notification-in-mapi.md) <br/> |General overview of notification and notification events. |
  * |[Handling Notifications](handling-notifications.md) <br/> |Discussion of how clients should handle notifications. |
  * |[Supporting Event Notification](supporting-event-notification.md) <br/> |Discussion of how service providers can use the [IMAPISupport](imapisupportiunknown.md) method to generate notifications. |
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/newmail_notification
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class NEWMAIL_NOTIFICATION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpEntryID** member.
     * @type {Integer}
     */
    cbEntryID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to the entry identifier of the newly arrived message.
     * @type {Pointer<ENTRYID>}
     */
    lpEntryID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpParentID** member.
     * @type {Integer}
     */
    cbParentID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * > Pointer to the entry identifier of the receive folder for the newly arrived message.
     * @type {Pointer<ENTRYID>}
     */
    lpParentID {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * > Bitmask of flags used to describe the format of the string properties included with the message. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The passed-in strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * > Pointer to the message class of the newly arrived message.
     * @type {Pointer<SByte>}
     */
    lpszMessageClass {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * > Bitmask of flags that describes the current state of the newly arrived message. The **ulMessageFlags** member is a copy of the message's **PR_MESSAGE_FLAGS** ([PidTagMessageFlags](pidtagmessageflags-canonical-property.md)) property.
     * @type {Integer}
     */
    ulMessageFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENTRYID.ahk" { ENTRYID }

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
 */
export default struct NEWMAIL_NOTIFICATION {
    #StructPack 8

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpEntryID** member.
     */
    cbEntryID : UInt32

    /**
     * > Pointer to the entry identifier of the newly arrived message.
     */
    lpEntryID : ENTRYID.Ptr

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpParentID** member.
     */
    cbParentID : UInt32

    /**
     * > Pointer to the entry identifier of the receive folder for the newly arrived message.
     */
    lpParentID : ENTRYID.Ptr

    /**
     * > Bitmask of flags used to describe the format of the string properties included with the message. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The passed-in strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     */
    ulFlags : UInt32

    /**
     * > Pointer to the message class of the newly arrived message.
     */
    lpszMessageClass : IntPtr

    /**
     * > Bitmask of flags that describes the current state of the newly arrived message. The **ulMessageFlags** member is a copy of the message's **PR_MESSAGE_FLAGS** ([PidTagMessageFlags](pidtagmessageflags-canonical-property.md)) property.
     */
    ulMessageFlags : UInt32

}

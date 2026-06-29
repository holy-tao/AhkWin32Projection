#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPropTagArray.ahk" { SPropTagArray }
#Import ".\ENTRYID.ahk" { ENTRYID }

/**
 * Contains information about an object that has undergone a change, such as being copied or modified.
 * @remarks
 * The **OBJECT_NOTIFICATION** structure is one of the members of the union of structures included in the **info** member of the [NOTIFICATION](notification.md) structure. When the **info** member of a **NOTIFICATION** structure contains an **OBJECT_NOTIFICATION** structure, the **ulEventType** member of the **NOTIFICATION** structure is set to one of the following types of events: 
 *   
 * - fnevObjectCreated
 *     
 * - fnevObjectModified
 *     
 * - fnevObjectDeleted
 *     
 * - fnevObjectMoved
 *     
 * - fnevObjectCopied
 *     
 * - fnevSearchComplete
 *     
 * The search complete event, represented by the fnevSearchComplete event type, indicates that the initial search of the domain for one search folder has completed.
 *   
 * The following members that contain information about the original object are used only in move and copy events. 
 *   
 * - **cbOldID**
 *     
 * - **lpOldID**
 *     
 * - **cbOldParentID**
 *     
 * - **lpOldParentID**
 *     
 * These members do not apply to the other types of events.
 *   
 * For more information about notification, see the topics described in the following table.
 *   
 * |**Topic**|**Description**|
 * |:-----|:-----|
 * |[Event Notification in MAPI](event-notification-in-mapi.md) <br/> |General overview of notification and notification events. |
 * |[Handling Notifications](handling-notifications.md) <br/> |Discussion of how clients should handle notifications. |
 * |[Supporting Event Notification](supporting-event-notification.md) <br/> |Discussion of how service providers can use the [IMAPISupport](imapisupportiunknown.md) method to generate notifications. |
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/object_notification
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct OBJECT_NOTIFICATION {
    #StructPack 8

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpEntryID** member.
     */
    cbEntryID : UInt32

    /**
     * > Pointer to the entry identifier of the affected object.
     */
    lpEntryID : ENTRYID.Ptr

    /**
     * > Type of object affected. Possible types are as follows:
     *     
     * MAPI_STORE 
     *   
     * > Message store. 
     *     
     * MAPI_ADDRBOOK 
     *   
     * > Address book. 
     *     
     * MAPI_FOLDER 
     *   
     * > Folder.
     *     
     * MAPI_ABCONT 
     *   
     * > Address book container.
     *     
     * MAPI_MESSAGE 
     *   
     * > Message.
     *     
     * MAPI_MAILUSER 
     *   
     * > Messaging user.
     *     
     * MAPI_ATTACH 
     *   
     * > Attachment.
     *     
     * MAPI_DISTLIST 
     *   
     * > Distribution list.
     *     
     * MAPI_PROFSECT 
     *   
     * > Profile section.
     *     
     * MAPI_STATUS 
     *   
     * > Status object.
     *     
     * MAPI_SESSION 
     *   
     * > Session object.
     */
    ulObjType : UInt32

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpParentID** member.
     */
    cbParentID : UInt32

    /**
     * > Pointer to the entry identifier of the parent of the affected object.
     */
    lpParentID : ENTRYID.Ptr

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpOldID** member.
     */
    cbOldID : UInt32

    /**
     * > Pointer to the entry identifier of the original object. This pointer can be NULL if the event does not require an original object.
     */
    lpOldID : ENTRYID.Ptr

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpOldParentID** member.
     */
    cbOldParentID : UInt32

    /**
     * > Pointer to the entry identifier of the parent of the original object. This pointer can be NULL if the event does not require an original object.
     */
    lpOldParentID : ENTRYID.Ptr

    /**
     * > Pointer to an [SPropTagArray](sproptagarray.md) structure that contains the property tags identifying properties affected by the event.
     */
    lpPropTagArray : SPropTagArray.Ptr

}

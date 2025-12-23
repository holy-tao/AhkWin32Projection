#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class OBJECT_NOTIFICATION extends Win32Struct
{
    static sizeof => 72

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
     * > Pointer to the entry identifier of the affected object.
     * @type {Pointer<ENTRYID>}
     */
    lpEntryID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

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
     * @type {Integer}
     */
    ulObjType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpParentID** member.
     * @type {Integer}
     */
    cbParentID {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * > Pointer to the entry identifier of the parent of the affected object.
     * @type {Pointer<ENTRYID>}
     */
    lpParentID {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpOldID** member.
     * @type {Integer}
     */
    cbOldID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * > Pointer to the entry identifier of the original object. This pointer can be NULL if the event does not require an original object.
     * @type {Pointer<ENTRYID>}
     */
    lpOldID {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * > Count of bytes in the entry identifier pointed to by the **lpOldParentID** member.
     * @type {Integer}
     */
    cbOldParentID {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * > Pointer to the entry identifier of the parent of the original object. This pointer can be NULL if the event does not require an original object.
     * @type {Pointer<ENTRYID>}
     */
    lpOldParentID {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * > Pointer to an [SPropTagArray](sproptagarray.md) structure that contains the property tags identifying properties affected by the event.
     * @type {Pointer<SPropTagArray>}
     */
    lpPropTagArray {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}

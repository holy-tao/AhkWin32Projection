#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a status object that has been affected by a change.
 * @remarks
 * The **STATUS_OBJECT_NOTIFICATION** structure is one of the members of the union of structures included in the **info** member of the [NOTIFICATION](notification.md) structure. The **STATUS_OBJECT_NOTIFICATION** structure is included with a status object notification for an event of type  _fnevStatusObjectModified_. Status object notification is an internal MAPI notification; clients and service providers cannot register for it and service providers cannot generate it.
 *   
 * For more information about notification, see the topics described in the following table.
 *   
 * |**Topic**|**Description**|
 * |:-----|:-----|
 * |[Event Notification in MAPI](event-notification-in-mapi.md) <br/> |General overview of notification and notification events. |
 * |[Handling Notifications](handling-notifications.md) <br/> |Discussion of how clients should handle notifications. |
 * |[Supporting Event Notification](supporting-event-notification.md) <br/> |Discussion of how service providers can use the **IMAPISupport** method to generate notifications. |
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/status_object_notification
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class STATUS_OBJECT_NOTIFICATION extends Win32Struct
{
    static sizeof => 32

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
     * > Pointer to the entry identifier of the changed status object.
     * @type {Pointer<ENTRYID>}
     */
    lpEntryID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * > Count of [SPropValue](spropvalue.md) structures in the array pointed to by the **lpPropVals** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * > Pointer to an array of **SPropValue** structures that describe the properties of the changed status object.
     * @type {Pointer<SPropValue>}
     */
    lpPropVals {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

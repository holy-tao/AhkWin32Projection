#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * EXTENDED_NOTIFICATION describes information that relates to an event that is service provider-specific.
 * @remarks
 * The **EXTENDED_NOTIFICATION** structure is one of the members of the union of structures included in the **info** member of the [NOTIFICATION](notification.md) structure. When the **info** member of a **NOTIFICATION** structure contains an **EXTENDED_NOTIFICATION** structure, the **ulEventType** member of the **NOTIFICATION** structure is set to  _fnevExtended_.
  *   
  * The extended event is defined by a service provider to represent a type of change that cannot be covered by any of the other predefined events. Only clients that know before they register that a service provider supports an extended event can register for that event. It is not possible for clients to determine without advanced knowledge if a service provider supports an extended event. If a service provider supports an extended event, it shows how to handle such an event when it is received.
  *   
  * An extended notification is sent by the session when a client logs off. Register for this notification by calling [IMAPISession::Advise](imapisession-advise.md) with the  _lpEntryID_ parameter set to NULL and the  _cbEntryID_ parameter set to zero. 
  *   
  * For more information about notification, see the topics described in the following table.
  *   
  * |**Topic**|**Description**|
  * |:-----|:-----|
  * |[Event Notification in MAPI](event-notification-in-mapi.md) <br/> |General overview of notification and notification events. |
  * |[Handling Notifications](handling-notifications.md) <br/> |Discussion of how clients should handle notifications. |
  * |[Supporting Event Notification](supporting-event-notification.md) <br/> |Discussion of how service providers can use the [IMAPISupport](imapisupportiunknown.md) methods to generate notifications. |
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/extended_notification
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class EXTENDED_NOTIFICATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Extended event code that is defined by the provider.
     * @type {Integer}
     */
    ulEvent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Count of bytes in the event-specific parameters pointed to by **pbEventParameters**.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Pointer to event-specific parameters. The type of parameters that are used depends on the value of the **ulEvent** member; these parameters are documented by the provider that issued the event.
     * @type {Pointer<Byte>}
     */
    pbEventParameters {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

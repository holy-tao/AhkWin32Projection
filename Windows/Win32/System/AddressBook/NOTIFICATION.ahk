#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ERROR_NOTIFICATION.ahk
#Include .\NEWMAIL_NOTIFICATION.ahk
#Include .\OBJECT_NOTIFICATION.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SBinary.ahk
#Include .\SShortArray.ahk
#Include .\SLongArray.ahk
#Include .\SRealArray.ahk
#Include .\SDoubleArray.ahk
#Include .\SCurrencyArray.ahk
#Include .\SAppTimeArray.ahk
#Include .\SDateTimeArray.ahk
#Include .\SBinaryArray.ahk
#Include .\SLPSTRArray.ahk
#Include .\SWStringArray.ahk
#Include .\SGuidArray.ahk
#Include .\SLargeIntegerArray.ahk
#Include .\__UPV.ahk
#Include .\SPropValue.ahk
#Include .\SRow.ahk
#Include .\TABLE_NOTIFICATION.ahk
#Include .\EXTENDED_NOTIFICATION.ahk
#Include .\STATUS_OBJECT_NOTIFICATION.ahk

/**
 * NOTIFICATION contains information about an event that has occurred and the data that has been affected by the event.
 * @remarks
 * One or more **NOTIFICATION** structures are passed as input parameters with every call to a registered advise sink's [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method. The **NOTIFICATION** structures contain information about the particular events that have occurred and describe the affected objects. 
 *   
 * Before clients or service providers receiving a notification can use the structure to process the event, they must check the event type as indicated in the **ulEventType** member. For example, the code sample that is shown here checks for the arrival of a new message and upon detecting an event of this kind, prints out the message class of the message. 
 *   
 * ```cpp
 * if (pNotif -> ulEventType == fnevNewMail)
 * {
 * printf("%s\n", pNotif -> newmail.lpszMessageClass)
 * }
 * 
 * ```
 * 
 * For more information about notification, see the topics described in the following table.
 *   
 * |**Topic**|**Description**|
 * |:-----|:-----|
 * |[Event Notification in MAPI](event-notification-in-mapi.md) <br/> |General overview of notification and notification events. |
 * |[Handling Notifications](handling-notifications.md) <br/> |Discussion of how clients should handle notifications. |
 * |[Supporting Event Notification](supporting-event-notification.md) <br/> |Discussion of how service providers can use the [IMAPISupport](imapisupportiunknown.md) method to generate notifications. |
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/notification
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class NOTIFICATION extends Win32Struct
{
    static sizeof => 680

    static packingSize => 8

    class _info_e__Union extends Win32Struct {
        static sizeof => 672
        static packingSize => 8

        /**
         * @type {ERROR_NOTIFICATION}
         */
        err{
            get {
                if(!this.HasProp("__err"))
                    this.__err := ERROR_NOTIFICATION(0, this)
                return this.__err
            }
        }
    
        /**
         * @type {NEWMAIL_NOTIFICATION}
         */
        newmail{
            get {
                if(!this.HasProp("__newmail"))
                    this.__newmail := NEWMAIL_NOTIFICATION(0, this)
                return this.__newmail
            }
        }
    
        /**
         * @type {OBJECT_NOTIFICATION}
         */
        obj{
            get {
                if(!this.HasProp("__obj"))
                    this.__obj := OBJECT_NOTIFICATION(0, this)
                return this.__obj
            }
        }
    
        /**
         * @type {TABLE_NOTIFICATION}
         */
        tab{
            get {
                if(!this.HasProp("__tab"))
                    this.__tab := TABLE_NOTIFICATION(0, this)
                return this.__tab
            }
        }
    
        /**
         * @type {EXTENDED_NOTIFICATION}
         */
        ext{
            get {
                if(!this.HasProp("__ext"))
                    this.__ext := EXTENDED_NOTIFICATION(0, this)
                return this.__ext
            }
        }
    
        /**
         * @type {STATUS_OBJECT_NOTIFICATION}
         */
        statobj{
            get {
                if(!this.HasProp("__statobj"))
                    this.__statobj := STATUS_OBJECT_NOTIFICATION(0, this)
                return this.__statobj
            }
        }
    
    }

    /**
     * > Type of notification event that occurred. The value of the **ulEventType** member corresponds to the structure that is included in the **info** union. The **ulEventType** member can be set to one of the following values:
     * @type {Integer}
     */
    ulEventType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulAlignPad {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Union of notification structures describing the affected data for a particular type of event. The structure included in the **info** member depends on the value of the **ulEventType** member.
     * @type {_info_e__Union}
     */
    info{
        get {
            if(!this.HasProp("__info"))
                this.__info := %this.__Class%._info_e__Union(8, this)
            return this.__info
        }
    }
}

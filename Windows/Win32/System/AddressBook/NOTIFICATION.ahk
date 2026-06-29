#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SBinary.ahk" { SBinary }
#Import ".\SDoubleArray.ahk" { SDoubleArray }
#Import "..\Com\CY.ahk" { CY }
#Import ".\ENTRYID.ahk" { ENTRYID }
#Import ".\ERROR_NOTIFICATION.ahk" { ERROR_NOTIFICATION }
#Import ".\TABLE_NOTIFICATION.ahk" { TABLE_NOTIFICATION }
#Import ".\SRow.ahk" { SRow }
#Import ".\SLongArray.ahk" { SLongArray }
#Import ".\SGuidArray.ahk" { SGuidArray }
#Import ".\SDateTimeArray.ahk" { SDateTimeArray }
#Import ".\OBJECT_NOTIFICATION.ahk" { OBJECT_NOTIFICATION }
#Import ".\SLargeIntegerArray.ahk" { SLargeIntegerArray }
#Import ".\SLPSTRArray.ahk" { SLPSTRArray }
#Import ".\SBinaryArray.ahk" { SBinaryArray }
#Import ".\SPropValue.ahk" { SPropValue }
#Import ".\__UPV.ahk" { __UPV }
#Import ".\SPropTagArray.ahk" { SPropTagArray }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\NEWMAIL_NOTIFICATION.ahk" { NEWMAIL_NOTIFICATION }
#Import ".\SRealArray.ahk" { SRealArray }
#Import ".\SShortArray.ahk" { SShortArray }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\STATUS_OBJECT_NOTIFICATION.ahk" { STATUS_OBJECT_NOTIFICATION }
#Import ".\SAppTimeArray.ahk" { SAppTimeArray }
#Import ".\MAPIERROR.ahk" { MAPIERROR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EXTENDED_NOTIFICATION.ahk" { EXTENDED_NOTIFICATION }
#Import ".\SWStringArray.ahk" { SWStringArray }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\SCurrencyArray.ahk" { SCurrencyArray }

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
 */
export default struct NOTIFICATION {
    #StructPack 8


    struct _info {
        err : ERROR_NOTIFICATION

        static __New() {
            DefineProp(this.Prototype, 'newmail', { type: NEWMAIL_NOTIFICATION, offset: 0 })
            DefineProp(this.Prototype, 'obj', { type: OBJECT_NOTIFICATION, offset: 0 })
            DefineProp(this.Prototype, 'tab', { type: TABLE_NOTIFICATION, offset: 0 })
            DefineProp(this.Prototype, 'ext', { type: EXTENDED_NOTIFICATION, offset: 0 })
            DefineProp(this.Prototype, 'statobj', { type: STATUS_OBJECT_NOTIFICATION, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * > Type of notification event that occurred. The value of the **ulEventType** member corresponds to the structure that is included in the **info** union. The **ulEventType** member can be set to one of the following values:
     */
    ulEventType : UInt32

    ulAlignPad : UInt32

    /**
     * > Union of notification structures describing the affected data for a particular type of event. The structure included in the **info** member depends on the value of the **ulEventType** member.
     */
    info : NOTIFICATION._info

}

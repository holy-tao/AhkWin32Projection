#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NOTIFICATION.ahk" { NOTIFICATION }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements an advise sink object for handling notification. A pointer to an advise sink object is passed in a call to a service provider's Advise method.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiadvisesinkiunknown
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct IMAPIAdviseSink extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMAPIAdviseSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMAPIAdviseSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IMAPIAdviseSinkOnNotify responds to a notification by performing one or more tasks, which depend on the type of event and object that generate the notification.
     * @remarks
     * The notification process starts when a client or MAPI makes a call to a service provider's **Advise** method to register to receive a notification of a particular type for a particular object. One of the parameters to the **Advise** method is a pointer to an advise sink object that implements the [IMAPIAdviseSink](imapiadvisesinkiunknown.md) interface. When an event occurs to the target object that corresponds to the registered notification, the service provider, either directly or indirectly through MAPI, calls the advise sink's **OnNotify** method. 
     *   
     * The call to **OnNotify** can occur either during the MAPI call that is causing the event or at some later time. On systems that support multiple threads of execution, **OnNotify** can be called either on the same thread that was used for registration or on a different thread. Clients can make sure that the **OnNotify** call is made on the same thread used to call **Advise** by creating the advise sink that they pass to **Advise** with the [HrThisThreadAdviseSink](hrthisthreadadvisesink.md) function. 
     *   
     * The  _lpNotifications_ parameter points to one or more **NOTIFICATION** structures that describe what has changed during the event. There is a different type of **NOTIFICATION** structure for each type of event. 
     *   
     * The following table lists the values that are used to represent the possible types of events and the structures associated with each value:
     *   
     * |**Notification event type**|**Corresponding structure**|
     * |:-----|:-----|
     * |**fnevCriticalError** <br/> |[ERROR_NOTIFICATION](error_notification.md) <br/> |
     * |**fnevNewMail** <br/> |[NEWMAIL_NOTIFICATION](newmail_notification.md) <br/> |
     * |**fnevObjectCreated** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevObjectDeleted** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevObjectModified** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevObjectCopied** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevSearchComplete** <br/> |[OBJECT_NOTIFICATION](object_notification.md) <br/> |
     * |**fnevTableModified** <br/> |[TABLE_NOTIFICATION](table_notification.md) <br/> |
     * |**fnevStatusObjectModified** <br/> |[STATUS_OBJECT_NOTIFICATION](status_object_notification.md) <br/> |
     * |**fnevExtended** <br/> |[EXTENDED_NOTIFICATION](extended_notification.md) <br/> |
     *    
     * For more information about how to set up and stop notifications, see the reference entries for the **Advise** and **Unadvise** methods for any of the following interfaces: [IABLogon](iablogoniunknown.md), [IAddrBook](iaddrbookimapiprop.md), [IMAPIForm](imapiformiunknown.md), [IMAPISession](imapisessioniunknown.md), [IMAPITable](imapitableiunknown.md), [IMsgStore](imsgstoreimapiprop.md), and [IMSLogon](imslogoniunknown.md). 
     *   
     * For general information about the notification process, see [Event Notification in MAPI](event-notification-in-mapi.md).
     * @param {Integer} cNotif > [in] The count of [NOTIFICATION](notification.md) structures pointed to by the  _lpNotifications_ parameter.
     * @param {Pointer<NOTIFICATION>} lpNotifications > [in] A pointer to one or more **NOTIFICATION** structures that provide information about the events that have occurred.
     * @returns {Integer} S_OK 
     *   
     * > The notification was processed successfully.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiadvisesink-onnotify
     */
    OnNotify(cNotif, lpNotifications) {
        result := ComCall(3, this, "uint", cNotif, NOTIFICATION.Ptr, lpNotifications, UInt32)
        return result
    }

    Query(iid) {
        if (IMAPIAdviseSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNotify := CallbackCreate(GetMethod(implObj, "OnNotify"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNotify)
    }
}

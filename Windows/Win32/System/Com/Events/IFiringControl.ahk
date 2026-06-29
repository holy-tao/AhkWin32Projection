#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IDispatch.ahk" { IDispatch }
#Import ".\IEventSubscription.ahk" { IEventSubscription }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Fires an event to a single subscription.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ifiringcontrol
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IFiringControl extends IDispatch {
    /**
     * The interface identifier for IFiringControl
     * @type {Guid}
     */
    static IID := Guid("{e0498c93-4efe-11d1-9971-00c04fbbb345}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFiringControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        FireSubscription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFiringControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Fires an event to a single subscriber.
     * @remarks
     * The <b>FireSubscription</b> method fires an event to the subscriber associated with the subscription object identified by the <i>subscription</i> parameter. A publisher filter typically iterates through a filtered list of subscriptions and calls <b>FireSubscription</b> for each associated subscriber. All standard delivery processing is done by the event object for the subscription, including the following: 
     * 
     * 
     * 
     * <ul>
     * <li>Any standard parameter filtering.
     * </li>
     * <li>Activating the subscriber object (optional, for persistent subscriptions).
     * </li>
     * <li>Depending on parameter filtering, invoking the event method that originally caused entry into the publisher filter on the subscriber.
     * </li>
     * </ul>
     * @param {IEventSubscription} subscription A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsubscription">IEventSubscription</a> interface on a subscription object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ifiringcontrol-firesubscription
     */
    FireSubscription(subscription) {
        result := ComCall(7, this, "ptr", subscription, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFiringControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FireSubscription := CallbackCreate(GetMethod(implObj, "FireSubscription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FireSubscription)
    }
}

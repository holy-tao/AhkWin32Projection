#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import ".\IFiringControl.ahk" { IFiringControl }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Acts as a callback interface so that event publishers can control which subscribers receive event notifications or the order in which subscribers are notified.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ipublisherfilter
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IPublisherFilter extends IUnknown {
    /**
     * The interface identifier for IPublisherFilter
     * @type {Guid}
     */
    static IID := Guid("{465e5cc0-7b26-11d1-88fb-0080c7d771bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPublisherFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize    : IntPtr
        PrepareToFire : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPublisherFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates an event method with a collection of subscription objects.
     * @remarks
     * The publisher filter uses the pointer passed in dispUserDefined to obtain a list of subscribers, either by calling <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsystem-query">IEventSystem::Query</a> or <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventcontrol-getsubscriptions">IEventControl::GetSubscriptions</a>.
     * @param {BSTR} methodName The name of the event method associated with the publisher filter.
     * @param {IDispatch} dispUserDefined A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventsystem">IEventSystem</a> interface on an event system object or to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventcontrol">IEventControl</a> interface on an event class object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The publisher filter was successfully initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_SOME_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was able to invoke some, but not all, of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_ALL_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was unable to invoke any of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_NOSUBSCRIBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was published but there were no subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_QUERYSYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A syntax error occurred while trying to evaluate a query string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_QUERYFIELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid field name was used in a query string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_INTERNALEXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception was raised.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_INTERNALERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected internal error was detected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_INVALID_PER_USER_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The owner SID on a per-user subscription does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_USER_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user-supplied component or subscriber raised an exception.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_TOO_MANY_METHODS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An interface has too many methods from which to fire events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_MISSING_EVENTCLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A subscription cannot be stored unless the event class for the subscription already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_NOT_ALL_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all of the requested objects could be removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_COMPLUS_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM+ is required for this operation, but it is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ipublisherfilter-initialize
     */
    Initialize(methodName, dispUserDefined) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(3, this, BSTR, methodName, "ptr", dispUserDefined, "HRESULT")
        return result
    }

    /**
     * Prepares a publisher filter to begin firing a filtered list of subscriptions using a provided firing control. The firing control is contained in the event class object.
     * @param {BSTR} methodName The name of the event method to be fired.
     * @param {IFiringControl} firingControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ifiringcontrol">IFiringControl</a> interface on the firing control object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event class object is ready to fire the event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_SOME_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was able to invoke some, but not all, of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_ALL_SUBSCRIBERS_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was unable to invoke any of the subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_S_NOSUBSCRIBERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An event was published but there were no subscribers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_QUERYSYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A syntax error occurred while trying to evaluate a query string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_QUERYFIELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid field name was used in a query string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_INTERNALEXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception was raised.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_INTERNALERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected internal error was detected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_INVALID_PER_USER_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The owner SID on a per-user subscription does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_USER_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user-supplied component or subscriber raised an exception.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_TOO_MANY_METHODS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An interface has too many methods from which to fire events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_MISSING_EVENTCLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A subscription cannot be stored unless the event class for the subscription already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_NOT_ALL_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all of the requested objects could be removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EVENT_E_COMPLUS_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM+ is required for this operation, but it is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ipublisherfilter-preparetofire
     */
    PrepareToFire(methodName, firingControl) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(4, this, BSTR, methodName, "ptr", firingControl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPublisherFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.PrepareToFire := CallbackCreate(GetMethod(implObj, "PrepareToFire"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.PrepareToFire)
    }
}

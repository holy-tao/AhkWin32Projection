#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFiringControl.ahk" { IFiringControl }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }
#Import ".\IMultiInterfaceEventControl.ahk" { IMultiInterfaceEventControl }

/**
 * Manages a filtered subscription cache for an event method.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-imultiinterfacepublisherfilter
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IMultiInterfacePublisherFilter extends IUnknown {
    /**
     * The interface identifier for IMultiInterfacePublisherFilter
     * @type {Guid}
     */
    static IID := Guid("{465e5cc1-7b26-11d1-88fb-0080c7d771bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultiInterfacePublisherFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize    : IntPtr
        PrepareToFire : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultiInterfacePublisherFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates an event class with a publisher filter.
     * @remarks
     * The publisher filter uses the pointer passed in <i>pIEC</i> to obtain a list of subscribers, by calling <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-imultiinterfaceeventcontrol-getsubscriptions">IMultiInterfaceEventControl::GetSubscriptions</a>.
     * @param {IMultiInterfaceEventControl} pEIC A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-imultiinterfaceeventcontrol">IMultiInterfaceEventControl</a> interface on an event class object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfacepublisherfilter-initialize
     */
    Initialize(pEIC) {
        result := ComCall(3, this, "ptr", pEIC, "HRESULT")
        return result
    }

    /**
     * Prepares the publisher filter to begin firing a filtered list of subscriptions using a provided firing control. The firing control is contained in the event class object.
     * @remarks
     * Prior to invoking the application event interface method, the event object invokes this method one time on the publisher filter for each published event.
     * @param {Pointer<Guid>} iid The interface ID of the interface being fired.
     * @param {BSTR} methodName The name of the event method to be fired.
     * @param {IFiringControl} firingControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ifiringcontrol">IFiringControl</a> interface on the firing control object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-imultiinterfacepublisherfilter-preparetofire
     */
    PrepareToFire(iid, methodName, firingControl) {
        methodName := methodName is String ? BSTR.Alloc(methodName).Value : methodName

        result := ComCall(4, this, Guid.Ptr, iid, BSTR, methodName, "ptr", firingControl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMultiInterfacePublisherFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.PrepareToFire := CallbackCreate(GetMethod(implObj, "PrepareToFire"), flags, 4)
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

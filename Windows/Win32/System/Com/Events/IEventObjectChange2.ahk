#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMEVENTSYSCHANGEINFO.ahk" { COMEVENTSYSCHANGEINFO }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Notifies subscribers of changes to the event store while including partition and application ID information.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventobjectchange2
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventObjectChange2 extends IUnknown {
    /**
     * The interface identifier for IEventObjectChange2
     * @type {Guid}
     */
    static IID := Guid("{7701a9c3-bd68-438f-83e0-67bf4f53a422}")

    /**
     * The class identifier for EventObjectChange2
     * @type {Guid}
     */
    static CLSID := Guid("{bb07bacd-cd56-4e63-a8ff-cbf0355fb9f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventObjectChange2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ChangedSubscription : IntPtr
        ChangedEventClass   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventObjectChange2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that a subscription object has been added, modified, or deleted. (IEventObjectChange2.ChangedSubscription)
     * @param {Pointer<COMEVENTSYSCHANGEINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/eventsys/ns-eventsys-comeventsyschangeinfo">COMEVENTSYSCHANGEINFO</a> structure.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectchange2-changedsubscription
     */
    ChangedSubscription(pInfo) {
        result := ComCall(3, this, COMEVENTSYSCHANGEINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    /**
     * Indicates that an event class object has been added, modified, or deleted. (IEventObjectChange2.ChangedEventClass)
     * @param {Pointer<COMEVENTSYSCHANGEINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/eventsys/ns-eventsys-comeventsyschangeinfo">COMEVENTSYSCHANGEINFO</a> structure.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectchange2-changedeventclass
     */
    ChangedEventClass(pInfo) {
        result := ComCall(4, this, COMEVENTSYSCHANGEINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventObjectChange2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ChangedSubscription := CallbackCreate(GetMethod(implObj, "ChangedSubscription"), flags, 2)
        this.vtbl.ChangedEventClass := CallbackCreate(GetMethod(implObj, "ChangedEventClass"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ChangedSubscription)
        CallbackFree(this.vtbl.ChangedEventClass)
    }
}

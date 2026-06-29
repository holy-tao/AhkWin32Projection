#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Notifies the subscriber of the specified user-defined metrics.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomuserevent
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComUserEvent extends IUnknown {
    /**
     * The interface identifier for IComUserEvent
     * @type {Guid}
     */
    static IID := Guid("{683130a4-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComUserEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUserEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComUserEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provided for user components to generate user-defined events.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<VARIANT>} pvarEvent The user-defined information.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomuserevent-onuserevent
     */
    OnUserEvent(pInfo, pvarEvent) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, VARIANT.Ptr, pvarEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComUserEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUserEvent := CallbackCreate(GetMethod(implObj, "OnUserEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUserEvent)
    }
}

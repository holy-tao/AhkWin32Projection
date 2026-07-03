#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber when the tracking information for a collection changes.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomtrackinginfoevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComTrackingInfoEvents extends IUnknown {
    /**
     * The interface identifier for IComTrackingInfoEvents
     * @type {Guid}
     */
    static IID := Guid("{4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComTrackingInfoEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNewTrackingInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComTrackingInfoEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when the tracking information for a collection changes.
     * @param {IUnknown} pToplevelCollection A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the collection for which the tracking information has changed.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfoevents-onnewtrackinginfo
     */
    OnNewTrackingInfo(pToplevelCollection) {
        result := ComCall(3, this, "ptr", pToplevelCollection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComTrackingInfoEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNewTrackingInfo := CallbackCreate(GetMethod(implObj, "OnNewTrackingInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNewTrackingInfo)
    }
}

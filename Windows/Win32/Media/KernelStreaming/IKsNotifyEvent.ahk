#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsNotifyEvent extends IUnknown {
    /**
     * The interface identifier for IKsNotifyEvent
     * @type {Guid}
     */
    static IID := Guid("{412bd695-f84b-46c1-ac73-54196dbc8fa7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsNotifyEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsNotifyEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsNotifyEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Event 
     * @param {Pointer} lParam1 
     * @param {Pointer} lParam2 
     * @returns {HRESULT} 
     */
    KsNotifyEvent(Event, lParam1, lParam2) {
        result := ComCall(3, this, "uint", Event, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKsNotifyEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsNotifyEvent := CallbackCreate(GetMethod(implObj, "KsNotifyEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsNotifyEvent)
    }
}

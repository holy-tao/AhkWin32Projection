#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AMTunerEventType.ahk" { AMTunerEventType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This callback interface has been deprecated, because the TV Tuner filter does not implement the callback mechanism. .
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamtunernotification
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMTunerNotification extends IUnknown {
    /**
     * The interface identifier for IAMTunerNotification
     * @type {Guid}
     */
    static IID := Guid("{211a8760-03ac-11d1-8d13-00aa00bd8339}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMTunerNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMTunerNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IAMTunerNotification interface is deprecated. The OnEvent method handles events from the TV tuner card.
     * @param {AMTunerEventType} Event Flag identifying the type of event. Currently, the only value defined is AMTUNER_EVENT_CHANGED.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtunernotification-onevent
     */
    OnEvent(Event) {
        result := ComCall(3, this, AMTunerEventType, Event, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMTunerNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnEvent := CallbackCreate(GetMethod(implObj, "OnEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnEvent)
    }
}

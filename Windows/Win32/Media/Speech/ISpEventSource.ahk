#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPEVENT.ahk" { SPEVENT }
#Import ".\ISpNotifySource.ahk" { ISpNotifySource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPEVENTSOURCEINFO.ahk" { SPEVENTSOURCEINFO }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpEventSource extends ISpNotifySource {
    /**
     * The interface identifier for ISpEventSource
     * @type {Guid}
     */
    static IID := Guid("{be7a9cce-5f9e-11d2-960f-00c04f8ee628}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpEventSource interfaces
    */
    struct Vtbl extends ISpNotifySource.Vtbl {
        SetInterest : IntPtr
        GetEvents   : IntPtr
        GetInfo     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpEventSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ullEventInterest 
     * @param {Integer} ullQueuedInterest 
     * @returns {HRESULT} 
     */
    SetInterest(ullEventInterest, ullQueuedInterest) {
        result := ComCall(10, this, "uint", ullEventInterest, "uint", ullQueuedInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<SPEVENT>} pEventArray 
     * @param {Pointer<Integer>} pulFetched 
     * @returns {HRESULT} 
     */
    GetEvents(ulCount, pEventArray, pulFetched) {
        pulFetchedMarshal := pulFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", ulCount, SPEVENT.Ptr, pEventArray, pulFetchedMarshal, pulFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPEVENTSOURCEINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetInfo(pInfo) {
        result := ComCall(12, this, SPEVENTSOURCEINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpEventSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInterest := CallbackCreate(GetMethod(implObj, "SetInterest"), flags, 3)
        this.vtbl.GetEvents := CallbackCreate(GetMethod(implObj, "GetEvents"), flags, 4)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInterest)
        CallbackFree(this.vtbl.GetEvents)
        CallbackFree(this.vtbl.GetInfo)
    }
}

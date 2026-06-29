#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPEVENT.ahk" { SPEVENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpEventSink extends IUnknown {
    /**
     * The interface identifier for ISpEventSink
     * @type {Guid}
     */
    static IID := Guid("{be7a9cc9-5f9e-11d2-960f-00c04f8ee628}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddEvents        : IntPtr
        GetEventInterest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPEVENT>} pEventArray 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     */
    AddEvents(pEventArray, ulCount) {
        result := ComCall(3, this, SPEVENT.Ptr, pEventArray, "uint", ulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pullEventInterest 
     * @returns {HRESULT} 
     */
    GetEventInterest(pullEventInterest) {
        pullEventInterestMarshal := pullEventInterest is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pullEventInterestMarshal, pullEventInterest, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddEvents := CallbackCreate(GetMethod(implObj, "AddEvents"), flags, 3)
        this.vtbl.GetEventInterest := CallbackCreate(GetMethod(implObj, "GetEventInterest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddEvents)
        CallbackFree(this.vtbl.GetEventInterest)
    }
}

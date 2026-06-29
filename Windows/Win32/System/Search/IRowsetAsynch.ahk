#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetAsynch extends IUnknown {
    /**
     * The interface identifier for IRowsetAsynch
     * @type {Guid}
     */
    static IID := Guid("{0c733a0f-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetAsynch interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RatioFinished : IntPtr
        Stop          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetAsynch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} pulDenominator 
     * @param {Pointer<Pointer>} pulNumerator 
     * @param {Pointer<Pointer>} pcRows 
     * @param {Pointer<BOOL>} pfNewRows 
     * @returns {HRESULT} 
     */
    RatioFinished(pulDenominator, pulNumerator, pcRows, pfNewRows) {
        pulDenominatorMarshal := pulDenominator is VarRef ? "ptr*" : "ptr"
        pulNumeratorMarshal := pulNumerator is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"
        pfNewRowsMarshal := pfNewRows is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pulDenominatorMarshal, pulDenominator, pulNumeratorMarshal, pulNumerator, pcRowsMarshal, pcRows, pfNewRowsMarshal, pfNewRows, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetAsynch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RatioFinished := CallbackCreate(GetMethod(implObj, "RatioFinished"), flags, 5)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RatioFinished)
        CallbackFree(this.vtbl.Stop)
    }
}

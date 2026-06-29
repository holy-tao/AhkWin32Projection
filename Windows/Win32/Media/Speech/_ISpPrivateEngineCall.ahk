#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct _ISpPrivateEngineCall extends IUnknown {
    /**
     * The interface identifier for _ISpPrivateEngineCall
     * @type {Guid}
     */
    static IID := Guid("{8e7c791e-4467-11d3-9723-00c04f72db08}")

    /**
     * The class identifier for _ISpPrivateEngineCall
     * @type {Guid}
     */
    static CLSID := Guid("{8e7c791e-4467-11d3-9723-00c04f72db08}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _ISpPrivateEngineCall interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CallEngine   : IntPtr
        CallEngineEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _ISpPrivateEngineCall.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pCallFrame 
     * @param {Integer} ulCallFrameSize 
     * @returns {HRESULT} 
     */
    CallEngine(pCallFrame, ulCallFrameSize) {
        result := ComCall(3, this, "ptr", pCallFrame, "uint", ulCallFrameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pInFrame 
     * @param {Integer} ulInFrameSize 
     * @param {Pointer<Pointer<Void>>} ppCoMemOutFrame 
     * @param {Pointer<Integer>} pulOutFrameSize 
     * @returns {HRESULT} 
     */
    CallEngineEx(pInFrame, ulInFrameSize, ppCoMemOutFrame, pulOutFrameSize) {
        ppCoMemOutFrameMarshal := ppCoMemOutFrame is VarRef ? "ptr*" : "ptr"
        pulOutFrameSizeMarshal := pulOutFrameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pInFrame, "uint", ulInFrameSize, ppCoMemOutFrameMarshal, ppCoMemOutFrame, pulOutFrameSizeMarshal, pulOutFrameSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (_ISpPrivateEngineCall.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CallEngine := CallbackCreate(GetMethod(implObj, "CallEngine"), flags, 3)
        this.vtbl.CallEngineEx := CallbackCreate(GetMethod(implObj, "CallEngineEx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CallEngine)
        CallbackFree(this.vtbl.CallEngineEx)
    }
}

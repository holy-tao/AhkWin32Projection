#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPrivateEngineCallEx extends IUnknown {
    /**
     * The interface identifier for ISpPrivateEngineCallEx
     * @type {Guid}
     */
    static IID := Guid("{defd682a-fe0a-42b9-bfa1-56d3d6cecfaf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPrivateEngineCallEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CallEngineSynchronize : IntPtr
        CallEngineImmediate   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPrivateEngineCallEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} pInFrame 
     * @param {Integer} ulInFrameSize 
     * @param {Pointer<Pointer<Void>>} ppCoMemOutFrame 
     * @param {Pointer<Integer>} pulOutFrameSize 
     * @returns {HRESULT} 
     */
    CallEngineSynchronize(pInFrame, ulInFrameSize, ppCoMemOutFrame, pulOutFrameSize) {
        ppCoMemOutFrameMarshal := ppCoMemOutFrame is VarRef ? "ptr*" : "ptr"
        pulOutFrameSizeMarshal := pulOutFrameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pInFrame, "uint", ulInFrameSize, ppCoMemOutFrameMarshal, ppCoMemOutFrame, pulOutFrameSizeMarshal, pulOutFrameSize, "HRESULT")
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
    CallEngineImmediate(pInFrame, ulInFrameSize, ppCoMemOutFrame, pulOutFrameSize) {
        ppCoMemOutFrameMarshal := ppCoMemOutFrame is VarRef ? "ptr*" : "ptr"
        pulOutFrameSizeMarshal := pulOutFrameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pInFrame, "uint", ulInFrameSize, ppCoMemOutFrameMarshal, ppCoMemOutFrame, pulOutFrameSizeMarshal, pulOutFrameSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpPrivateEngineCallEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CallEngineSynchronize := CallbackCreate(GetMethod(implObj, "CallEngineSynchronize"), flags, 5)
        this.vtbl.CallEngineImmediate := CallbackCreate(GetMethod(implObj, "CallEngineImmediate"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CallEngineSynchronize)
        CallbackFree(this.vtbl.CallEngineImmediate)
    }
}

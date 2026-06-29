#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXC_OUT_KIND.ahk" { DXC_OUT_KIND }
#Import ".\IDxcBlobUtf16.ahk" { IDxcBlobUtf16 }
#Import ".\IDxcOperationResult.ahk" { IDxcOperationResult }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcResult extends IDxcOperationResult {
    /**
     * The interface identifier for IDxcResult
     * @type {Guid}
     */
    static IID := Guid("{58346cda-dde7-4497-9461-6f87af5e0659}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcResult interfaces
    */
    struct Vtbl extends IDxcOperationResult.Vtbl {
        HasOutput        : IntPtr
        GetOutput        : IntPtr
        GetNumOutputs    : IntPtr
        GetOutputByIndex : IntPtr
        PrimaryOutput    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DXC_OUT_KIND} dxcOutKind 
     * @returns {BOOL} 
     */
    HasOutput(dxcOutKind) {
        result := ComCall(6, this, DXC_OUT_KIND, dxcOutKind, BOOL)
        return result
    }

    /**
     * 
     * @param {DXC_OUT_KIND} dxcOutKind 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @param {Pointer<IDxcBlobUtf16>} ppOutputName 
     * @returns {HRESULT} 
     */
    GetOutput(dxcOutKind, iid, ppvObject, ppOutputName) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, DXC_OUT_KIND, dxcOutKind, Guid.Ptr, iid, ppvObjectMarshal, ppvObject, IDxcBlobUtf16.Ptr, ppOutputName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumOutputs() {
        result := ComCall(8, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {DXC_OUT_KIND} 
     */
    GetOutputByIndex(Index) {
        result := ComCall(9, this, "uint", Index, DXC_OUT_KIND)
        return result
    }

    /**
     * 
     * @returns {DXC_OUT_KIND} 
     */
    PrimaryOutput() {
        result := ComCall(10, this, DXC_OUT_KIND)
        return result
    }

    Query(iid) {
        if (IDxcResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HasOutput := CallbackCreate(GetMethod(implObj, "HasOutput"), flags, 2)
        this.vtbl.GetOutput := CallbackCreate(GetMethod(implObj, "GetOutput"), flags, 5)
        this.vtbl.GetNumOutputs := CallbackCreate(GetMethod(implObj, "GetNumOutputs"), flags, 1)
        this.vtbl.GetOutputByIndex := CallbackCreate(GetMethod(implObj, "GetOutputByIndex"), flags, 2)
        this.vtbl.PrimaryOutput := CallbackCreate(GetMethod(implObj, "PrimaryOutput"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HasOutput)
        CallbackFree(this.vtbl.GetOutput)
        CallbackFree(this.vtbl.GetNumOutputs)
        CallbackFree(this.vtbl.GetOutputByIndex)
        CallbackFree(this.vtbl.PrimaryOutput)
    }
}

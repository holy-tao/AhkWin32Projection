#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_PIPELINE_STATE_STREAM_DESC.ahk" { D3D12_PIPELINE_STATE_STREAM_DESC }
#Import ".\D3D12_APPLICATION_DESC.ahk" { D3D12_APPLICATION_DESC }
#Import ".\D3D12_STATE_OBJECT_DESC.ahk" { D3D12_STATE_OBJECT_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12StateObjectDatabase extends IUnknown {
    /**
     * The interface identifier for ID3D12StateObjectDatabase
     * @type {Guid}
     */
    static IID := Guid("{c56060b7-b5fc-4135-98e0-a1e9997eace0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12StateObjectDatabase interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetApplicationDesc     : IntPtr
        GetApplicationDesc     : IntPtr
        StorePipelineStateDesc : IntPtr
        FindPipelineStateDesc  : IntPtr
        StoreStateObjectDesc   : IntPtr
        FindStateObjectDesc    : IntPtr
        FindObjectVersion      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12StateObjectDatabase.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @returns {HRESULT} 
     */
    SetApplicationDesc(pApplicationDesc) {
        result := ComCall(3, this, D3D12_APPLICATION_DESC.Ptr, pApplicationDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12ApplicationDescFunc>} CallbackFunc 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    GetApplicationDesc(CallbackFunc, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", CallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pKey 
     * @param {Integer} KeySize 
     * @param {Integer} _Version 
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    StorePipelineStateDesc(pKey, KeySize, _Version, pDesc) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pKeyMarshal, pKey, "uint", KeySize, "uint", _Version, D3D12_PIPELINE_STATE_STREAM_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pKey 
     * @param {Integer} KeySize 
     * @param {Pointer<D3D12PipelineStateFunc>} CallbackFunc 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    FindPipelineStateDesc(pKey, KeySize, CallbackFunc, pContext) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pKeyMarshal, pKey, "uint", KeySize, "ptr", CallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pKey 
     * @param {Integer} KeySize 
     * @param {Integer} _Version 
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc 
     * @param {Pointer<Void>} pStateObjectToGrowFromKey 
     * @param {Integer} StateObjectToGrowFromKeySize 
     * @returns {HRESULT} 
     */
    StoreStateObjectDesc(pKey, KeySize, _Version, pDesc, pStateObjectToGrowFromKey, StateObjectToGrowFromKeySize) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"
        pStateObjectToGrowFromKeyMarshal := pStateObjectToGrowFromKey is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pKeyMarshal, pKey, "uint", KeySize, "uint", _Version, D3D12_STATE_OBJECT_DESC.Ptr, pDesc, pStateObjectToGrowFromKeyMarshal, pStateObjectToGrowFromKey, "uint", StateObjectToGrowFromKeySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pKey 
     * @param {Integer} KeySize 
     * @param {Pointer<D3D12StateObjectFunc>} CallbackFunc 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    FindStateObjectDesc(pKey, KeySize, CallbackFunc, pContext) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, pKeyMarshal, pKey, "uint", KeySize, "ptr", CallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pKey 
     * @param {Integer} KeySize 
     * @returns {Integer} 
     */
    FindObjectVersion(pKey, KeySize) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pKeyMarshal, pKey, "uint", KeySize, "uint*", &pVersion := 0, "HRESULT")
        return pVersion
    }

    Query(iid) {
        if (ID3D12StateObjectDatabase.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetApplicationDesc := CallbackCreate(GetMethod(implObj, "SetApplicationDesc"), flags, 2)
        this.vtbl.GetApplicationDesc := CallbackCreate(GetMethod(implObj, "GetApplicationDesc"), flags, 3)
        this.vtbl.StorePipelineStateDesc := CallbackCreate(GetMethod(implObj, "StorePipelineStateDesc"), flags, 5)
        this.vtbl.FindPipelineStateDesc := CallbackCreate(GetMethod(implObj, "FindPipelineStateDesc"), flags, 5)
        this.vtbl.StoreStateObjectDesc := CallbackCreate(GetMethod(implObj, "StoreStateObjectDesc"), flags, 7)
        this.vtbl.FindStateObjectDesc := CallbackCreate(GetMethod(implObj, "FindStateObjectDesc"), flags, 5)
        this.vtbl.FindObjectVersion := CallbackCreate(GetMethod(implObj, "FindObjectVersion"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetApplicationDesc)
        CallbackFree(this.vtbl.GetApplicationDesc)
        CallbackFree(this.vtbl.StorePipelineStateDesc)
        CallbackFree(this.vtbl.FindPipelineStateDesc)
        CallbackFree(this.vtbl.StoreStateObjectDesc)
        CallbackFree(this.vtbl.FindStateObjectDesc)
        CallbackFree(this.vtbl.FindObjectVersion)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12StateObjectDatabase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12StateObjectDatabase
     * @type {Guid}
     */
    static IID => Guid("{c56060b7-b5fc-4135-98e0-a1e9997eace0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetApplicationDesc", "GetApplicationDesc", "StorePipelineStateDesc", "FindPipelineStateDesc", "StoreStateObjectDesc", "FindStateObjectDesc", "FindObjectVersion"]

    /**
     * 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @returns {HRESULT} 
     */
    SetApplicationDesc(pApplicationDesc) {
        result := ComCall(3, this, "ptr", pApplicationDesc, "HRESULT")
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
     * @param {Integer} Version 
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    StorePipelineStateDesc(pKey, KeySize, Version, pDesc) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pKeyMarshal, pKey, "uint", KeySize, "uint", Version, "ptr", pDesc, "HRESULT")
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
     * @param {Integer} Version 
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc 
     * @param {Pointer<Void>} pStateObjectToGrowFromKey 
     * @param {Integer} StateObjectToGrowFromKeySize 
     * @returns {HRESULT} 
     */
    StoreStateObjectDesc(pKey, KeySize, Version, pDesc, pStateObjectToGrowFromKey, StateObjectToGrowFromKeySize) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"
        pStateObjectToGrowFromKeyMarshal := pStateObjectToGrowFromKey is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pKeyMarshal, pKey, "uint", KeySize, "uint", Version, "ptr", pDesc, pStateObjectToGrowFromKeyMarshal, pStateObjectToGrowFromKey, "uint", StateObjectToGrowFromKeySize, "HRESULT")
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
     * @param {Pointer<Integer>} pVersion 
     * @returns {HRESULT} 
     */
    FindObjectVersion(pKey, KeySize, pVersion) {
        pKeyMarshal := pKey is VarRef ? "ptr" : "ptr"
        pVersionMarshal := pVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pKeyMarshal, pKey, "uint", KeySize, pVersionMarshal, pVersion, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12CompilerFactoryChild.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CompilerCacheSession extends ID3D12CompilerFactoryChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12CompilerCacheSession
     * @type {Guid}
     */
    static IID => Guid("{5704e5e6-054b-4738-b661-7b0d68d8dde2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindGroup", "FindGroupValueKeys", "FindGroupValues", "FindValue", "GetApplicationDesc", "GetCompilerTarget", "GetValueTypes", "StoreGroupValueKeys", "StoreValue"]

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Pointer<Integer>} pGroupVersion 
     * @returns {HRESULT} 
     */
    FindGroup(pGroupKey, pGroupVersion) {
        pGroupVersionMarshal := pGroupVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pGroupKey, pGroupVersionMarshal, pGroupVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Pointer<Integer>} pExpectedGroupVersion 
     * @param {Pointer<D3D12CompilerCacheSessionGroupValueKeysFunc>} CallbackFunc 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    FindGroupValueKeys(pGroupKey, pExpectedGroupVersion, CallbackFunc, pContext) {
        pExpectedGroupVersionMarshal := pExpectedGroupVersion is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", pGroupKey, pExpectedGroupVersionMarshal, pExpectedGroupVersion, "ptr", CallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Pointer<Integer>} pExpectedGroupVersion 
     * @param {Integer} ValueTypeFlags 
     * @param {Pointer<D3D12CompilerCacheSessionGroupValuesFunc>} CallbackFunc 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    FindGroupValues(pGroupKey, pExpectedGroupVersion, ValueTypeFlags, CallbackFunc, pContext) {
        pExpectedGroupVersionMarshal := pExpectedGroupVersion is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", pGroupKey, pExpectedGroupVersionMarshal, pExpectedGroupVersion, "int", ValueTypeFlags, "ptr", CallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_VALUE_KEY>} pValueKey 
     * @param {Pointer<D3D12_COMPILER_CACHE_TYPED_VALUE>} pTypedValues 
     * @param {Integer} NumTypedValues 
     * @param {Pointer<D3D12CompilerCacheSessionAllocationFunc>} pCallbackFunc 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    FindValue(pValueKey, pTypedValues, NumTypedValues, pCallbackFunc, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pValueKey, "ptr", pTypedValues, "uint", NumTypedValues, "ptr", pCallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<D3D12_APPLICATION_DESC>} 
     */
    GetApplicationDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D3D12_COMPILER_TARGET} 
     */
    GetCompilerTarget() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetValueTypes() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Integer} GroupVersion 
     * @param {Pointer<D3D12_COMPILER_CACHE_VALUE_KEY>} pValueKeys 
     * @param {Integer} NumValueKeys 
     * @returns {HRESULT} 
     */
    StoreGroupValueKeys(pGroupKey, GroupVersion, pValueKeys, NumValueKeys) {
        result := ComCall(11, this, "ptr", pGroupKey, "uint", GroupVersion, "ptr", pValueKeys, "uint", NumValueKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_VALUE_KEY>} pValueKey 
     * @param {Pointer<D3D12_COMPILER_CACHE_TYPED_CONST_VALUE>} pTypedValues 
     * @param {Integer} NumTypedValues 
     * @returns {HRESULT} 
     */
    StoreValue(pValueKey, pTypedValues, NumTypedValues) {
        result := ComCall(12, this, "ptr", pValueKey, "ptr", pTypedValues, "uint", NumTypedValues, "HRESULT")
        return result
    }
}

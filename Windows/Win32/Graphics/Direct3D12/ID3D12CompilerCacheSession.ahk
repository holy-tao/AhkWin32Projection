#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12CompilerFactoryChild.ahk" { ID3D12CompilerFactoryChild }
#Import ".\D3D12_COMPILER_TARGET.ahk" { D3D12_COMPILER_TARGET }
#Import ".\D3D12_COMPILER_CACHE_VALUE_KEY.ahk" { D3D12_COMPILER_CACHE_VALUE_KEY }
#Import ".\D3D12_COMPILER_CACHE_GROUP_KEY.ahk" { D3D12_COMPILER_CACHE_GROUP_KEY }
#Import ".\D3D12_APPLICATION_DESC.ahk" { D3D12_APPLICATION_DESC }
#Import ".\D3D12_COMPILER_VALUE_TYPE_FLAGS.ahk" { D3D12_COMPILER_VALUE_TYPE_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_COMPILER_CACHE_TYPED_VALUE.ahk" { D3D12_COMPILER_CACHE_TYPED_VALUE }
#Import ".\D3D12_COMPILER_CACHE_TYPED_CONST_VALUE.ahk" { D3D12_COMPILER_CACHE_TYPED_CONST_VALUE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12CompilerCacheSession extends ID3D12CompilerFactoryChild {
    /**
     * The interface identifier for ID3D12CompilerCacheSession
     * @type {Guid}
     */
    static IID := Guid("{5704e5e6-054b-4738-b661-7b0d68d8dde2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12CompilerCacheSession interfaces
    */
    struct Vtbl extends ID3D12CompilerFactoryChild.Vtbl {
        FindGroup           : IntPtr
        FindGroupValueKeys  : IntPtr
        FindGroupValues     : IntPtr
        FindValue           : IntPtr
        GetApplicationDesc  : IntPtr
        GetCompilerTarget   : IntPtr
        GetValueTypes       : IntPtr
        StoreGroupValueKeys : IntPtr
        StoreValue          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12CompilerCacheSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @returns {Integer} 
     */
    FindGroup(pGroupKey) {
        result := ComCall(4, this, D3D12_COMPILER_CACHE_GROUP_KEY.Ptr, pGroupKey, "uint*", &pGroupVersion := 0, "HRESULT")
        return pGroupVersion
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

        result := ComCall(5, this, D3D12_COMPILER_CACHE_GROUP_KEY.Ptr, pGroupKey, pExpectedGroupVersionMarshal, pExpectedGroupVersion, "ptr", CallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Pointer<Integer>} pExpectedGroupVersion 
     * @param {D3D12_COMPILER_VALUE_TYPE_FLAGS} ValueTypeFlags 
     * @param {Pointer<D3D12CompilerCacheSessionGroupValuesFunc>} CallbackFunc 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     */
    FindGroupValues(pGroupKey, pExpectedGroupVersion, ValueTypeFlags, CallbackFunc, pContext) {
        pExpectedGroupVersionMarshal := pExpectedGroupVersion is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, D3D12_COMPILER_CACHE_GROUP_KEY.Ptr, pGroupKey, pExpectedGroupVersionMarshal, pExpectedGroupVersion, D3D12_COMPILER_VALUE_TYPE_FLAGS, ValueTypeFlags, "ptr", CallbackFunc, pContextMarshal, pContext, "HRESULT")
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

        result := ComCall(7, this, D3D12_COMPILER_CACHE_VALUE_KEY.Ptr, pValueKey, D3D12_COMPILER_CACHE_TYPED_VALUE.Ptr, pTypedValues, "uint", NumTypedValues, "ptr", pCallbackFunc, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<D3D12_APPLICATION_DESC>} 
     */
    GetApplicationDesc() {
        result := ComCall(8, this, D3D12_APPLICATION_DESC.Ptr)
        return result
    }

    /**
     * 
     * @returns {D3D12_COMPILER_TARGET} 
     */
    GetCompilerTarget() {
        result := ComCall(9, this, D3D12_COMPILER_TARGET)
        return result
    }

    /**
     * 
     * @returns {D3D12_COMPILER_VALUE_TYPE_FLAGS} 
     */
    GetValueTypes() {
        result := ComCall(10, this, D3D12_COMPILER_VALUE_TYPE_FLAGS)
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
        result := ComCall(11, this, D3D12_COMPILER_CACHE_GROUP_KEY.Ptr, pGroupKey, "uint", GroupVersion, D3D12_COMPILER_CACHE_VALUE_KEY.Ptr, pValueKeys, "uint", NumValueKeys, "HRESULT")
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
        result := ComCall(12, this, D3D12_COMPILER_CACHE_VALUE_KEY.Ptr, pValueKey, D3D12_COMPILER_CACHE_TYPED_CONST_VALUE.Ptr, pTypedValues, "uint", NumTypedValues, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12CompilerCacheSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindGroup := CallbackCreate(GetMethod(implObj, "FindGroup"), flags, 3)
        this.vtbl.FindGroupValueKeys := CallbackCreate(GetMethod(implObj, "FindGroupValueKeys"), flags, 5)
        this.vtbl.FindGroupValues := CallbackCreate(GetMethod(implObj, "FindGroupValues"), flags, 6)
        this.vtbl.FindValue := CallbackCreate(GetMethod(implObj, "FindValue"), flags, 6)
        this.vtbl.GetApplicationDesc := CallbackCreate(GetMethod(implObj, "GetApplicationDesc"), flags, 1)
        this.vtbl.GetCompilerTarget := CallbackCreate(GetMethod(implObj, "GetCompilerTarget"), flags, 1)
        this.vtbl.GetValueTypes := CallbackCreate(GetMethod(implObj, "GetValueTypes"), flags, 1)
        this.vtbl.StoreGroupValueKeys := CallbackCreate(GetMethod(implObj, "StoreGroupValueKeys"), flags, 5)
        this.vtbl.StoreValue := CallbackCreate(GetMethod(implObj, "StoreValue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindGroup)
        CallbackFree(this.vtbl.FindGroupValueKeys)
        CallbackFree(this.vtbl.FindGroupValues)
        CallbackFree(this.vtbl.FindValue)
        CallbackFree(this.vtbl.GetApplicationDesc)
        CallbackFree(this.vtbl.GetCompilerTarget)
        CallbackFree(this.vtbl.GetValueTypes)
        CallbackFree(this.vtbl.StoreGroupValueKeys)
        CallbackFree(this.vtbl.StoreValue)
    }
}

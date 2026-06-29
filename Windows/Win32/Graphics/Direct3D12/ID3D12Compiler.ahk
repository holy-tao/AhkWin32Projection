#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12CompilerFactoryChild.ahk" { ID3D12CompilerFactoryChild }
#Import ".\D3D12_COMPILER_CACHE_GROUP_KEY.ahk" { D3D12_COMPILER_CACHE_GROUP_KEY }
#Import ".\D3D12_PIPELINE_STATE_STREAM_DESC.ahk" { D3D12_PIPELINE_STATE_STREAM_DESC }
#Import ".\D3D12_STATE_OBJECT_DESC.ahk" { D3D12_STATE_OBJECT_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12CompilerStateObject.ahk" { ID3D12CompilerStateObject }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Compiler extends ID3D12CompilerFactoryChild {
    /**
     * The interface identifier for ID3D12Compiler
     * @type {Guid}
     */
    static IID := Guid("{8c403c12-993b-4583-80f1-6824138fa68e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Compiler interfaces
    */
    struct Vtbl extends ID3D12CompilerFactoryChild.Vtbl {
        CompilePipelineState    : IntPtr
        CompileStateObject      : IntPtr
        CompileAddToStateObject : IntPtr
        GetCacheSession         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Compiler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Integer} GroupVersion 
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    CompilePipelineState(pGroupKey, GroupVersion, pDesc) {
        result := ComCall(4, this, D3D12_COMPILER_CACHE_GROUP_KEY.Ptr, pGroupKey, "uint", GroupVersion, D3D12_PIPELINE_STATE_STREAM_DESC.Ptr, pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Integer} GroupVersion 
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CompileStateObject(pGroupKey, GroupVersion, pDesc, riid) {
        result := ComCall(5, this, D3D12_COMPILER_CACHE_GROUP_KEY.Ptr, pGroupKey, "uint", GroupVersion, D3D12_STATE_OBJECT_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppCompilerStateObject := 0, "HRESULT")
        return ppCompilerStateObject
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Integer} GroupVersion 
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pAddition 
     * @param {ID3D12CompilerStateObject} pCompilerStateObjectToGrowFrom 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CompileAddToStateObject(pGroupKey, GroupVersion, pAddition, pCompilerStateObjectToGrowFrom, riid) {
        result := ComCall(6, this, D3D12_COMPILER_CACHE_GROUP_KEY.Ptr, pGroupKey, "uint", GroupVersion, D3D12_STATE_OBJECT_DESC.Ptr, pAddition, "ptr", pCompilerStateObjectToGrowFrom, Guid.Ptr, riid, "ptr*", &ppNewCompilerStateObject := 0, "HRESULT")
        return ppNewCompilerStateObject
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCacheSession(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &ppCompilerCacheSession := 0, "HRESULT")
        return ppCompilerCacheSession
    }

    Query(iid) {
        if (ID3D12Compiler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompilePipelineState := CallbackCreate(GetMethod(implObj, "CompilePipelineState"), flags, 4)
        this.vtbl.CompileStateObject := CallbackCreate(GetMethod(implObj, "CompileStateObject"), flags, 6)
        this.vtbl.CompileAddToStateObject := CallbackCreate(GetMethod(implObj, "CompileAddToStateObject"), flags, 7)
        this.vtbl.GetCacheSession := CallbackCreate(GetMethod(implObj, "GetCacheSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompilePipelineState)
        CallbackFree(this.vtbl.CompileStateObject)
        CallbackFree(this.vtbl.CompileAddToStateObject)
        CallbackFree(this.vtbl.GetCacheSession)
    }
}

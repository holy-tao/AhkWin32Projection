#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12CompilerFactoryChild.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Compiler extends ID3D12CompilerFactoryChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Compiler
     * @type {Guid}
     */
    static IID => Guid("{8c403c12-993b-4583-80f1-6824138fa68e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompilePipelineState", "CompileStateObject", "CompileAddToStateObject", "GetCacheSession"]

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_CACHE_GROUP_KEY>} pGroupKey 
     * @param {Integer} GroupVersion 
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    CompilePipelineState(pGroupKey, GroupVersion, pDesc) {
        result := ComCall(4, this, "ptr", pGroupKey, "uint", GroupVersion, "ptr", pDesc, "HRESULT")
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
        result := ComCall(5, this, "ptr", pGroupKey, "uint", GroupVersion, "ptr", pDesc, "ptr", riid, "ptr*", &ppCompilerStateObject := 0, "HRESULT")
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
        result := ComCall(6, this, "ptr", pGroupKey, "uint", GroupVersion, "ptr", pAddition, "ptr", pCompilerStateObjectToGrowFrom, "ptr", riid, "ptr*", &ppNewCompilerStateObject := 0, "HRESULT")
        return ppNewCompilerStateObject
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCacheSession(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &ppCompilerCacheSession := 0, "HRESULT")
        return ppCompilerCacheSession
    }
}

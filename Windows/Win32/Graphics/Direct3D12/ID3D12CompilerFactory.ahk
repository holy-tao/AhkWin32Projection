#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CompilerFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12CompilerFactory
     * @type {Guid}
     */
    static IID => Guid("{c1ee4b59-3f59-47a5-9b4e-a855c858a878}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateAdapterFamilies", "EnumerateAdapterFamilyABIVersions", "EnumerateAdapterFamilyCompilerVersion", "GetApplicationProfileVersion", "CreateCompilerCacheSession", "CreateCompiler"]

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<D3D12_ADAPTER_FAMILY>} pAdapterFamily 
     * @returns {HRESULT} 
     */
    EnumerateAdapterFamilies(AdapterFamilyIndex, pAdapterFamily) {
        result := ComCall(3, this, "uint", AdapterFamilyIndex, "ptr", pAdapterFamily, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<Integer>} pNumABIVersions 
     * @param {Pointer<Integer>} pABIVersions 
     * @returns {HRESULT} 
     */
    EnumerateAdapterFamilyABIVersions(AdapterFamilyIndex, pNumABIVersions, pABIVersions) {
        pNumABIVersionsMarshal := pNumABIVersions is VarRef ? "uint*" : "ptr"
        pABIVersionsMarshal := pABIVersions is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", AdapterFamilyIndex, pNumABIVersionsMarshal, pNumABIVersions, pABIVersionsMarshal, pABIVersions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<D3D12_VERSION_NUMBER>} pCompilerVersion 
     * @returns {HRESULT} 
     */
    EnumerateAdapterFamilyCompilerVersion(AdapterFamilyIndex, pCompilerVersion) {
        result := ComCall(5, this, "uint", AdapterFamilyIndex, "ptr", pCompilerVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_TARGET>} pTarget 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<D3D12_VERSION_NUMBER>} pApplicationProfileVersion 
     * @returns {HRESULT} 
     */
    GetApplicationProfileVersion(pTarget, pApplicationDesc, pApplicationProfileVersion) {
        result := ComCall(6, this, "ptr", pTarget, "ptr", pApplicationDesc, "ptr", pApplicationProfileVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_DATABASE_PATH>} pPaths 
     * @param {Integer} NumPaths 
     * @param {Pointer<D3D12_COMPILER_TARGET>} pTarget 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppCompilerCacheSession 
     * @returns {HRESULT} 
     */
    CreateCompilerCacheSession(pPaths, NumPaths, pTarget, pApplicationDesc, riid, ppCompilerCacheSession) {
        ppCompilerCacheSessionMarshal := ppCompilerCacheSession is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pPaths, "uint", NumPaths, "ptr", pTarget, "ptr", pApplicationDesc, "ptr", riid, ppCompilerCacheSessionMarshal, ppCompilerCacheSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12CompilerCacheSession} pCompilerCacheSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppCompiler 
     * @returns {HRESULT} 
     */
    CreateCompiler(pCompilerCacheSession, riid, ppCompiler) {
        ppCompilerMarshal := ppCompiler is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pCompilerCacheSession, "ptr", riid, ppCompilerMarshal, ppCompiler, "HRESULT")
        return result
    }
}

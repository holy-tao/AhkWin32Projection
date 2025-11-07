#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_ADAPTER_FAMILY.ahk
#Include .\D3D12_VERSION_NUMBER.ahk
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
     * @returns {D3D12_ADAPTER_FAMILY} 
     */
    EnumerateAdapterFamilies(AdapterFamilyIndex) {
        pAdapterFamily := D3D12_ADAPTER_FAMILY()
        result := ComCall(3, this, "uint", AdapterFamilyIndex, "ptr", pAdapterFamily, "HRESULT")
        return pAdapterFamily
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<Integer>} pNumABIVersions 
     * @returns {Integer} 
     */
    EnumerateAdapterFamilyABIVersions(AdapterFamilyIndex, pNumABIVersions) {
        pNumABIVersionsMarshal := pNumABIVersions is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", AdapterFamilyIndex, pNumABIVersionsMarshal, pNumABIVersions, "uint*", &pABIVersions := 0, "HRESULT")
        return pABIVersions
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @returns {D3D12_VERSION_NUMBER} 
     */
    EnumerateAdapterFamilyCompilerVersion(AdapterFamilyIndex) {
        pCompilerVersion := D3D12_VERSION_NUMBER()
        result := ComCall(5, this, "uint", AdapterFamilyIndex, "ptr", pCompilerVersion, "HRESULT")
        return pCompilerVersion
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_TARGET>} pTarget 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @returns {D3D12_VERSION_NUMBER} 
     */
    GetApplicationProfileVersion(pTarget, pApplicationDesc) {
        pApplicationProfileVersion := D3D12_VERSION_NUMBER()
        result := ComCall(6, this, "ptr", pTarget, "ptr", pApplicationDesc, "ptr", pApplicationProfileVersion, "HRESULT")
        return pApplicationProfileVersion
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_DATABASE_PATH>} pPaths 
     * @param {Integer} NumPaths 
     * @param {Pointer<D3D12_COMPILER_TARGET>} pTarget 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateCompilerCacheSession(pPaths, NumPaths, pTarget, pApplicationDesc, riid) {
        result := ComCall(7, this, "ptr", pPaths, "uint", NumPaths, "ptr", pTarget, "ptr", pApplicationDesc, "ptr", riid, "ptr*", &ppCompilerCacheSession := 0, "HRESULT")
        return ppCompilerCacheSession
    }

    /**
     * 
     * @param {ID3D12CompilerCacheSession} pCompilerCacheSession 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateCompiler(pCompilerCacheSession, riid) {
        result := ComCall(8, this, "ptr", pCompilerCacheSession, "ptr", riid, "ptr*", &ppCompiler := 0, "HRESULT")
        return ppCompiler
    }
}

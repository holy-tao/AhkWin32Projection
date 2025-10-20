#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CompilerFactory extends IUnknown{
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
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<D3D12_ADAPTER_FAMILY>} pAdapterFamily 
     * @returns {HRESULT} 
     */
    EnumerateAdapterFamilies(AdapterFamilyIndex, pAdapterFamily) {
        result := ComCall(3, this, "uint", AdapterFamilyIndex, "ptr", pAdapterFamily, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<UInt32>} pNumABIVersions 
     * @param {Pointer<UInt64>} pABIVersions 
     * @returns {HRESULT} 
     */
    EnumerateAdapterFamilyABIVersions(AdapterFamilyIndex, pNumABIVersions, pABIVersions) {
        result := ComCall(4, this, "uint", AdapterFamilyIndex, "uint*", pNumABIVersions, "uint*", pABIVersions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AdapterFamilyIndex 
     * @param {Pointer<D3D12_VERSION_NUMBER>} pCompilerVersion 
     * @returns {HRESULT} 
     */
    EnumerateAdapterFamilyCompilerVersion(AdapterFamilyIndex, pCompilerVersion) {
        result := ComCall(5, this, "uint", AdapterFamilyIndex, "ptr", pCompilerVersion, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "ptr", pTarget, "ptr", pApplicationDesc, "ptr", pApplicationProfileVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPILER_DATABASE_PATH>} pPaths 
     * @param {Integer} NumPaths 
     * @param {Pointer<D3D12_COMPILER_TARGET>} pTarget 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCompilerCacheSession 
     * @returns {HRESULT} 
     */
    CreateCompilerCacheSession(pPaths, NumPaths, pTarget, pApplicationDesc, riid, ppCompilerCacheSession) {
        result := ComCall(7, this, "ptr", pPaths, "uint", NumPaths, "ptr", pTarget, "ptr", pApplicationDesc, "ptr", riid, "ptr", ppCompilerCacheSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12CompilerCacheSession>} pCompilerCacheSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCompiler 
     * @returns {HRESULT} 
     */
    CreateCompiler(pCompilerCacheSession, riid, ppCompiler) {
        result := ComCall(8, this, "ptr", pCompilerCacheSession, "ptr", riid, "ptr", ppCompiler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheApplication extends IUnknown{
    /**
     * The interface identifier for ID3DShaderCacheApplication
     * @type {Guid}
     */
    static IID => Guid("{fc688ee2-1b35-4913-93be-1ca3fa7df39e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt16>} pExePath 
     * @returns {HRESULT} 
     */
    GetExePath(pExePath) {
        result := ComCall(3, this, "ushort*", pExePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D_SHADER_CACHE_APPLICATION_DESC>} pApplicationDesc 
     * @returns {HRESULT} 
     */
    GetDesc(pApplicationDesc) {
        result := ComCall(4, this, "ptr", pApplicationDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pStateObjectDBPath 
     * @param {Integer} NumPSDB 
     * @param {Pointer<D3D_SHADER_CACHE_PSDB_PROPERTIES>} pPSDBs 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvComponent 
     * @returns {HRESULT} 
     */
    RegisterComponent(pName, pStateObjectDBPath, NumPSDB, pPSDBs, riid, ppvComponent) {
        pName := pName is String ? StrPtr(pName) : pName
        pStateObjectDBPath := pStateObjectDBPath is String ? StrPtr(pStateObjectDBPath) : pStateObjectDBPath

        result := ComCall(5, this, "ptr", pName, "ptr", pStateObjectDBPath, "uint", NumPSDB, "ptr", pPSDBs, "ptr", riid, "ptr", ppvComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3DShaderCacheComponent>} pComponent 
     * @returns {HRESULT} 
     */
    RemoveComponent(pComponent) {
        result := ComCall(6, this, "ptr", pComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetComponentCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvComponent 
     * @returns {HRESULT} 
     */
    GetComponent(index, riid, ppvComponent) {
        result := ComCall(8, this, "uint", index, "ptr", riid, "ptr", ppvComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    GetPrecompileTargetCount(flags) {
        result := ComCall(9, this, "int", flags, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ArraySize 
     * @param {Pointer<D3D_SHADER_CACHE_COMPILER_PROPERTIES>} pArray 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    GetPrecompileTargets(ArraySize, pArray, flags) {
        result := ComCall(10, this, "uint", ArraySize, "ptr", pArray, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pInstallerName 
     * @returns {HRESULT} 
     */
    GetInstallerName(pInstallerName) {
        result := ComCall(11, this, "ushort*", pInstallerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

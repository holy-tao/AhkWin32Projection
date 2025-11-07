#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D_SHADER_CACHE_APPLICATION_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheApplication extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExePath", "GetDesc", "RegisterComponent", "RemoveComponent", "GetComponentCount", "GetComponent", "GetPrecompileTargetCount", "GetPrecompileTargets", "GetInstallerName"]

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetExePath() {
        result := ComCall(3, this, "ptr*", &pExePath := 0, "HRESULT")
        return pExePath
    }

    /**
     * 
     * @returns {D3D_SHADER_CACHE_APPLICATION_DESC} 
     */
    GetDesc() {
        pApplicationDesc := D3D_SHADER_CACHE_APPLICATION_DESC()
        result := ComCall(4, this, "ptr", pApplicationDesc, "HRESULT")
        return pApplicationDesc
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pStateObjectDBPath 
     * @param {Integer} NumPSDB 
     * @param {Pointer<D3D_SHADER_CACHE_PSDB_PROPERTIES>} pPSDBs 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RegisterComponent(pName, pStateObjectDBPath, NumPSDB, pPSDBs, riid) {
        pName := pName is String ? StrPtr(pName) : pName
        pStateObjectDBPath := pStateObjectDBPath is String ? StrPtr(pStateObjectDBPath) : pStateObjectDBPath

        result := ComCall(5, this, "ptr", pName, "ptr", pStateObjectDBPath, "uint", NumPSDB, "ptr", pPSDBs, "ptr", riid, "ptr*", &ppvComponent := 0, "HRESULT")
        return ppvComponent
    }

    /**
     * 
     * @param {ID3DShaderCacheComponent} pComponent 
     * @returns {HRESULT} 
     */
    RemoveComponent(pComponent) {
        result := ComCall(6, this, "ptr", pComponent, "HRESULT")
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
     * @returns {Pointer<Void>} 
     */
    GetComponent(index, riid) {
        result := ComCall(8, this, "uint", index, "ptr", riid, "ptr*", &ppvComponent := 0, "HRESULT")
        return ppvComponent
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
        result := ComCall(10, this, "uint", ArraySize, "ptr", pArray, "int", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetInstallerName() {
        result := ComCall(11, this, "ptr*", &pInstallerName := 0, "HRESULT")
        return pInstallerName
    }
}

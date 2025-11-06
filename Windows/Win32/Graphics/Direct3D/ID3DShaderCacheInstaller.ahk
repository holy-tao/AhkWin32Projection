#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D_SHADER_CACHE_COMPILER_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheInstaller extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DShaderCacheInstaller
     * @type {Guid}
     */
    static IID => Guid("{bbe30de1-6318-4526-ae17-776693191bb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDriverUpdateListener", "UnregisterDriverUpdateListener", "RegisterServiceDriverUpdateTrigger", "UnregisterServiceDriverUpdateTrigger", "RegisterApplication", "RemoveApplication", "GetApplicationCount", "GetApplication", "ClearAllState", "GetMaxPrecompileTargetCount", "GetPrecompileTargets"]

    /**
     * 
     * @returns {HRESULT} 
     */
    RegisterDriverUpdateListener() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnregisterDriverUpdateListener() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SC_HANDLE} hServiceHandle 
     * @returns {HRESULT} 
     */
    RegisterServiceDriverUpdateTrigger(hServiceHandle) {
        hServiceHandle := hServiceHandle is Win32Handle ? NumGet(hServiceHandle, "ptr") : hServiceHandle

        result := ComCall(5, this, "ptr", hServiceHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SC_HANDLE} hServiceHandle 
     * @returns {HRESULT} 
     */
    UnregisterServiceDriverUpdateTrigger(hServiceHandle) {
        hServiceHandle := hServiceHandle is Win32Handle ? NumGet(hServiceHandle, "ptr") : hServiceHandle

        result := ComCall(6, this, "ptr", hServiceHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pExePath 
     * @param {Pointer<D3D_SHADER_CACHE_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RegisterApplication(pExePath, pApplicationDesc, riid) {
        pExePath := pExePath is String ? StrPtr(pExePath) : pExePath

        result := ComCall(7, this, "ptr", pExePath, "ptr", pApplicationDesc, "ptr", riid, "ptr*", &ppvApp := 0, "HRESULT")
        return ppvApp
    }

    /**
     * 
     * @param {ID3DShaderCacheApplication} pApplication 
     * @returns {HRESULT} 
     */
    RemoveApplication(pApplication) {
        result := ComCall(8, this, "ptr", pApplication, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetApplicationCount() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetApplication(index, riid) {
        result := ComCall(10, this, "uint", index, "ptr", riid, "ptr*", &ppvApp := 0, "HRESULT")
        return ppvApp
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllState() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxPrecompileTargetCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D_SHADER_CACHE_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Integer>} pArraySize 
     * @param {Integer} flags 
     * @returns {D3D_SHADER_CACHE_COMPILER_PROPERTIES} 
     */
    GetPrecompileTargets(pApplicationDesc, pArraySize, flags) {
        pArraySizeMarshal := pArraySize is VarRef ? "uint*" : "ptr"

        pArray := D3D_SHADER_CACHE_COMPILER_PROPERTIES()
        result := ComCall(13, this, "ptr", pApplicationDesc, pArraySizeMarshal, pArraySize, "ptr", pArray, "int", flags, "HRESULT")
        return pArray
    }
}

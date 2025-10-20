#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheInstaller extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    RegisterDriverUpdateListener() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnregisterDriverUpdateListener() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SC_HANDLE} hServiceHandle 
     * @returns {HRESULT} 
     */
    RegisterServiceDriverUpdateTrigger(hServiceHandle) {
        hServiceHandle := hServiceHandle is Win32Handle ? NumGet(hServiceHandle, "ptr") : hServiceHandle

        result := ComCall(5, this, "ptr", hServiceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SC_HANDLE} hServiceHandle 
     * @returns {HRESULT} 
     */
    UnregisterServiceDriverUpdateTrigger(hServiceHandle) {
        hServiceHandle := hServiceHandle is Win32Handle ? NumGet(hServiceHandle, "ptr") : hServiceHandle

        result := ComCall(6, this, "ptr", hServiceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pExePath 
     * @param {Pointer<D3D_SHADER_CACHE_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvApp 
     * @returns {HRESULT} 
     */
    RegisterApplication(pExePath, pApplicationDesc, riid, ppvApp) {
        pExePath := pExePath is String ? StrPtr(pExePath) : pExePath

        result := ComCall(7, this, "ptr", pExePath, "ptr", pApplicationDesc, "ptr", riid, "ptr", ppvApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3DShaderCacheApplication>} pApplication 
     * @returns {HRESULT} 
     */
    RemoveApplication(pApplication) {
        result := ComCall(8, this, "ptr", pApplication, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<Void>} ppvApp 
     * @returns {HRESULT} 
     */
    GetApplication(index, riid, ppvApp) {
        result := ComCall(10, this, "uint", index, "ptr", riid, "ptr", ppvApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllState() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} pArraySize 
     * @param {Pointer<D3D_SHADER_CACHE_COMPILER_PROPERTIES>} pArray 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    GetPrecompileTargets(pApplicationDesc, pArraySize, pArray, flags) {
        result := ComCall(13, this, "ptr", pApplicationDesc, "uint*", pArraySize, "ptr", pArray, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnregisterDriverUpdateListener() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers the active instance of an application for recovery.
     * @remarks
     * If the  application encounters an unhandled exception or becomes unresponsive, Windows Error Reporting (WER) calls the specified recovery callback. You should use the callback to save data and state information. You can use the information if you also call  the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerapplicationrestart">RegisterApplicationRestart</a> function to request that WER restart the application.
     * 
     * WER will not call your recovery callback if an installer wants to  update a component of your application. To save data and state information in the update case, you should handle the <a href="https://docs.microsoft.com/windows/desktop/Shutdown/wm-queryendsession">WM_QUERYENDSESSION</a> and <a href="https://docs.microsoft.com/windows/desktop/Shutdown/wm-endsession">WM_ENDSESSION</a> messages. For details, see each message. The timeout for responding to these messages is five seconds. Most of the available recovery time is in the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-close">WM_CLOSE</a> message for which you have 30 seconds.
     * 
     * A console application that can be updated uses the CTRL_C_EVENT notification to initiate recovery (for details, see the <a href="https://docs.microsoft.com/windows/console/handlerroutine">HandlerRoutine</a> callback function). The timeout for the handler to complete is 30 seconds.
     * 
     * Applications should consider saving data and state information on a periodic bases to shorten the amount of time required for recovery.
     * @param {PWSTR} pExePath 
     * @param {Pointer<D3D_SHADER_CACHE_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-registerapplicationrecoverycallback
     */
    RegisterApplication(pExePath, pApplicationDesc, riid) {
        pExePath := pExePath is String ? StrPtr(pExePath) : pExePath

        result := ComCall(7, this, "ptr", pExePath, "ptr", pApplicationDesc, "ptr", riid, "ptr*", &ppvApp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvApp
    }

    /**
     * 
     * @param {ID3DShaderCacheApplication} pApplication 
     * @returns {HRESULT} 
     */
    RemoveApplication(pApplication) {
        result := ComCall(8, this, "ptr", pApplication, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * Retrieves a pointer to the callback routine registered for the specified process. The address returned is in the virtual address space of the process.
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getapplicationrecoverycallback
     */
    GetApplication(index, riid) {
        result := ComCall(10, this, "uint", index, "ptr", riid, "ptr*", &ppvApp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvApp
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllState() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(13, this, "ptr", pApplicationDesc, pArraySizeMarshal, pArraySize, "ptr", pArray, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pArray
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRRuntimeInfo extends IUnknown{
    /**
     * The interface identifier for ICLRRuntimeInfo
     * @type {Guid}
     */
    static IID => Guid("{bd39d1d2-ba2f-486a-89b0-b4b0cb466891}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<UInt32>} pcchBuffer 
     * @returns {HRESULT} 
     */
    GetVersionString(pwzBuffer, pcchBuffer) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        result := ComCall(3, this, "ptr", pwzBuffer, "uint*", pcchBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<UInt32>} pcchBuffer 
     * @returns {HRESULT} 
     */
    GetRuntimeDirectory(pwzBuffer, pcchBuffer) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        result := ComCall(4, this, "ptr", pwzBuffer, "uint*", pcchBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hndProcess 
     * @param {Pointer<BOOL>} pbLoaded 
     * @returns {HRESULT} 
     */
    IsLoaded(hndProcess, pbLoaded) {
        hndProcess := hndProcess is Win32Handle ? NumGet(hndProcess, "ptr") : hndProcess

        result := ComCall(5, this, "ptr", hndProcess, "ptr", pbLoaded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iResourceID 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<UInt32>} pcchBuffer 
     * @param {Integer} iLocaleID 
     * @returns {HRESULT} 
     */
    LoadErrorString(iResourceID, pwzBuffer, pcchBuffer, iLocaleID) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        result := ComCall(6, this, "uint", iResourceID, "ptr", pwzBuffer, "uint*", pcchBuffer, "int", iLocaleID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Loads the specified module into the address space of the calling process.
     * @param {PWSTR} pwzDllName 
     * @param {Pointer<HMODULE>} phndModule 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the module.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadlibrarya
     */
    LoadLibraryA(pwzDllName, phndModule) {
        pwzDllName := pwzDllName is String ? StrPtr(pwzDllName) : pwzDllName

        result := ComCall(7, this, "ptr", pwzDllName, "ptr", phndModule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the address of an exported function or variable from the specified dynamic-link library (DLL).
     * @param {PSTR} pszProcName 
     * @param {Pointer<Void>} ppProc 
     * @returns {HRESULT} If the function succeeds, the return value is the address of the exported function or variable.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getprocaddress
     */
    GetProcAddress(pszProcName, ppProc) {
        result := ComCall(8, this, "ptr", pszProcName, "ptr", ppProc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    GetInterface(rclsid, riid, ppUnk) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLoadable 
     * @returns {HRESULT} 
     */
    IsLoadable(pbLoadable) {
        result := ComCall(10, this, "ptr", pbLoadable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStartupFlags 
     * @param {PWSTR} pwzHostConfigFile 
     * @returns {HRESULT} 
     */
    SetDefaultStartupFlags(dwStartupFlags, pwzHostConfigFile) {
        pwzHostConfigFile := pwzHostConfigFile is String ? StrPtr(pwzHostConfigFile) : pwzHostConfigFile

        result := ComCall(11, this, "uint", dwStartupFlags, "ptr", pwzHostConfigFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStartupFlags 
     * @param {PWSTR} pwzHostConfigFile 
     * @param {Pointer<UInt32>} pcchHostConfigFile 
     * @returns {HRESULT} 
     */
    GetDefaultStartupFlags(pdwStartupFlags, pwzHostConfigFile, pcchHostConfigFile) {
        pwzHostConfigFile := pwzHostConfigFile is String ? StrPtr(pwzHostConfigFile) : pwzHostConfigFile

        result := ComCall(12, this, "uint*", pdwStartupFlags, "ptr", pwzHostConfigFile, "uint*", pcchHostConfigFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindAsLegacyV2Runtime() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbStarted 
     * @param {Pointer<UInt32>} pdwStartupFlags 
     * @returns {HRESULT} 
     */
    IsStarted(pbStarted, pdwStartupFlags) {
        result := ComCall(14, this, "ptr", pbStarted, "uint*", pdwStartupFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

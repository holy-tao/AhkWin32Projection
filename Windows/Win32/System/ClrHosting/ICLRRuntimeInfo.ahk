#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRRuntimeInfo extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVersionString", "GetRuntimeDirectory", "IsLoaded", "LoadErrorString", "LoadLibraryA", "GetProcAddress", "GetInterface", "IsLoadable", "SetDefaultStartupFlags", "GetDefaultStartupFlags", "BindAsLegacyV2Runtime", "IsStarted"]

    /**
     * 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @returns {HRESULT} 
     */
    GetVersionString(pwzBuffer, pcchBuffer) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwzBuffer, pcchBufferMarshal, pcchBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @returns {HRESULT} 
     */
    GetRuntimeDirectory(pwzBuffer, pcchBuffer) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzBuffer, pcchBufferMarshal, pcchBuffer, "HRESULT")
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

        result := ComCall(5, this, "ptr", hndProcess, "ptr", pbLoaded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iResourceID 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @param {Integer} iLocaleID 
     * @returns {HRESULT} 
     */
    LoadErrorString(iResourceID, pwzBuffer, pcchBuffer, iLocaleID) {
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", iResourceID, "ptr", pwzBuffer, pcchBufferMarshal, pcchBuffer, "int", iLocaleID, "HRESULT")
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

        result := ComCall(7, this, "ptr", pwzDllName, "ptr", phndModule, "HRESULT")
        return result
    }

    /**
     * Retrieves the address of an exported function or variable from the specified dynamic-link library (DLL).
     * @param {PSTR} pszProcName 
     * @param {Pointer<Pointer<Void>>} ppProc 
     * @returns {HRESULT} If the function succeeds, the return value is the address of the exported function or variable.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getprocaddress
     */
    GetProcAddress(pszProcName, ppProc) {
        pszProcName := pszProcName is String ? StrPtr(pszProcName) : pszProcName

        result := ComCall(8, this, "ptr", pszProcName, "ptr*", ppProc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     */
    GetInterface(rclsid, riid, ppUnk) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", riid, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbLoadable 
     * @returns {HRESULT} 
     */
    IsLoadable(pbLoadable) {
        result := ComCall(10, this, "ptr", pbLoadable, "HRESULT")
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

        result := ComCall(11, this, "uint", dwStartupFlags, "ptr", pwzHostConfigFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStartupFlags 
     * @param {PWSTR} pwzHostConfigFile 
     * @param {Pointer<Integer>} pcchHostConfigFile 
     * @returns {HRESULT} 
     */
    GetDefaultStartupFlags(pdwStartupFlags, pwzHostConfigFile, pcchHostConfigFile) {
        pwzHostConfigFile := pwzHostConfigFile is String ? StrPtr(pwzHostConfigFile) : pwzHostConfigFile

        pdwStartupFlagsMarshal := pdwStartupFlags is VarRef ? "uint*" : "ptr"
        pcchHostConfigFileMarshal := pcchHostConfigFile is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwStartupFlagsMarshal, pdwStartupFlags, "ptr", pwzHostConfigFile, pcchHostConfigFileMarshal, pcchHostConfigFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindAsLegacyV2Runtime() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbStarted 
     * @param {Pointer<Integer>} pdwStartupFlags 
     * @returns {HRESULT} 
     */
    IsStarted(pbStarted, pdwStartupFlags) {
        pdwStartupFlagsMarshal := pdwStartupFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pbStarted, pdwStartupFlagsMarshal, pdwStartupFlags, "HRESULT")
        return result
    }
}

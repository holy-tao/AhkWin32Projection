#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HMODULE.ahk
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
     * @returns {BOOL} 
     */
    IsLoaded(hndProcess) {
        hndProcess := hndProcess is Win32Handle ? NumGet(hndProcess, "ptr") : hndProcess

        result := ComCall(5, this, "ptr", hndProcess, "int*", &pbLoaded := 0, "HRESULT")
        return pbLoaded
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
     * @returns {HMODULE} 
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadlibrarya
     */
    LoadLibraryA(pwzDllName) {
        pwzDllName := pwzDllName is String ? StrPtr(pwzDllName) : pwzDllName

        phndModule := HMODULE()
        result := ComCall(7, this, "ptr", pwzDllName, "ptr", phndModule, "HRESULT")
        return phndModule
    }

    /**
     * Retrieves the address of an exported function or variable from the specified dynamic-link library (DLL).
     * @param {PSTR} pszProcName 
     * @returns {Pointer<Void>} 
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-getprocaddress
     */
    GetProcAddress(pszProcName) {
        pszProcName := pszProcName is String ? StrPtr(pszProcName) : pszProcName

        result := ComCall(8, this, "ptr", pszProcName, "ptr*", &ppProc := 0, "HRESULT")
        return ppProc
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetInterface(rclsid, riid) {
        result := ComCall(9, this, "ptr", rclsid, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsLoadable() {
        result := ComCall(10, this, "int*", &pbLoadable := 0, "HRESULT")
        return pbLoadable
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
     * @param {PWSTR} pwzHostConfigFile 
     * @param {Pointer<Integer>} pcchHostConfigFile 
     * @returns {Integer} 
     */
    GetDefaultStartupFlags(pwzHostConfigFile, pcchHostConfigFile) {
        pwzHostConfigFile := pwzHostConfigFile is String ? StrPtr(pwzHostConfigFile) : pwzHostConfigFile

        pcchHostConfigFileMarshal := pcchHostConfigFile is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint*", &pdwStartupFlags := 0, "ptr", pwzHostConfigFile, pcchHostConfigFileMarshal, pcchHostConfigFile, "HRESULT")
        return pdwStartupFlags
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
        pbStartedMarshal := pbStarted is VarRef ? "int*" : "ptr"
        pdwStartupFlagsMarshal := pdwStartupFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pbStartedMarshal, pbStarted, pdwStartupFlagsMarshal, pdwStartupFlags, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ClrHosting {

;@region Constants

    /**
     * @type {String}
     */
    static DEPRECATED_CLR_API_MESG => "This API has been deprecated. Refer to https://go.microsoft.com/fwlink/?LinkId=143720 for more details."

    /**
     * @type {Integer (UInt32)}
     */
    static CLR_MAJOR_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLR_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLR_BUILD_VERSION => 22220

    /**
     * @type {Integer (UInt32)}
     */
    static CLR_ASSEMBLY_MAJOR_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLR_ASSEMBLY_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLR_ASSEMBLY_BUILD_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BucketParamsCount => 10

    /**
     * @type {Integer (UInt32)}
     */
    static BucketParamLength => 255

    /**
     * @type {Guid}
     */
    static LIBID_mscoree => Guid("{5477469e-83b1-11d2-8b49-00a0c9b7c9c4}")

    /**
     * @type {Guid}
     */
    static CLSID_CLRStrongName => Guid("{b79b0acd-f5cd-409b-b5a5-a16244610b92}")

    /**
     * @type {Guid}
     */
    static CLSID_CLRMetaHost => Guid("{9280188d-0e8e-4867-b30c-7fa83884e8de}")

    /**
     * @type {Guid}
     */
    static CLSID_CLRMetaHostPolicy => Guid("{2ebcd49a-1b47-4a61-b13a-4a03701e594b}")

    /**
     * @type {Guid}
     */
    static CLSID_CLRDebugging => Guid("{bacc578d-fbdd-48a4-969f-02d932b74634}")

    /**
     * @type {Guid}
     */
    static CLSID_CLRDebuggingLegacy => Guid("{df8395b5-a4ba-450b-a77c-a9a47762c520}")

    /**
     * @type {Guid}
     */
    static CLSID_CLRProfiling => Guid("{bd097ed8-733e-43fe-8ed7-a95ff9a8448c}")
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PWSTR} pbuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Integer>} dwLength 
     * @returns {HRESULT} 
     * @deprecated
     */
    static GetCORSystemDirectory(pbuffer, cchBuffer, dwLength) {
        pbuffer := pbuffer is String ? StrPtr(pbuffer) : pbuffer

        dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

        result := DllCall("MSCorEE.dll\GetCORSystemDirectory", "ptr", pbuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pbBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Integer>} dwLength 
     * @returns {HRESULT} 
     * @deprecated
     */
    static GetCORVersion(pbBuffer, cchBuffer, dwLength) {
        pbBuffer := pbBuffer is String ? StrPtr(pbBuffer) : pbBuffer

        dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

        result := DllCall("MSCorEE.dll\GetCORVersion", "ptr", pbBuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szFilename 
     * @param {PWSTR} szBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Integer>} dwLength 
     * @returns {HRESULT} 
     * @deprecated
     */
    static GetFileVersion(szFilename, szBuffer, cchBuffer, dwLength) {
        szFilename := szFilename is String ? StrPtr(szFilename) : szFilename
        szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

        dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

        result := DllCall("MSCorEE.dll\GetFileVersion", "ptr", szFilename, "ptr", szBuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pbuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Integer>} dwLength 
     * @returns {HRESULT} 
     * @deprecated
     */
    static GetCORRequiredVersion(pbuffer, cchBuffer, dwLength) {
        pbuffer := pbuffer is String ? StrPtr(pbuffer) : pbuffer

        dwLengthMarshal := dwLength is VarRef ? "uint*" : "ptr"

        result := DllCall("MSCorEE.dll\GetCORRequiredVersion", "ptr", pbuffer, "uint", cchBuffer, dwLengthMarshal, dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pExe 
     * @param {PWSTR} pwszVersion 
     * @param {PWSTR} pConfigurationFile 
     * @param {Integer} startupFlags 
     * @param {Integer} runtimeInfoFlags 
     * @param {PWSTR} pDirectory 
     * @param {Integer} dwDirectory 
     * @param {Pointer<Integer>} dwDirectoryLength 
     * @param {PWSTR} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Integer>} dwlength 
     * @returns {HRESULT} 
     * @deprecated
     */
    static GetRequestedRuntimeInfo(pExe, pwszVersion, pConfigurationFile, startupFlags, runtimeInfoFlags, pDirectory, dwDirectory, dwDirectoryLength, pVersion, cchBuffer, dwlength) {
        pExe := pExe is String ? StrPtr(pExe) : pExe
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
        pConfigurationFile := pConfigurationFile is String ? StrPtr(pConfigurationFile) : pConfigurationFile
        pDirectory := pDirectory is String ? StrPtr(pDirectory) : pDirectory
        pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

        dwDirectoryLengthMarshal := dwDirectoryLength is VarRef ? "uint*" : "ptr"
        dwlengthMarshal := dwlength is VarRef ? "uint*" : "ptr"

        result := DllCall("MSCorEE.dll\GetRequestedRuntimeInfo", "ptr", pExe, "ptr", pwszVersion, "ptr", pConfigurationFile, "uint", startupFlags, "uint", runtimeInfoFlags, "ptr", pDirectory, "uint", dwDirectory, dwDirectoryLengthMarshal, dwDirectoryLength, "ptr", pVersion, "uint", cchBuffer, dwlengthMarshal, dwlength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pExe 
     * @param {PWSTR} pVersion 
     * @param {Integer} cchBuffer 
     * @returns {Integer} 
     * @deprecated
     */
    static GetRequestedRuntimeVersion(pExe, pVersion, cchBuffer) {
        pExe := pExe is String ? StrPtr(pExe) : pExe
        pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

        result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersion", "ptr", pExe, "ptr", pVersion, "uint", cchBuffer, "uint*", &dwLength := 0, "int")
        if(result != 0)
            throw OSError(result)

        return dwLength
    }

    /**
     * 
     * @param {PWSTR} pwszVersion 
     * @param {PWSTR} pwszBuildFlavor 
     * @param {PWSTR} pwszHostConfigFile 
     * @param {Pointer<Void>} pReserved 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @deprecated
     */
    static CorBindToRuntimeHost(pwszVersion, pwszBuildFlavor, pwszHostConfigFile, pReserved, startupFlags, rclsid, riid, ppv) {
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
        pwszBuildFlavor := pwszBuildFlavor is String ? StrPtr(pwszBuildFlavor) : pwszBuildFlavor
        pwszHostConfigFile := pwszHostConfigFile is String ? StrPtr(pwszHostConfigFile) : pwszHostConfigFile

        pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\CorBindToRuntimeHost", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "ptr", pwszHostConfigFile, pReservedMarshal, pReserved, "uint", startupFlags, "ptr", rclsid, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszVersion 
     * @param {PWSTR} pwszBuildFlavor 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @deprecated
     */
    static CorBindToRuntimeEx(pwszVersion, pwszBuildFlavor, startupFlags, rclsid, riid, ppv) {
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
        pwszBuildFlavor := pwszBuildFlavor is String ? StrPtr(pwszBuildFlavor) : pwszBuildFlavor

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\CorBindToRuntimeEx", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "uint", startupFlags, "ptr", rclsid, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IStream} pCfgStream 
     * @param {Integer} reserved 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @deprecated
     */
    static CorBindToRuntimeByCfg(pCfgStream, reserved, startupFlags, rclsid, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\CorBindToRuntimeByCfg", "ptr", pCfgStream, "uint", reserved, "uint", startupFlags, "ptr", rclsid, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszVersion 
     * @param {PWSTR} pwszBuildFlavor 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @deprecated
     */
    static CorBindToRuntime(pwszVersion, pwszBuildFlavor, rclsid, riid, ppv) {
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
        pwszBuildFlavor := pwszBuildFlavor is String ? StrPtr(pwszBuildFlavor) : pwszBuildFlavor

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\CorBindToRuntime", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "ptr", rclsid, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @deprecated
     */
    static CorBindToCurrentRuntime(pwszFileName, rclsid, riid, ppv) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\CorBindToCurrentRuntime", "ptr", pwszFileName, "ptr", rclsid, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pTypeName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppObject 
     * @returns {HRESULT} 
     * @deprecated
     */
    static ClrCreateManagedInstance(pTypeName, riid, ppObject) {
        pTypeName := pTypeName is String ? StrPtr(pTypeName) : pTypeName

        ppObjectMarshal := ppObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\ClrCreateManagedInstance", "ptr", pTypeName, "ptr", riid, ppObjectMarshal, ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @deprecated
     */
    static CorMarkThreadInThreadPool() {
        DllCall("MSCorEE.dll\CorMarkThreadInThreadPool")
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HINSTANCE} hinst 
     * @param {PWSTR} lpszCmdLine 
     * @param {Integer} nCmdShow 
     * @returns {HRESULT} 
     * @deprecated
     */
    static RunDll32ShimW(hwnd, hinst, lpszCmdLine, nCmdShow) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst
        lpszCmdLine := lpszCmdLine is String ? StrPtr(lpszCmdLine) : lpszCmdLine

        result := DllCall("MSCorEE.dll\RunDll32ShimW", "ptr", hwnd, "ptr", hinst, "ptr", lpszCmdLine, "int", nCmdShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szDllName 
     * @param {PWSTR} szVersion 
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<HMODULE>} phModDll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DevNotes/loadlibraryshim
     * @deprecated
     */
    static LoadLibraryShim(szDllName, szVersion, pvReserved, phModDll) {
        szDllName := szDllName is String ? StrPtr(szDllName) : szDllName
        szVersion := szVersion is String ? StrPtr(szVersion) : szVersion

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("MSCorEE.dll\LoadLibraryShim", "ptr", szDllName, "ptr", szVersion, pvReservedMarshal, pvReserved, "ptr", phModDll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szDllName 
     * @param {PSTR} szFunctionName 
     * @param {Pointer<Void>} lpvArgument1 
     * @param {Pointer<Void>} lpvArgument2 
     * @param {PWSTR} szVersion 
     * @param {Pointer<Void>} pvReserved 
     * @returns {HRESULT} 
     * @deprecated
     */
    static CallFunctionShim(szDllName, szFunctionName, lpvArgument1, lpvArgument2, szVersion, pvReserved) {
        szDllName := szDllName is String ? StrPtr(szDllName) : szDllName
        szFunctionName := szFunctionName is String ? StrPtr(szFunctionName) : szFunctionName
        szVersion := szVersion is String ? StrPtr(szVersion) : szVersion

        lpvArgument1Marshal := lpvArgument1 is VarRef ? "ptr" : "ptr"
        lpvArgument2Marshal := lpvArgument2 is VarRef ? "ptr" : "ptr"
        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("MSCorEE.dll\CallFunctionShim", "ptr", szDllName, "ptr", szFunctionName, lpvArgument1Marshal, lpvArgument1, lpvArgument2Marshal, lpvArgument2, "ptr", szVersion, pvReservedMarshal, pvReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pwszProcName 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @deprecated
     */
    static GetRealProcAddress(pwszProcName, ppv) {
        pwszProcName := pwszProcName is String ? StrPtr(pwszProcName) : pwszProcName

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\GetRealProcAddress", "ptr", pwszProcName, ppvMarshal, ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} exitCode 
     * @returns {String} Nothing - always returns an empty string
     * @deprecated
     */
    static CorExitProcess(exitCode) {
        DllCall("MSCorEE.dll\CorExitProcess", "int", exitCode)
    }

    /**
     * 
     * @param {Integer} iResouceID 
     * @param {PWSTR} szBuffer 
     * @param {Integer} iMax 
     * @param {Integer} bQuiet 
     * @returns {HRESULT} 
     * @deprecated
     */
    static LoadStringRC(iResouceID, szBuffer, iMax, bQuiet) {
        szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

        result := DllCall("MSCorEE.dll\LoadStringRC", "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Integer} iResouceID 
     * @param {PWSTR} szBuffer 
     * @param {Integer} iMax 
     * @param {Integer} bQuiet 
     * @param {Pointer<Integer>} pcwchUsed 
     * @returns {HRESULT} 
     * @deprecated
     */
    static LoadStringRCEx(lcid, iResouceID, szBuffer, iMax, bQuiet, pcwchUsed) {
        szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

        pcwchUsedMarshal := pcwchUsed is VarRef ? "int*" : "ptr"

        result := DllCall("MSCorEE.dll\LoadStringRCEx", "uint", lcid, "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, pcwchUsedMarshal, pcwchUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FLockClrVersionCallback>} hostCallback 
     * @param {Pointer<Pointer<FLockClrVersionCallback>>} pBeginHostSetup 
     * @param {Pointer<Pointer<FLockClrVersionCallback>>} pEndHostSetup 
     * @returns {HRESULT} 
     * @deprecated
     */
    static LockClrVersion(hostCallback, pBeginHostSetup, pEndHostSetup) {
        pBeginHostSetupMarshal := pBeginHostSetup is VarRef ? "ptr*" : "ptr"
        pEndHostSetupMarshal := pEndHostSetup is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\LockClrVersion", "ptr", hostCallback, pBeginHostSetupMarshal, pBeginHostSetup, pEndHostSetupMarshal, pEndHostSetup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iDebuggerVersion 
     * @param {PWSTR} szDebuggeeVersion 
     * @returns {IUnknown} 
     * @deprecated
     */
    static CreateDebuggingInterfaceFromVersion(iDebuggerVersion, szDebuggeeVersion) {
        szDebuggeeVersion := szDebuggeeVersion is String ? StrPtr(szDebuggeeVersion) : szDebuggeeVersion

        result := DllCall("MSCorEE.dll\CreateDebuggingInterfaceFromVersion", "int", iDebuggerVersion, "ptr", szDebuggeeVersion, "ptr*", &ppCordb := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppCordb)
    }

    /**
     * 
     * @param {HANDLE} hProcess 
     * @param {PWSTR} pVersion 
     * @param {Integer} cchBuffer 
     * @returns {Integer} 
     * @deprecated
     */
    static GetVersionFromProcess(hProcess, pVersion, cchBuffer) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

        result := DllCall("MSCorEE.dll\GetVersionFromProcess", "ptr", hProcess, "ptr", pVersion, "uint", cchBuffer, "uint*", &dwLength := 0, "int")
        if(result != 0)
            throw OSError(result)

        return dwLength
    }

    /**
     * 
     * @param {Integer} dwClickOnceHost 
     * @param {PWSTR} pwzAppFullName 
     * @param {Integer} dwManifestPaths 
     * @param {Pointer<PWSTR>} ppwzManifestPaths 
     * @param {Integer} dwActivationData 
     * @param {Pointer<PWSTR>} ppwzActivationData 
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation 
     * @returns {HRESULT} 
     */
    static CorLaunchApplication(dwClickOnceHost, pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData, lpProcessInformation) {
        pwzAppFullName := pwzAppFullName is String ? StrPtr(pwzAppFullName) : pwzAppFullName

        ppwzManifestPathsMarshal := ppwzManifestPaths is VarRef ? "ptr*" : "ptr"
        ppwzActivationDataMarshal := ppwzActivationData is VarRef ? "ptr*" : "ptr"

        result := DllCall("MSCorEE.dll\CorLaunchApplication", "int", dwClickOnceHost, "ptr", pwzAppFullName, "uint", dwManifestPaths, ppwzManifestPathsMarshal, ppwzManifestPaths, "uint", dwActivationData, ppwzActivationDataMarshal, ppwzActivationData, "ptr", lpProcessInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {PWSTR} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Integer} dwResolutionFlags 
     * @returns {Integer} 
     */
    static GetRequestedRuntimeVersionForCLSID(rclsid, pVersion, cchBuffer, dwResolutionFlags) {
        pVersion := pVersion is String ? StrPtr(pVersion) : pVersion

        result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersionForCLSID", "ptr", rclsid, "ptr", pVersion, "uint", cchBuffer, "uint*", &dwLength := 0, "int", dwResolutionFlags, "int")
        if(result != 0)
            throw OSError(result)

        return dwLength
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    static GetCLRIdentityManager(riid) {
        result := DllCall("MSCorEE.dll\GetCLRIdentityManager", "ptr", riid, "ptr*", &ppManager := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppManager)
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    static CLRCreateInstance(clsid, riid) {
        result := DllCall("MSCorEE.dll\CLRCreateInstance", "ptr", clsid, "ptr", riid, "ptr*", &ppInterface := 0, "int")
        if(result != 0)
            throw OSError(result)

        return ppInterface
    }

;@endregion Methods
}

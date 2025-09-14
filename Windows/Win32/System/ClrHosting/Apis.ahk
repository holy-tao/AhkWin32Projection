#Requires AutoHotkey v2.0.0 64-bit

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
     * @type {String}
     */
    static LIBID_mscoree => "{5477469e-83b1-11d2-8b49-00a0c9b7c9c4}"

    /**
     * @type {String}
     */
    static CLSID_CLRStrongName => "{b79b0acd-f5cd-409b-b5a5-a16244610b92}"

    /**
     * @type {String}
     */
    static CLSID_CLRMetaHost => "{9280188d-0e8e-4867-b30c-7fa83884e8de}"

    /**
     * @type {String}
     */
    static CLSID_CLRMetaHostPolicy => "{2ebcd49a-1b47-4a61-b13a-4a03701e594b}"

    /**
     * @type {String}
     */
    static CLSID_CLRDebugging => "{bacc578d-fbdd-48a4-969f-02d932b74634}"

    /**
     * @type {String}
     */
    static CLSID_CLRDebuggingLegacy => "{df8395b5-a4ba-450b-a77c-a9a47762c520}"

    /**
     * @type {String}
     */
    static CLSID_CLRProfiling => "{bd097ed8-733e-43fe-8ed7-a95ff9a8448c}"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<PWSTR>} pbuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetCORSystemDirectory(pbuffer, cchBuffer, dwLength) {
        result := DllCall("MSCorEE.dll\GetCORSystemDirectory", "ptr", pbuffer, "uint", cchBuffer, "ptr", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pbBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetCORVersion(pbBuffer, cchBuffer, dwLength) {
        result := DllCall("MSCorEE.dll\GetCORVersion", "ptr", pbBuffer, "uint", cchBuffer, "ptr", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szFilename 
     * @param {Pointer<PWSTR>} szBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetFileVersion(szFilename, szBuffer, cchBuffer, dwLength) {
        result := DllCall("MSCorEE.dll\GetFileVersion", "ptr", szFilename, "ptr", szBuffer, "uint", cchBuffer, "ptr", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pbuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetCORRequiredVersion(pbuffer, cchBuffer, dwLength) {
        result := DllCall("MSCorEE.dll\GetCORRequiredVersion", "ptr", pbuffer, "uint", cchBuffer, "ptr", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pExe 
     * @param {Pointer<PWSTR>} pwszVersion 
     * @param {Pointer<PWSTR>} pConfigurationFile 
     * @param {Integer} startupFlags 
     * @param {Integer} runtimeInfoFlags 
     * @param {Pointer<PWSTR>} pDirectory 
     * @param {Integer} dwDirectory 
     * @param {Pointer<UInt32>} dwDirectoryLength 
     * @param {Pointer<PWSTR>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwlength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetRequestedRuntimeInfo(pExe, pwszVersion, pConfigurationFile, startupFlags, runtimeInfoFlags, pDirectory, dwDirectory, dwDirectoryLength, pVersion, cchBuffer, dwlength) {
        result := DllCall("MSCorEE.dll\GetRequestedRuntimeInfo", "ptr", pExe, "ptr", pwszVersion, "ptr", pConfigurationFile, "uint", startupFlags, "uint", runtimeInfoFlags, "ptr", pDirectory, "uint", dwDirectory, "ptr", dwDirectoryLength, "ptr", pVersion, "uint", cchBuffer, "ptr", dwlength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pExe 
     * @param {Pointer<PWSTR>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetRequestedRuntimeVersion(pExe, pVersion, cchBuffer, dwLength) {
        result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersion", "ptr", pExe, "ptr", pVersion, "uint", cchBuffer, "ptr", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszVersion 
     * @param {Pointer<PWSTR>} pwszBuildFlavor 
     * @param {Pointer<PWSTR>} pwszHostConfigFile 
     * @param {Pointer<Void>} pReserved 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToRuntimeHost(pwszVersion, pwszBuildFlavor, pwszHostConfigFile, pReserved, startupFlags, rclsid, riid, ppv) {
        result := DllCall("MSCorEE.dll\CorBindToRuntimeHost", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "ptr", pwszHostConfigFile, "ptr", pReserved, "uint", startupFlags, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszVersion 
     * @param {Pointer<PWSTR>} pwszBuildFlavor 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToRuntimeEx(pwszVersion, pwszBuildFlavor, startupFlags, rclsid, riid, ppv) {
        result := DllCall("MSCorEE.dll\CorBindToRuntimeEx", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "uint", startupFlags, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pCfgStream 
     * @param {Integer} reserved 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToRuntimeByCfg(pCfgStream, reserved, startupFlags, rclsid, riid, ppv) {
        result := DllCall("MSCorEE.dll\CorBindToRuntimeByCfg", "ptr", pCfgStream, "uint", reserved, "uint", startupFlags, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszVersion 
     * @param {Pointer<PWSTR>} pwszBuildFlavor 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToRuntime(pwszVersion, pwszBuildFlavor, rclsid, riid, ppv) {
        result := DllCall("MSCorEE.dll\CorBindToRuntime", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszFileName 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToCurrentRuntime(pwszFileName, rclsid, riid, ppv) {
        result := DllCall("MSCorEE.dll\CorBindToCurrentRuntime", "ptr", pwszFileName, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pTypeName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppObject 
     * @returns {Integer} 
     * @deprecated
     */
    static ClrCreateManagedInstance(pTypeName, riid, ppObject) {
        result := DllCall("MSCorEE.dll\ClrCreateManagedInstance", "ptr", pTypeName, "ptr", riid, "ptr", ppObject, "int")
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
     * @param {Pointer<HWND>} hwnd 
     * @param {Pointer<HINSTANCE>} hinst 
     * @param {Pointer<PWSTR>} lpszCmdLine 
     * @param {Integer} nCmdShow 
     * @returns {Integer} 
     * @deprecated
     */
    static RunDll32ShimW(hwnd, hinst, lpszCmdLine, nCmdShow) {
        result := DllCall("MSCorEE.dll\RunDll32ShimW", "ptr", hwnd, "ptr", hinst, "ptr", lpszCmdLine, "int", nCmdShow, "int")
        return result
    }

    /**
     * Loads a specified version of a .NET Framework library DLL.
     * @remarks
     * This function is used to load library DLLs that are included in the .NET Framework redistributable package, not user-generated DLLs.
     * 
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {Pointer<PWSTR>} szDllName The name of the DLL to be loaded from the .NET Framework.
     * @param {Pointer<PWSTR>} szVersion The version of the DLL to be loaded. If *szVersion* is **NULL**, the latest version of the specified DLL is loaded.
     * @param {Pointer<Void>} pvReserved Reserved.
     * @param {Pointer<HMODULE>} phModDll A handle to the module.
     * @returns {Integer} If this function succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/loadlibraryshim
     * @deprecated
     */
    static LoadLibraryShim(szDllName, szVersion, pvReserved, phModDll) {
        result := DllCall("MSCorEE.dll\LoadLibraryShim", "ptr", szDllName, "ptr", szVersion, "ptr", pvReserved, "ptr", phModDll, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szDllName 
     * @param {Pointer<PSTR>} szFunctionName 
     * @param {Pointer<Void>} lpvArgument1 
     * @param {Pointer<Void>} lpvArgument2 
     * @param {Pointer<PWSTR>} szVersion 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} 
     * @deprecated
     */
    static CallFunctionShim(szDllName, szFunctionName, lpvArgument1, lpvArgument2, szVersion, pvReserved) {
        result := DllCall("MSCorEE.dll\CallFunctionShim", "ptr", szDllName, "ptr", szFunctionName, "ptr", lpvArgument1, "ptr", lpvArgument2, "ptr", szVersion, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pwszProcName 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static GetRealProcAddress(pwszProcName, ppv) {
        result := DllCall("MSCorEE.dll\GetRealProcAddress", "ptr", pwszProcName, "ptr", ppv, "int")
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
     * @param {Pointer<PWSTR>} szBuffer 
     * @param {Integer} iMax 
     * @param {Integer} bQuiet 
     * @returns {Integer} 
     * @deprecated
     */
    static LoadStringRC(iResouceID, szBuffer, iMax, bQuiet) {
        result := DllCall("MSCorEE.dll\LoadStringRC", "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, "int")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Integer} iResouceID 
     * @param {Pointer<PWSTR>} szBuffer 
     * @param {Integer} iMax 
     * @param {Integer} bQuiet 
     * @param {Pointer<Int32>} pcwchUsed 
     * @returns {Integer} 
     * @deprecated
     */
    static LoadStringRCEx(lcid, iResouceID, szBuffer, iMax, bQuiet, pcwchUsed) {
        result := DllCall("MSCorEE.dll\LoadStringRCEx", "uint", lcid, "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, "ptr", pcwchUsed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FLockClrVersionCallback>} hostCallback 
     * @param {Pointer<FLockClrVersionCallback>} pBeginHostSetup 
     * @param {Pointer<FLockClrVersionCallback>} pEndHostSetup 
     * @returns {Integer} 
     * @deprecated
     */
    static LockClrVersion(hostCallback, pBeginHostSetup, pEndHostSetup) {
        result := DllCall("MSCorEE.dll\LockClrVersion", "ptr", hostCallback, "ptr", pBeginHostSetup, "ptr", pEndHostSetup, "int")
        return result
    }

    /**
     * 
     * @param {Integer} iDebuggerVersion 
     * @param {Pointer<PWSTR>} szDebuggeeVersion 
     * @param {Pointer<IUnknown>} ppCordb 
     * @returns {Integer} 
     * @deprecated
     */
    static CreateDebuggingInterfaceFromVersion(iDebuggerVersion, szDebuggeeVersion, ppCordb) {
        result := DllCall("MSCorEE.dll\CreateDebuggingInterfaceFromVersion", "int", iDebuggerVersion, "ptr", szDebuggeeVersion, "ptr", ppCordb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hProcess 
     * @param {Pointer<PWSTR>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetVersionFromProcess(hProcess, pVersion, cchBuffer, dwLength) {
        result := DllCall("MSCorEE.dll\GetVersionFromProcess", "ptr", hProcess, "ptr", pVersion, "uint", cchBuffer, "ptr", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwClickOnceHost 
     * @param {Pointer<PWSTR>} pwzAppFullName 
     * @param {Integer} dwManifestPaths 
     * @param {Pointer<PWSTR>} ppwzManifestPaths 
     * @param {Integer} dwActivationData 
     * @param {Pointer<PWSTR>} ppwzActivationData 
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation 
     * @returns {Integer} 
     */
    static CorLaunchApplication(dwClickOnceHost, pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData, lpProcessInformation) {
        result := DllCall("MSCorEE.dll\CorLaunchApplication", "int", dwClickOnceHost, "ptr", pwzAppFullName, "uint", dwManifestPaths, "ptr", ppwzManifestPaths, "uint", dwActivationData, "ptr", ppwzActivationData, "ptr", lpProcessInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<PWSTR>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @param {Integer} dwResolutionFlags 
     * @returns {Integer} 
     */
    static GetRequestedRuntimeVersionForCLSID(rclsid, pVersion, cchBuffer, dwLength, dwResolutionFlags) {
        result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersionForCLSID", "ptr", rclsid, "ptr", pVersion, "uint", cchBuffer, "ptr", dwLength, "int", dwResolutionFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppManager 
     * @returns {Integer} 
     */
    static GetCLRIdentityManager(riid, ppManager) {
        result := DllCall("MSCorEE.dll\GetCLRIdentityManager", "ptr", riid, "ptr", ppManager, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppInterface 
     * @returns {Integer} 
     */
    static CLRCreateInstance(clsid, riid, ppInterface) {
        result := DllCall("MSCorEE.dll\CLRCreateInstance", "ptr", clsid, "ptr", riid, "ptr", ppInterface, "int")
        return result
    }

;@endregion Methods
}

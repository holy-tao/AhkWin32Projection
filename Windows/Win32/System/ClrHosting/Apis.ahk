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
     * @param {Pointer<Char>} pbuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetCORSystemDirectory(pbuffer, cchBuffer, dwLength) {
        pbuffer := pbuffer is String? StrPtr(pbuffer) : pbuffer

        result := DllCall("MSCorEE.dll\GetCORSystemDirectory", "ptr", pbuffer, "uint", cchBuffer, "uint*", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pbBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetCORVersion(pbBuffer, cchBuffer, dwLength) {
        pbBuffer := pbBuffer is String? StrPtr(pbBuffer) : pbBuffer

        result := DllCall("MSCorEE.dll\GetCORVersion", "ptr", pbBuffer, "uint", cchBuffer, "uint*", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} szFilename 
     * @param {Pointer<Char>} szBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetFileVersion(szFilename, szBuffer, cchBuffer, dwLength) {
        szFilename := szFilename is String? StrPtr(szFilename) : szFilename
        szBuffer := szBuffer is String? StrPtr(szBuffer) : szBuffer

        result := DllCall("MSCorEE.dll\GetFileVersion", "ptr", szFilename, "ptr", szBuffer, "uint", cchBuffer, "uint*", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pbuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetCORRequiredVersion(pbuffer, cchBuffer, dwLength) {
        pbuffer := pbuffer is String? StrPtr(pbuffer) : pbuffer

        result := DllCall("MSCorEE.dll\GetCORRequiredVersion", "ptr", pbuffer, "uint", cchBuffer, "uint*", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pExe 
     * @param {Pointer<Char>} pwszVersion 
     * @param {Pointer<Char>} pConfigurationFile 
     * @param {Integer} startupFlags 
     * @param {Integer} runtimeInfoFlags 
     * @param {Pointer<Char>} pDirectory 
     * @param {Integer} dwDirectory 
     * @param {Pointer<UInt32>} dwDirectoryLength 
     * @param {Pointer<Char>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwlength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetRequestedRuntimeInfo(pExe, pwszVersion, pConfigurationFile, startupFlags, runtimeInfoFlags, pDirectory, dwDirectory, dwDirectoryLength, pVersion, cchBuffer, dwlength) {
        pExe := pExe is String? StrPtr(pExe) : pExe
        pwszVersion := pwszVersion is String? StrPtr(pwszVersion) : pwszVersion
        pConfigurationFile := pConfigurationFile is String? StrPtr(pConfigurationFile) : pConfigurationFile
        pDirectory := pDirectory is String? StrPtr(pDirectory) : pDirectory
        pVersion := pVersion is String? StrPtr(pVersion) : pVersion

        result := DllCall("MSCorEE.dll\GetRequestedRuntimeInfo", "ptr", pExe, "ptr", pwszVersion, "ptr", pConfigurationFile, "uint", startupFlags, "uint", runtimeInfoFlags, "ptr", pDirectory, "uint", dwDirectory, "uint*", dwDirectoryLength, "ptr", pVersion, "uint", cchBuffer, "uint*", dwlength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pExe 
     * @param {Pointer<Char>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetRequestedRuntimeVersion(pExe, pVersion, cchBuffer, dwLength) {
        pExe := pExe is String? StrPtr(pExe) : pExe
        pVersion := pVersion is String? StrPtr(pVersion) : pVersion

        result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersion", "ptr", pExe, "ptr", pVersion, "uint", cchBuffer, "uint*", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pwszVersion 
     * @param {Pointer<Char>} pwszBuildFlavor 
     * @param {Pointer<Char>} pwszHostConfigFile 
     * @param {Pointer<Void>} pReserved 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToRuntimeHost(pwszVersion, pwszBuildFlavor, pwszHostConfigFile, pReserved, startupFlags, rclsid, riid, ppv) {
        pwszVersion := pwszVersion is String? StrPtr(pwszVersion) : pwszVersion
        pwszBuildFlavor := pwszBuildFlavor is String? StrPtr(pwszBuildFlavor) : pwszBuildFlavor
        pwszHostConfigFile := pwszHostConfigFile is String? StrPtr(pwszHostConfigFile) : pwszHostConfigFile

        result := DllCall("MSCorEE.dll\CorBindToRuntimeHost", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "ptr", pwszHostConfigFile, "ptr", pReserved, "uint", startupFlags, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pwszVersion 
     * @param {Pointer<Char>} pwszBuildFlavor 
     * @param {Integer} startupFlags 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToRuntimeEx(pwszVersion, pwszBuildFlavor, startupFlags, rclsid, riid, ppv) {
        pwszVersion := pwszVersion is String? StrPtr(pwszVersion) : pwszVersion
        pwszBuildFlavor := pwszBuildFlavor is String? StrPtr(pwszBuildFlavor) : pwszBuildFlavor

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
     * @param {Pointer<Char>} pwszVersion 
     * @param {Pointer<Char>} pwszBuildFlavor 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToRuntime(pwszVersion, pwszBuildFlavor, rclsid, riid, ppv) {
        pwszVersion := pwszVersion is String? StrPtr(pwszVersion) : pwszVersion
        pwszBuildFlavor := pwszBuildFlavor is String? StrPtr(pwszBuildFlavor) : pwszBuildFlavor

        result := DllCall("MSCorEE.dll\CorBindToRuntime", "ptr", pwszVersion, "ptr", pwszBuildFlavor, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pwszFileName 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static CorBindToCurrentRuntime(pwszFileName, rclsid, riid, ppv) {
        pwszFileName := pwszFileName is String? StrPtr(pwszFileName) : pwszFileName

        result := DllCall("MSCorEE.dll\CorBindToCurrentRuntime", "ptr", pwszFileName, "ptr", rclsid, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pTypeName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppObject 
     * @returns {Integer} 
     * @deprecated
     */
    static ClrCreateManagedInstance(pTypeName, riid, ppObject) {
        pTypeName := pTypeName is String? StrPtr(pTypeName) : pTypeName

        result := DllCall("MSCorEE.dll\ClrCreateManagedInstance", "ptr", pTypeName, "ptr", riid, "ptr", ppObject, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     * @deprecated
     */
    static CorMarkThreadInThreadPool() {
        result := DllCall("MSCorEE.dll\CorMarkThreadInThreadPool")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hwnd 
     * @param {Pointer<Void>} hinst 
     * @param {Pointer<Char>} lpszCmdLine 
     * @param {Integer} nCmdShow 
     * @returns {Integer} 
     * @deprecated
     */
    static RunDll32ShimW(hwnd, hinst, lpszCmdLine, nCmdShow) {
        lpszCmdLine := lpszCmdLine is String? StrPtr(lpszCmdLine) : lpszCmdLine

        result := DllCall("MSCorEE.dll\RunDll32ShimW", "ptr", hwnd, "ptr", hinst, "ptr", lpszCmdLine, "int", nCmdShow, "int")
        return result
    }

    /**
     * Loads a specified version of a .NET Framework library DLL.
     * @remarks
     * This function is used to load library DLLs that are included in the .NET Framework redistributable package, not user-generated DLLs.
     * 
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {Pointer<Char>} szDllName The name of the DLL to be loaded from the .NET Framework.
     * @param {Pointer<Char>} szVersion The version of the DLL to be loaded. If *szVersion* is **NULL**, the latest version of the specified DLL is loaded.
     * @param {Pointer<Void>} pvReserved Reserved.
     * @param {Pointer<Void>} phModDll A handle to the module.
     * @returns {Integer} If this function succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/loadlibraryshim
     * @deprecated
     */
    static LoadLibraryShim(szDllName, szVersion, pvReserved, phModDll) {
        szDllName := szDllName is String? StrPtr(szDllName) : szDllName
        szVersion := szVersion is String? StrPtr(szVersion) : szVersion

        result := DllCall("MSCorEE.dll\LoadLibraryShim", "ptr", szDllName, "ptr", szVersion, "ptr", pvReserved, "ptr", phModDll, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} szDllName 
     * @param {Pointer<Byte>} szFunctionName 
     * @param {Pointer<Void>} lpvArgument1 
     * @param {Pointer<Void>} lpvArgument2 
     * @param {Pointer<Char>} szVersion 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} 
     * @deprecated
     */
    static CallFunctionShim(szDllName, szFunctionName, lpvArgument1, lpvArgument2, szVersion, pvReserved) {
        szDllName := szDllName is String? StrPtr(szDllName) : szDllName
        szFunctionName := szFunctionName is String? StrPtr(szFunctionName) : szFunctionName
        szVersion := szVersion is String? StrPtr(szVersion) : szVersion

        result := DllCall("MSCorEE.dll\CallFunctionShim", "ptr", szDllName, "ptr", szFunctionName, "ptr", lpvArgument1, "ptr", lpvArgument2, "ptr", szVersion, "ptr", pvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pwszProcName 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     * @deprecated
     */
    static GetRealProcAddress(pwszProcName, ppv) {
        pwszProcName := pwszProcName is String? StrPtr(pwszProcName) : pwszProcName

        result := DllCall("MSCorEE.dll\GetRealProcAddress", "ptr", pwszProcName, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Integer} exitCode 
     * @returns {Pointer} 
     * @deprecated
     */
    static CorExitProcess(exitCode) {
        result := DllCall("MSCorEE.dll\CorExitProcess", "int", exitCode)
        return result
    }

    /**
     * 
     * @param {Integer} iResouceID 
     * @param {Pointer<Char>} szBuffer 
     * @param {Integer} iMax 
     * @param {Integer} bQuiet 
     * @returns {Integer} 
     * @deprecated
     */
    static LoadStringRC(iResouceID, szBuffer, iMax, bQuiet) {
        szBuffer := szBuffer is String? StrPtr(szBuffer) : szBuffer

        result := DllCall("MSCorEE.dll\LoadStringRC", "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, "int")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Integer} iResouceID 
     * @param {Pointer<Char>} szBuffer 
     * @param {Integer} iMax 
     * @param {Integer} bQuiet 
     * @param {Pointer<Int32>} pcwchUsed 
     * @returns {Integer} 
     * @deprecated
     */
    static LoadStringRCEx(lcid, iResouceID, szBuffer, iMax, bQuiet, pcwchUsed) {
        szBuffer := szBuffer is String? StrPtr(szBuffer) : szBuffer

        result := DllCall("MSCorEE.dll\LoadStringRCEx", "uint", lcid, "uint", iResouceID, "ptr", szBuffer, "int", iMax, "int", bQuiet, "int*", pcwchUsed, "int")
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
     * @param {Pointer<Char>} szDebuggeeVersion 
     * @param {Pointer<IUnknown>} ppCordb 
     * @returns {Integer} 
     * @deprecated
     */
    static CreateDebuggingInterfaceFromVersion(iDebuggerVersion, szDebuggeeVersion, ppCordb) {
        szDebuggeeVersion := szDebuggeeVersion is String? StrPtr(szDebuggeeVersion) : szDebuggeeVersion

        result := DllCall("MSCorEE.dll\CreateDebuggingInterfaceFromVersion", "int", iDebuggerVersion, "ptr", szDebuggeeVersion, "ptr", ppCordb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Char>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @returns {Integer} 
     * @deprecated
     */
    static GetVersionFromProcess(hProcess, pVersion, cchBuffer, dwLength) {
        pVersion := pVersion is String? StrPtr(pVersion) : pVersion

        result := DllCall("MSCorEE.dll\GetVersionFromProcess", "ptr", hProcess, "ptr", pVersion, "uint", cchBuffer, "uint*", dwLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwClickOnceHost 
     * @param {Pointer<Char>} pwzAppFullName 
     * @param {Integer} dwManifestPaths 
     * @param {Pointer<Char>} ppwzManifestPaths 
     * @param {Integer} dwActivationData 
     * @param {Pointer<Char>} ppwzActivationData 
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation 
     * @returns {Integer} 
     */
    static CorLaunchApplication(dwClickOnceHost, pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData, lpProcessInformation) {
        pwzAppFullName := pwzAppFullName is String? StrPtr(pwzAppFullName) : pwzAppFullName

        result := DllCall("MSCorEE.dll\CorLaunchApplication", "int", dwClickOnceHost, "ptr", pwzAppFullName, "uint", dwManifestPaths, "ptr", ppwzManifestPaths, "uint", dwActivationData, "ptr", ppwzActivationData, "ptr", lpProcessInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Char>} pVersion 
     * @param {Integer} cchBuffer 
     * @param {Pointer<UInt32>} dwLength 
     * @param {Integer} dwResolutionFlags 
     * @returns {Integer} 
     */
    static GetRequestedRuntimeVersionForCLSID(rclsid, pVersion, cchBuffer, dwLength, dwResolutionFlags) {
        pVersion := pVersion is String? StrPtr(pVersion) : pVersion

        result := DllCall("MSCorEE.dll\GetRequestedRuntimeVersionForCLSID", "ptr", rclsid, "ptr", pVersion, "uint", cchBuffer, "uint*", dwLength, "int", dwResolutionFlags, "int")
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

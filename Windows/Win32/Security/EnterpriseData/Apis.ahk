#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\SRPHOSTING_TYPE.ahk" { SRPHOSTING_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ENTERPRISE_DATA_POLICIES.ahk" { ENTERPRISE_DATA_POLICIES }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FILE_UNPROTECT_OPTIONS.ahk" { FILE_UNPROTECT_OPTIONS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\HTHREAD_NETWORK_CONTEXT.ahk" { HTHREAD_NETWORK_CONTEXT }
#Import ".\SRPHOSTING_VERSION.ahk" { SRPHOSTING_VERSION }
#Import "..\..\Storage\Packaging\Appx\PACKAGE_ID.ahk" { PACKAGE_ID }
#Import ".\_SRP_REQUEST.ahk" { _SRP_REQUEST }

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 */

;@region Functions
/**
 * Sets the enterprise ID as the data context of the current thread. This is allowed only if the process already has the same enterprise ID present in its process context. It optionally returns the existing thread token.
 * @param {PWSTR} enterpriseId The enterprise ID to set in the current thread's token.
 * @param {Pointer<HTHREAD_NETWORK_CONTEXT>} threadNetworkContext On success, holds the existing thread token.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpcreatethreadnetworkcontext
 * @since windows10.0.10240
 */
export SrpCreateThreadNetworkContext(enterpriseId, threadNetworkContext) {
    enterpriseId := enterpriseId is String ? StrPtr(enterpriseId) : enterpriseId

    result := DllCall("srpapi.dll\SrpCreateThreadNetworkContext", "ptr", enterpriseId, HTHREAD_NETWORK_CONTEXT.Ptr, threadNetworkContext, "HRESULT")
    return result
}

/**
 * Restores a thread back to the original context, which may have been optionally returned from SrpCreateThreadNetworkContext.
 * @param {Pointer<HTHREAD_NETWORK_CONTEXT>} threadNetworkContext A handle to the original context’s token.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpclosethreadnetworkcontext
 * @since windows10.0.10240
 */
export SrpCloseThreadNetworkContext(threadNetworkContext) {
    result := DllCall("srpapi.dll\SrpCloseThreadNetworkContext", HTHREAD_NETWORK_CONTEXT.Ptr, threadNetworkContext, "HRESULT")
    return result
}

/**
 * Sets a data intent on a token. The caller process should be enterprise allowed for the provided enterprise ID.
 * @param {HANDLE} tokenHandle The token handle on which the intent is to be set.
 * @param {PWSTR} enterpriseId The enterprise ID to set as intent.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpsettokenenterpriseid
 * @since windows10.0.10240
 */
export SrpSetTokenEnterpriseId(tokenHandle, enterpriseId) {
    enterpriseId := enterpriseId is String ? StrPtr(enterpriseId) : enterpriseId

    result := DllCall("srpapi.dll\SrpSetTokenEnterpriseId", HANDLE, tokenHandle, "ptr", enterpriseId, "HRESULT")
    return result
}

/**
 * Gets the list of enterprise identifiers for the given token.
 * @param {HANDLE} tokenHandle Token Handle to be checked.
 * @param {Pointer<Integer>} numberOfBytes If <i>enterpriseIds</i> is provided, then this supplies the size of the <i>enterpriseIds</i> buffer. If you provide a buffer size, and it's too small, the output will contain the required size of the <i>enterpriseIds</i> buffer.
 * @param {Integer} enterpriseIds An array of enterprise ID string pointers.
 * @returns {Integer} The enterprise ID count on the token. Zero if the token is not explicitly enterprise allowed.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpgetenterpriseids
 * @since windows10.0.10240
 */
export SrpGetEnterpriseIds(tokenHandle, numberOfBytes, enterpriseIds) {
    numberOfBytesMarshal := numberOfBytes is VarRef ? "uint*" : "ptr"

    result := DllCall("srpapi.dll\SrpGetEnterpriseIds", HANDLE, tokenHandle, numberOfBytesMarshal, numberOfBytes, "ptr", enterpriseIds, "uint*", &enterpriseIdCount := 0, "HRESULT")
    return enterpriseIdCount
}

/**
 * Enables permissive mode for file encryption on the current thread and all threads this thread will create or post work to.
 * @param {PWSTR} enterpriseId Contains enterprise ID string. In TH2 this is not used.
 * @returns {HRESULT} If this function succeeds, it returns S_OK. 
 * 
 * HRESULT_FROM_WIN32 (ERROR_INVALID_STATE) indicates that thread tagging cannot be performed due to either process or thread context.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpenablepermissivemodefileencryption
 * @since windows10.0.10240
 */
export SrpEnablePermissiveModeFileEncryption(enterpriseId) {
    enterpriseId := enterpriseId is String ? StrPtr(enterpriseId) : enterpriseId

    result := DllCall("srpapi.dll\SrpEnablePermissiveModeFileEncryption", "ptr", enterpriseId, "HRESULT")
    return result
}

/**
 * Disables permissive mode for file encryption on the current thread.
 * @returns {HRESULT} If this function succeeds, it returns S_OK. 
 * 
 * HRESULT_FROM_WIN32 (ERROR_INVALID_STATE) indicates that thread tagging cannot be performed due to either process or thread context.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpdisablepermissivemodefileencryption
 * @since windows10.0.10240
 */
export SrpDisablePermissiveModeFileEncryption() {
    result := DllCall("srpapi.dll\SrpDisablePermissiveModeFileEncryption", "HRESULT")
    return result
}

/**
 * Policy can be applied on Windows 10, version 1607.Gets information about the enterprise policy of an app.
 * @param {HANDLE} tokenHandle Token Handle to be checked.
 * @returns {ENTERPRISE_DATA_POLICIES} A collection of flags that indicate among other things whether the host app is allowed by the managing enterprise policy, and has been enlightened for Windows Information Protection.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpgetenterprisepolicy
 * @since windows10.0.10240
 */
export SrpGetEnterprisePolicy(tokenHandle) {
    result := DllCall("srpapi.dll\SrpGetEnterprisePolicy", HANDLE, tokenHandle, "int*", &policyFlags := 0, "HRESULT")
    return policyFlags
}

/**
 * Identifies whether a service is a token service.
 * @param {HANDLE} TokenHandle Token Handle to be checked.
 * @param {Pointer<Integer>} IsTokenService A boolean value that indicates whether the service is a token service.
 * @returns {NTSTATUS} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpistokenservice
 * @since windows10.0.10240
 */
export SrpIsTokenService(TokenHandle, IsTokenService) {
    IsTokenServiceMarshal := IsTokenService is VarRef ? "char*" : "ptr"

    result := DllCall("srpapi.dll\SrpIsTokenService", HANDLE, TokenHandle, IsTokenServiceMarshal, IsTokenService, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Evaluates whether a packaged app will be allowed to execute based on software restriction policies.
 * @param {Pointer<PACKAGE_ID>} packageId Provides package name, publisher name, and version of the packaged app.
 * @returns {BOOL} A boolean value that indicates whether the app is allowed to execute.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/nf-srpapi-srpdoespolicyallowappexecution
 * @since windows10.0.10240
 */
export SrpDoesPolicyAllowAppExecution(packageId) {
    result := DllCall("srpapi.dll\SrpDoesPolicyAllowAppExecution", PACKAGE_ID.Ptr, packageId, BOOL.Ptr, &isAllowed := 0, "HRESULT")
    return isAllowed
}

/**
 * 
 * @param {Pointer<_SRP_REQUEST>} FileInfo 
 * @returns {NTSTATUS} 
 */
export SrpIsAllowed(FileInfo) {
    FileInfoMarshal := FileInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("srpapi.dll\SrpIsAllowed", FileInfoMarshal, FileInfo, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {SRPHOSTING_VERSION} _Version 
 * @param {SRPHOSTING_TYPE} Type 
 * @param {Pointer<Void>} pvData 
 * @param {Integer} cbData 
 * @returns {HRESULT} 
 */
export SrpHostingInitialize(_Version, Type, pvData, cbData) {
    pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

    result := DllCall("srpapi.dll\SrpHostingInitialize", SRPHOSTING_VERSION, _Version, SRPHOSTING_TYPE, Type, pvDataMarshal, pvData, "uint", cbData, "HRESULT")
    return result
}

/**
 * 
 * @param {SRPHOSTING_TYPE} Type 
 * @returns {String} Nothing - always returns an empty string
 */
export SrpHostingTerminate(Type) {
    DllCall("srpapi.dll\SrpHostingTerminate", SRPHOSTING_TYPE, Type)
}

/**
 * Protects the data in a file to an enterprise identity, so that only users who are associated with that enterprise identity can access the data. The application can then use standard APIs to read or write from the file.
 * @param {PWSTR} fileOrFolderPath The path for the file or folder that you want to protect.
 * @param {PWSTR} identity The enterprise identity for which the data is protected. This identity is an email address or domain that is managed.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/edpwin32/nf-edpwin32-protectfiletoenterpriseidentity
 * @since windows10.0.10240
 */
export ProtectFileToEnterpriseIdentity(fileOrFolderPath, identity) {
    fileOrFolderPath := fileOrFolderPath is String ? StrPtr(fileOrFolderPath) : fileOrFolderPath
    identity := identity is String ? StrPtr(identity) : identity

    result := DllCall("efswrt.dll\ProtectFileToEnterpriseIdentity", "ptr", fileOrFolderPath, "ptr", identity, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} fileOrFolderPath 
 * @param {Pointer<FILE_UNPROTECT_OPTIONS>} options 
 * @returns {HRESULT} 
 */
export UnprotectFile(fileOrFolderPath, options) {
    fileOrFolderPath := fileOrFolderPath is String ? StrPtr(fileOrFolderPath) : fileOrFolderPath

    result := DllCall("efswrt.dll\UnprotectFile", "ptr", fileOrFolderPath, FILE_UNPROTECT_OPTIONS.Ptr, options, "HRESULT")
    return result
}

;@endregion Functions

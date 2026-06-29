#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TRANSPORTPROVIDER_CALLBACK_ID.ahk" { TRANSPORTPROVIDER_CALLBACK_ID }
#Import ".\WDS_CLI_IMAGE_TYPE.ahk" { WDS_CLI_IMAGE_TYPE }
#Import ".\WDS_TRANSPORTCLIENT_REQUEST.ahk" { WDS_TRANSPORTCLIENT_REQUEST }
#Import ".\CPU_ARCHITECTURE.ahk" { CPU_ARCHITECTURE }
#Import ".\WDS_CLI_IMAGE_PARAM_TYPE.ahk" { WDS_CLI_IMAGE_PARAM_TYPE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WDS_CLI_CRED.ahk" { WDS_CLI_CRED }
#Import ".\PXE_PROVIDER.ahk" { PXE_PROVIDER }
#Import ".\PXE_ADDRESS.ahk" { PXE_ADDRESS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\TRANSPORTCLIENT_CALLBACK_ID.ahk" { TRANSPORTCLIENT_CALLBACK_ID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PXE_DHCPV6_NESTED_RELAY_MESSAGE.ahk" { PXE_DHCPV6_NESTED_RELAY_MESSAGE }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */

;@region Functions
/**
 * Closes a handle to a WDS session or image, and releases resources.
 * @param {HANDLE} _Handle A handle to a WDS session or image. This function can close handles opened with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> functions.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscliclose
 * @since windows6.0.6000
 */
export WdsCliClose(_Handle) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliClose", HANDLE, _Handle, "HRESULT")
    return result
}

/**
 * Registers a callback function that will receive debugging messages.
 * @param {Pointer<PFN_WdsCliTraceFunction>} _pfn A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nc-wdsclientapi-pfn_wdsclitracefunction">PFN_WdsCliTraceFunction</a> callback function that receives debugging messages.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscliregistertrace
 * @since windows6.0.6000
 */
export WdsCliRegisterTrace(_pfn) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliRegisterTrace", "ptr", _pfn, "HRESULT")
    return result
}

/**
 * This function can be used to free the array of string values that gets allocated by the WdsCliObtainDriverPackages function.
 * @param {Pointer<PWSTR>} ppwszArray Pointer to the array of string values being freed.
 * @param {Integer} ulCount Number of strings in the array that is pointed to by <i>ppwszArray</i>.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclifreestringarray
 * @since windows6.1
 */
export WdsCliFreeStringArray(ppwszArray, ulCount) {
    ppwszArrayMarshal := ppwszArray is VarRef ? "ptr*" : "ptr"

    result := DllCall("WDSCLIENTAPI.dll\WdsCliFreeStringArray", ppwszArrayMarshal, ppwszArray, "uint", ulCount, "HRESULT")
    return result
}

/**
 * Starts the enumeration of images stored on a WDS server and returns a find handle that references the first image.
 * @remarks
 * The session must be authenticated to use this function. To authenticate an existing session, call the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliauthorizesession">WdsCliAuthorizeSession</a> function.
 * 
 * The WDS image find handle returned by this function can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function to enumerate the images stored on the WDS server.
 * @param {HANDLE} hSession A handle to a session   with a WDS server. This was a handle returned by 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
 * @returns {HANDLE} Pointer to a <b>HANDLE</b> value that receives the find handle. If the function succeeds, the find handle will reference the first image stored on the WDS server. If the function is unsuccessful, this parameter is unchanged. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function to advance the reference of the find handle to the next image. 
 * 
 * <div class="alert"><b>Note</b>  Information about the image can only be obtained from the find handle by using the image information functions of the WDS client API.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage
 * @since windows6.0.6000
 */
export WdsCliFindFirstImage(hSession) {
    phFindHandle := HANDLE.Owned()
    result := DllCall("WDSCLIENTAPI.dll\WdsCliFindFirstImage", HANDLE, hSession, HANDLE.Ptr, phFindHandle, "HRESULT")
    return phFindHandle
}

/**
 * Advances the reference of a find handle to the next image stored on a WDS server.
 * @remarks
 * To enumerate all the images on a WDS Server, first get the WDS image find handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function, and then make repeated calls to <b>WdsCliFindNextImage</b> until the function returns <b>HRESULT_FROM_WIN32(ERROR_NO_MORE_FILES)</b>.
 * @param {HANDLE} _Handle The find handle returned by 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. If the <b>WdsCliFindNextImage</b> function is successful, the reference of the find handle is advanced to the next image stored on the WDS server.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * 
 * If the function succeeds, and the end of the enumeration has been reached, the return is  <b>HRESULT_FROM_WIN32(ERROR_NO_MORE_FILES)</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage
 * @since windows6.0.6000
 */
export WdsCliFindNextImage(_Handle) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliFindNextImage", HANDLE, _Handle, "HRESULT")
    return result
}

/**
 * Returns the image enumeration flag for the current image handle.
 * @param {HANDLE} _Handle A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {Integer} A pointer to a value that receives the enumeration flag value.
 * 
 * 
 * This parameter can have the following values
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WdsCliFlagEnumFilterVersion"></a><a id="wdscliflagenumfilterversion"></a><a id="WDSCLIFLAGENUMFILTERVERSION"></a><dl>
 * <dt><b>WdsCliFlagEnumFilterVersion</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The WDS client only shows images that have the same version as the boot image. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetenumerationflags
 * @since windows6.0.6000
 */
export WdsCliGetEnumerationFlags(_Handle) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetEnumerationFlags", HANDLE, _Handle, "uint*", &pdwFlags := 0, "HRESULT")
    return pdwFlags
}

/**
 * Returns an image handle for the current image in an image enumeration.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function to close the image handle returned by this function.
 * @param {HANDLE} FindHandle A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {HANDLE} A pointer to a location that contains an image handle for the current image referenced by the find handle.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagehandlefromfindhandle
 * @since windows6.0.6000
 */
export WdsCliGetImageHandleFromFindHandle(FindHandle) {
    phImageHandle := HANDLE.Owned()
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageHandleFromFindHandle", HANDLE, FindHandle, HANDLE.Ptr, phImageHandle, "HRESULT")
    return phImageHandle
}

/**
 * Returns an image handle from a completed transfer handle. The handle is to the local copy of the image that's been transferred from the server to the client.
 * @remarks
 * If the transfer is not yet complete when this function is called, it will return an error code.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function to close the image handle returned by this function.
 * @param {HANDLE} hTransfer A WDS transfer handle that has completed the transfer. This can be the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> functions.
 * @returns {HANDLE} A pointer to a location that contains an image handle.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagehandlefromtransferhandle
 * @since windows6.0.6000
 */
export WdsCliGetImageHandleFromTransferHandle(hTransfer) {
    phImageHandle := HANDLE.Owned()
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageHandleFromTransferHandle", HANDLE, hTransfer, HANDLE.Ptr, phImageHandle, "HRESULT")
    return phImageHandle
}

/**
 * Starts a new session with a WDS server.
 * @remarks
 * To close 
 *       the session and release resources, use the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function.
 * @param {PWSTR} pwszServer A pointer to a string value that contains the name or IP address of the WDS server.
 * @param {Pointer<WDS_CLI_CRED>} pCred A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/ns-wdsclientapi-wds_cli_cred">WDS_CLI_CRED</a> structure that contains the 
 *       client's credentials. This parameter can be null  for a session without authentication.
 * @returns {HANDLE} A pointer to a handle for the new session. This parameter is unmodified if the function is unsuccessful.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession
 * @since windows6.0.6000
 */
export WdsCliCreateSession(pwszServer, pCred) {
    pwszServer := pwszServer is String ? StrPtr(pwszServer) : pwszServer

    A_LastError := 0

    phSession := HANDLE.Owned()
    result := DllCall("WDSCLIENTAPI.dll\WdsCliCreateSession", "ptr", pwszServer, WDS_CLI_CRED.Ptr, pCred, HANDLE.Ptr, phSession, "HRESULT")
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return phSession
}

/**
 * Converts a session with a WDS server into an authenticated session.
 * @param {HANDLE} hSession A handle to a session   with a WDS server. This was a handle returned by 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
 * @param {Pointer<WDS_CLI_CRED>} pCred Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/ns-wdsclientapi-wds_cli_cred">WDS_CLI_CRED</a> structure that contains the 
 *       client's credentials.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscliauthorizesession
 * @since windows6.0.6000
 */
export WdsCliAuthorizeSession(hSession, pCred) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliAuthorizeSession", HANDLE, hSession, WDS_CLI_CRED.Ptr, pCred, "HRESULT")
    return result
}

/**
 * Initializes logging for the WDS client.
 * @param {HANDLE} hSession A handle to a session   with a WDS server. This was a handle returned by 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
 * @param {CPU_ARCHITECTURE} ulClientArchitecture A constant that identifies the processor architecture of the client.
 * @param {PWSTR} pwszClientId A pointer to a string value that contains a GUID that represents this WDS client. This is typically the GUID for the System Management BIOS (SMBIOS.)
 * @param {PWSTR} pwszClientAddress A pointer to a string value that contains the network address of the WDS client. This is typically the IP address in string form, for example, 
 *       "127.0.0.1".
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>. 
 * 
 * If logging has already been initialize for the session, the return value is 
 *       <b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscliinitializelog
 * @since windows6.0.6000
 */
export WdsCliInitializeLog(hSession, ulClientArchitecture, pwszClientId, pwszClientAddress) {
    pwszClientId := pwszClientId is String ? StrPtr(pwszClientId) : pwszClientId
    pwszClientAddress := pwszClientAddress is String ? StrPtr(pwszClientAddress) : pwszClientAddress

    result := DllCall("WDSCLIENTAPI.dll\WdsCliInitializeLog", HANDLE, hSession, CPU_ARCHITECTURE, ulClientArchitecture, "ptr", pwszClientId, "ptr", pwszClientAddress, "HRESULT")
    return result
}

/**
 * Sends a log event to the WDS server.
 * @param {HANDLE} hSession A handle to a session   with a WDS server. This was a handle returned by 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
 * @param {Integer} ulLogLevel Indicates the threshold severity required to log an event. The WDS server will log events only if the server log level is greater 
 *       than or equal to the value specified.
 * @param {Integer} ulMessageCode The type of message that is being logged.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_ERROR"></a><a id="wds_log_type_client_error"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_ERROR</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A client error message. An additional parameter of type <b>PWSTR</b> that describes the error is 
 *         required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_STARTED"></a><a id="wds_log_type_client_started"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_STARTED</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A client started message. No additional parameters are required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_FINISHED"></a><a id="wds_log_type_client_finished"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_FINISHED</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A client finished message. No additional parameters are required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED"></a><a id="wds_log_type_client_image_selected"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A client image selected message. Two additional parameters of type <b>PWSTR</b> are required. The first is the Image 
 *         Name and the second is the Group Name.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_APPLY_STARTED"></a><a id="wds_log_type_client_apply_started"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_APPLY_STARTED</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No additional parameters are required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_APPLY_FINISHED"></a><a id="wds_log_type_client_apply_finished"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_APPLY_FINISHED</b></dt>
 * <dt>6</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No additional parameters are required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE"></a><a id="wds_log_type_client_generic_message"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE</b></dt>
 * <dt>7</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A generic message. An additional parameter of type <b>PWSTR</b> that contains the message is 
 *         required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_MAX_CODE"></a><a id="wds_log_type_client_max_code"></a><dl>
 * <dt><b>WDS_LOG_TYPE_CLIENT_MAX_CODE</b></dt>
 * <dt>8</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Used to determine an out-of-range index. Values greater than or equal to 
 *         <b>WDS_LOG_TYPE_CLIENT_MAX_CODE</b> are not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclilog
 * @since windows6.0.6000
 */
export WdsCliLog(hSession, ulLogLevel, ulMessageCode, args*) {
    varArgs := [args*]
    varArgs.Push("HRESULT")

    result := DllCall("WDSCLIENTAPI.dll\WdsCliLog", HANDLE, hSession, "uint", ulLogLevel, "uint", ulMessageCode, varArgs*)
    return result
}

/**
 * Returns the name of the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a pointer to a 
 *       null-terminated string value that contains the name of the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagename
 * @since windows6.0.6000
 */
export WdsCliGetImageName(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageName", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * Returns a description of the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a pointer to a 
 *       null-terminated string value that contains a description of the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagedescription
 * @since windows6.0.6000
 */
export WdsCliGetImageDescription(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageDescription", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * 
 * @param {HANDLE} hIfh 
 * @returns {WDS_CLI_IMAGE_TYPE} 
 */
export WdsCliGetImageType(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageType", HANDLE, hIfh, "int*", &pImageType := 0, "HRESULT")
    return pImageType
}

/**
 * 
 * @param {HANDLE} hIfh 
 * @param {Pointer<Pointer<PWSTR>>} pppwszFiles 
 * @param {Pointer<Integer>} pdwCount 
 * @returns {HRESULT} 
 */
export WdsCliGetImageFiles(hIfh, pppwszFiles, pdwCount) {
    pppwszFilesMarshal := pppwszFiles is VarRef ? "ptr*" : "ptr"
    pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageFiles", HANDLE, hIfh, pppwszFilesMarshal, pppwszFiles, pdwCountMarshal, pdwCount, "HRESULT")
    return result
}

/**
 * Returns the default language of the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a pointer to a 
 *       null-terminated string value that contains the default language for the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagelanguage
 * @since windows6.0.6000
 */
export WdsCliGetImageLanguage(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageLanguage", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * Returns an array of languages supported by the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @param {Pointer<Pointer<Pointer<Integer>>>} pppszValues A pointer to a pointer to an array of null-terminated string values. Each element in the 
 *       array contains a language of the current 
 *       image.
 * @param {Pointer<Integer>} pdwNumValues Pointer to a value that contains the number of languages in the <i>pppszValues</i> parameter.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagelanguages
 * @since windows6.0.6000
 */
export WdsCliGetImageLanguages(hIfh, pppszValues, pdwNumValues) {
    pppszValuesMarshal := pppszValues is VarRef ? "ptr*" : "ptr"
    pdwNumValuesMarshal := pdwNumValues is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageLanguages", HANDLE, hIfh, pppszValuesMarshal, pppszValues, pdwNumValuesMarshal, pdwNumValues, "HRESULT")
    return result
}

/**
 * Returns the version of the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a pointer to a null-terminated string value that contains the version of the current version.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimageversion
 * @since windows6.0.6000
 */
export WdsCliGetImageVersion(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageVersion", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * Returns the path to the file that contains the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * 
 * To obtain the full path to the 
 *       image file, prefix the relative path returned in <i>ppWszValue</i> with "&#92;&#92;<i>Server</i>\\RemInst\".
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a pointer to a null-terminated string that contains the relative path of the image file for the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagepath
 * @since windows6.0.6000
 */
export WdsCliGetImagePath(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImagePath", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * Returns the index within the Windows Imaging Format(WIM) file for the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {Integer} A pointer to a 
 *       value that contains the image index for the current image WIM file.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimageindex
 * @since windows6.0.6000
 */
export WdsCliGetImageIndex(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageIndex", HANDLE, hIfh, "uint*", &pdwValue := 0, "HRESULT")
    return pdwValue
}

/**
 * Returns the processor architecture for the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {CPU_ARCHITECTURE} Pointer to a value that describes the processor architecture of the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagearchitecture
 * @since windows6.0.6000
 */
export WdsCliGetImageArchitecture(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageArchitecture", HANDLE, hIfh, "uint*", &pdwValue := 0, "HRESULT")
    return pdwValue
}

/**
 * Returns the last-modification time of the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {Pointer<SYSTEMTIME>} A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the last-modified time of the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagelastmodifiedtime
 * @since windows6.0.6000
 */
export WdsCliGetImageLastModifiedTime(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageLastModifiedTime", HANDLE, hIfh, "ptr*", &ppSysTimeValue := 0, "HRESULT")
    return ppSysTimeValue
}

/**
 * Returns the size of the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {Integer} A pointer to a value that contains the size of the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagesize
 * @since windows6.0.6000
 */
export WdsCliGetImageSize(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageSize", HANDLE, hIfh, "uint*", &pullValue := 0, "HRESULT")
    return pullValue
}

/**
 * Returns the Hardware Abstraction Layer (HAL) name for the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a pointer to  a 
 *       null-terminated string value that contains the HAL name for the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagehalname
 * @since windows6.0.6000
 */
export WdsCliGetImageHalName(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageHalName", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * Returns the name of the image group for the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a 
 *       null-terminated string value that contains the name of the image group for the current image.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagegroup
 * @since windows6.0.6000
 */
export WdsCliGetImageGroup(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageGroup", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * Returns the namespace of the current image.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {PWSTR} A pointer to a pointer to a 
 *       null-terminated string value that contains the namespace of the current image. If there is no namespace associated with this image, this returns null or an empty string.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetimagenamespace
 * @since windows6.0.6000
 */
export WdsCliGetImageNamespace(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageNamespace", HANDLE, hIfh, PWSTR.Ptr, &ppwszValue := 0, "HRESULT")
    return ppwszValue
}

/**
 * 
 * @param {HANDLE} hIfh 
 * @param {WDS_CLI_IMAGE_PARAM_TYPE} ParamType 
 * @param {Integer} pResponse 
 * @param {Integer} uResponseLen 
 * @returns {HRESULT} 
 */
export WdsCliGetImageParameter(hIfh, ParamType, pResponse, uResponseLen) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageParameter", HANDLE, hIfh, WDS_CLI_IMAGE_PARAM_TYPE, ParamType, "ptr", pResponse, "uint", uResponseLen, "HRESULT")
    return result
}

/**
 * Returns the size of the current file transfer.
 * @remarks
 * This value 
 *       is valid until the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function is used to change or close the 
 *       current handle.
 * @param {HANDLE} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
 * @returns {Integer} A pointer to a value that contains the size of the current transfer.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligettransfersize
 * @since windows6.0.6000
 */
export WdsCliGetTransferSize(hIfh) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetTransferSize", HANDLE, hIfh, "uint*", &pullValue := 0, "HRESULT")
    return pullValue
}

/**
 * 
 * @param {Integer} ulSizeInBytes 
 * @returns {String} Nothing - always returns an empty string
 */
export WdsCliSetTransferBufferSize(ulSizeInBytes) {
    DllCall("WDSCLIENTAPI.dll\WdsCliSetTransferBufferSize", "uint", ulSizeInBytes)
}

/**
 * Transfers an image from a WDS server to the WDS client.
 * @remarks
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function to close the handle returned by this function.
 * @param {HANDLE} hImage A WDS image handle that refers to a remote image.
 * @param {PWSTR} pwszLocalPath A pointer to a null-terminated string value that contains the full path to the local location to store the image file being transferred.
 * @param {Integer} dwFlags Options associated with the file transfer.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_CLI_TRANSFER_ASYNCHRONOUS"></a><a id="wds_cli_transfer_asynchronous"></a><dl>
 * <dt><b>WDS_CLI_TRANSFER_ASYNCHRONOUS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This flag specifies an asynchronous transfer.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} dwReserved This parameter is reserved.
 * @param {Pointer<PFN_WdsCliCallback>} pfnWdsCliCallback A pointer to an optional callback function that will receive callbacks for this transfer.
 * @param {Pointer<Void>} pvUserData A pointer to optional user information that can be passed to the callback function.
 * @returns {HANDLE} A pointer to a transfer handle that can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer">WdsCliWaitForTransfer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer">WdsCliCancelTransfer</a> functions to wait for the transfer to complete or to cancel the transfer.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage
 * @since windows6.0.6000
 */
export WdsCliTransferImage(hImage, pwszLocalPath, dwFlags, dwReserved, pfnWdsCliCallback, pvUserData) {
    pwszLocalPath := pwszLocalPath is String ? StrPtr(pwszLocalPath) : pwszLocalPath

    pvUserDataMarshal := pvUserData is VarRef ? "ptr" : "ptr"

    phTransfer := HANDLE.Owned()
    result := DllCall("WDSCLIENTAPI.dll\WdsCliTransferImage", HANDLE, hImage, "ptr", pwszLocalPath, "uint", dwFlags, "uint", dwReserved, "ptr", pfnWdsCliCallback, pvUserDataMarshal, pvUserData, HANDLE.Ptr, phTransfer, "HRESULT")
    return phTransfer
}

/**
 * Transfers a file from a WDS server to the WDS client using a multicast transfer protocol.
 * @remarks
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliclose">WdsCliClose</a> function to close the handle returned by this function.
 * @param {PWSTR} pwszServer A pointer to a null-terminated string value that contains the  WDS server name.
 * @param {PWSTR} pwszNamespace A pointer to a null-terminated string value that contains the multicast namespace name for the image.
 * @param {PWSTR} pwszRemoteFilePath A pointer to a null-terminated string value that contains the  full path for the remote location from which to copy the file being transferred.
 * @param {PWSTR} pwszLocalFilePath A pointer to a null-terminated string value that contains the full path to the local location to store the file being transferred.
 * @param {Integer} dwFlags Options associated with the file transfer. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDS_CLI_TRANSFER_ASYNCHRONOUS"></a><a id="wds_cli_transfer_asynchronous"></a><dl>
 * <dt><b>WDS_CLI_TRANSFER_ASYNCHRONOUS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This flag specifies an asynchronous transfer.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} dwReserved This parameter is reserved.
 * @param {Pointer<PFN_WdsCliCallback>} pfnWdsCliCallback A pointer to an optional callback function for this transfer.
 * @param {Pointer<Void>} pvUserData A pointer to optional user information that can be passed to the callback function.
 * @returns {HANDLE} A pointer to a transfer handle that can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer">WdsCliWaitForTransfer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer">WdsCliCancelTransfer</a> functions to wait for the transfer to complete or to cancel the transfer.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile
 * @since windows6.0.6000
 */
export WdsCliTransferFile(pwszServer, pwszNamespace, pwszRemoteFilePath, pwszLocalFilePath, dwFlags, dwReserved, pfnWdsCliCallback, pvUserData) {
    pwszServer := pwszServer is String ? StrPtr(pwszServer) : pwszServer
    pwszNamespace := pwszNamespace is String ? StrPtr(pwszNamespace) : pwszNamespace
    pwszRemoteFilePath := pwszRemoteFilePath is String ? StrPtr(pwszRemoteFilePath) : pwszRemoteFilePath
    pwszLocalFilePath := pwszLocalFilePath is String ? StrPtr(pwszLocalFilePath) : pwszLocalFilePath

    pvUserDataMarshal := pvUserData is VarRef ? "ptr" : "ptr"

    phTransfer := HANDLE.Owned()
    result := DllCall("WDSCLIENTAPI.dll\WdsCliTransferFile", "ptr", pwszServer, "ptr", pwszNamespace, "ptr", pwszRemoteFilePath, "ptr", pwszLocalFilePath, "uint", dwFlags, "uint", dwReserved, "ptr", pfnWdsCliCallback, pvUserDataMarshal, pvUserData, HANDLE.Ptr, phTransfer, "HRESULT")
    return phTransfer
}

/**
 * Cancels a WDS transfer operation.
 * @remarks
 * This function can be called from a callback function.
 * @param {HANDLE} hTransfer A handle for the WDS transfer operation being canceled. This can be the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> functions.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer
 * @since windows6.0.6000
 */
export WdsCliCancelTransfer(hTransfer) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliCancelTransfer", HANDLE, hTransfer, "HRESULT")
    return result
}

/**
 * Waits for an image or file transfer to complete.
 * @remarks
 * Calling this function from a callback function is not recommended.
 * @param {HANDLE} hTransfer A WDS transfer handle for the transfer being canceled. This can be the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> functions.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer
 * @since windows6.0.6000
 */
export WdsCliWaitForTransfer(hTransfer) {
    result := DllCall("WDSCLIENTAPI.dll\WdsCliWaitForTransfer", HANDLE, hTransfer, "HRESULT")
    return result
}

/**
 * This function obtains from a WDS image, the driver packages (INF files) that can be used on this computer.
 * @param {HANDLE} hImage A handle to a WDS image.
 * @param {Pointer<PWSTR>} ppwszServerName A pointer to a pointer to a string value that receives the IP address of the server hosting the driver packages.
 * @param {Pointer<Pointer<PWSTR>>} pppwszDriverPackages An array of string values that are the full paths for the driver packages (INF files.) The Internet Protocol (IP) address, rather than a computer name, is returned as part of the path.  For example, a string value <b>\\172.31.224.245\REMINST\Stores\Drivers\driver.inf</b> in the array gives the full path to driver.inf.
 * 
 * <div class="code"></div>
 * @param {Pointer<Integer>} pulCount The number of driver packages returned by <i>pppwszDriverPackages</i>.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscliobtaindriverpackages
 * @since windows6.1
 */
export WdsCliObtainDriverPackages(hImage, ppwszServerName, pppwszDriverPackages, pulCount) {
    ppwszServerNameMarshal := ppwszServerName is VarRef ? "ptr*" : "ptr"
    pppwszDriverPackagesMarshal := pppwszDriverPackages is VarRef ? "ptr*" : "ptr"
    pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSCLIENTAPI.dll\WdsCliObtainDriverPackages", HANDLE, hImage, ppwszServerNameMarshal, ppwszServerName, pppwszDriverPackagesMarshal, pppwszDriverPackages, pulCountMarshal, pulCount, "HRESULT")
    return result
}

/**
 * This function obtains the driver packages (INF files) that are applicable to the specified WDS driver query XML.
 * @param {HANDLE} hSession A handle to a session with the WDS server. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
 * @param {PWSTR} pwszMachineInfo A pointer to a string containing WDS driver query XML which can be generated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscligetdriverqueryxml">WdsCliGetDriverQueryXml</a> function.
 * @param {Pointer<PWSTR>} ppwszServerName A pointer to a pointer to a string value that receives the IP address of the server hosting the driver packages.
 * @param {Pointer<Pointer<PWSTR>>} pppwszDriverPackages An array of string values that are the full paths for the driver packages (INF files.) The Internet Protocol (IP) address, rather than a computer name, is returned as part of the path.  For example, a string value <b>\\172.31.224.245\REMINST\Stores\Drivers\driver.inf</b> in the array gives the full path to driver.inf.
 * @param {Pointer<Integer>} pulCount The number of driver packages returned by pppwszDriverPackages.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscliobtaindriverpackagesex
 * @since windows8.0
 */
export WdsCliObtainDriverPackagesEx(hSession, pwszMachineInfo, ppwszServerName, pppwszDriverPackages, pulCount) {
    pwszMachineInfo := pwszMachineInfo is String ? StrPtr(pwszMachineInfo) : pwszMachineInfo

    ppwszServerNameMarshal := ppwszServerName is VarRef ? "ptr*" : "ptr"
    pppwszDriverPackagesMarshal := pppwszDriverPackages is VarRef ? "ptr*" : "ptr"
    pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSCLIENTAPI.dll\WdsCliObtainDriverPackagesEx", HANDLE, hSession, "ptr", pwszMachineInfo, ppwszServerNameMarshal, ppwszServerName, pppwszDriverPackagesMarshal, pppwszDriverPackages, pulCountMarshal, pulCount, "HRESULT")
    return result
}

/**
 * This function generates an XML string which can be used to query a WDS server for driver packages using the WdsCliObtainDriverPackagesEx function.
 * @param {PWSTR} pwszWinDirPath The path to the Windows directory of the applied image. This parameter is optional. If it is specified,  the section of the WDS driver query XML  for the target operating system is generated.
 * @returns {PWSTR} A pointer to a pointer to a string that receives the generated WDS driver query XML. The caller has to free this buffer using "delete\[\]\(\*ppwszDriverQuery\)".
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nf-wdsclientapi-wdscligetdriverqueryxml
 * @since windows8.0
 */
export WdsCliGetDriverQueryXml(pwszWinDirPath) {
    pwszWinDirPath := pwszWinDirPath is String ? StrPtr(pwszWinDirPath) : pwszWinDirPath

    result := DllCall("WDSCLIENTAPI.dll\WdsCliGetDriverQueryXml", "ptr", pwszWinDirPath, PWSTR.Ptr, &ppwszDriverQuery := 0, "HRESULT")
    return ppwszDriverQuery
}

/**
 * Registers a provider with the system.
 * @param {PWSTR} pszProviderName Address of a null terminated string that specifies the display name of the provider. This name is 
 *       displayed to the user and must be unique among registered providers.
 * @param {PWSTR} pszModulePath Address of a null-terminated string that specifies the full path to the provider DLL.
 * @param {Integer} Index Index into the list of providers. Any existing providers are shifted down if necessary. The administrator 
 *       can rearrange the providers as needed, so no assumptions should be made about the order of providers.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_REG_INDEX_TOP"></a><a id="pxe_reg_index_top"></a><dl>
 * <dt><b>PXE_REG_INDEX_TOP</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Add the provider to the top of the list to be the first to receive client requests.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_REG_INDEX_BOTTOM"></a><a id="pxe_reg_index_bottom"></a><dl>
 * <dt><b>PXE_REG_INDEX_BOTTOM</b></dt>
 * <dt>0xFFFFFFFF</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Add the provider to the bottom of the list.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {BOOL} bIsCritical Indicates whether the provider is critical. If a critical provider fails, the WDS server will also 
 *       fail.
 * @param {Pointer<HKEY>} phProviderKey Address of a <b>HKEY</b> where the configuration should be stored. The provider will 
 *       receive a handle to this same key as the <i>hProviderKey</i> parameter to its 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> callback.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeproviderregister
 * @since windowsserver2008
 */
export PxeProviderRegister(pszProviderName, pszModulePath, Index, bIsCritical, phProviderKey) {
    pszProviderName := pszProviderName is String ? StrPtr(pszProviderName) : pszProviderName
    pszModulePath := pszModulePath is String ? StrPtr(pszModulePath) : pszModulePath

    result := DllCall("WDSPXE.dll\PxeProviderRegister", "ptr", pszProviderName, "ptr", pszModulePath, "uint", Index, BOOL, bIsCritical, HKEY.Ptr, phProviderKey, UInt32)
    return result
}

/**
 * Removes a provider from the list of registered providers.
 * @param {PWSTR} pszProviderName Display name for provider from the call to the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderregister">PxeProviderRegister</a> function.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeproviderunregister
 * @since windowsserver2008
 */
export PxeProviderUnRegister(pszProviderName) {
    pszProviderName := pszProviderName is String ? StrPtr(pszProviderName) : pszProviderName

    result := DllCall("WDSPXE.dll\PxeProviderUnRegister", "ptr", pszProviderName, UInt32)
    return result
}

/**
 * Returns the index of the specified provider in the list of registered providers.
 * @remarks
 * If a provider wants to insert itself in the list of registered providers in a specific order (that is, wants to 
 *     service client requests before or after a certain provider), it can query the index of another provider and then use 
 *     the returned index to decide its own location.
 * @param {PWSTR} pszProviderName Friendly name for the provider from the call to the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderregister">PxeProviderRegister</a> function.
 * @param {Pointer<Integer>} puIndex Address of a <b>ULONG</b> that will receive the index of the provider.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeproviderqueryindex
 * @since windowsserver2008
 */
export PxeProviderQueryIndex(pszProviderName, puIndex) {
    pszProviderName := pszProviderName is String ? StrPtr(pszProviderName) : pszProviderName

    puIndexMarshal := puIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeProviderQueryIndex", "ptr", pszProviderName, puIndexMarshal, puIndex, UInt32)
    return result
}

/**
 * Starts an enumeration of registered providers.
 * @param {Pointer<HANDLE>} phEnum Address of a <b>HANDLE</b> that on successful return can be used with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumnext">PxeProviderEnumNext</a> function to enumerate 
 *       providers. When the enumeration handle is no longer needed, use the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumclose">PxeProviderEnumClose</a> function to close the 
 *       enumeration.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeproviderenumfirst
 * @since windowsserver2008
 */
export PxeProviderEnumFirst(phEnum) {
    result := DllCall("WDSPXE.dll\PxeProviderEnumFirst", HANDLE.Ptr, phEnum, UInt32)
    return result
}

/**
 * Enumerates registered providers.
 * @param {HANDLE} hEnum <b>HANDLE</b> returned by the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumfirst">PxeProviderEnumFirst</a> function.
 * @param {Pointer<Pointer<PXE_PROVIDER>>} ppProvider Address of a <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_provider">PXE_PROVIDER</a> structure with the 
 *       <b>uSizeOfStruct</b> member filled in with the size of the structure. On return this 
 *       structure is filled in with provider information. This structure can be freed with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderfreeinfo">PxeProviderFreeInfo</a> function.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeproviderenumnext
 * @since windowsserver2008
 */
export PxeProviderEnumNext(hEnum, ppProvider) {
    ppProviderMarshal := ppProvider is VarRef ? "ptr*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeProviderEnumNext", HANDLE, hEnum, ppProviderMarshal, ppProvider, UInt32)
    return result
}

/**
 * Closes the enumeration of providers opened by the PxeProviderEnumFirst function.
 * @param {HANDLE} hEnum <b>HANDLE</b> returned by the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumfirst">PxeProviderEnumFirst</a> function.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeproviderenumclose
 * @since windowsserver2008
 */
export PxeProviderEnumClose(hEnum) {
    result := DllCall("WDSPXE.dll\PxeProviderEnumClose", HANDLE, hEnum, UInt32)
    return result
}

/**
 * Frees memory allocated by the PxeProviderEnumNext function.
 * @param {Pointer<PXE_PROVIDER>} pProvider Address of a <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_provider">PXE_PROVIDER</a> structure returned from the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumnext">PxeProviderEnumNext</a> function.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeproviderfreeinfo
 * @since windowsserver2008
 */
export PxeProviderFreeInfo(pProvider) {
    result := DllCall("WDSPXE.dll\PxeProviderFreeInfo", PXE_PROVIDER.Ptr, pProvider, UInt32)
    return result
}

/**
 * Registers callback functions for different notification events.
 * @param {HANDLE} _hProvider <b>HANDLE</b> passed to the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
 * @param {Integer} CallbackType Specifies the callback that is being registered.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_CALLBACK_RECV_REQUEST"></a><a id="pxe_callback_recv_request"></a><dl>
 * <dt><b>PXE_CALLBACK_RECV_REQUEST</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Register the <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> 
 *         callback. This callback must be registered while the provider is processing the 
 *         <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function or the 
 *         provider will be shut down.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_CALLBACK_SHUTDOWN"></a><a id="pxe_callback_shutdown"></a><dl>
 * <dt><b>PXE_CALLBACK_SHUTDOWN</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Register the <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeprovidershutdown">PxeProviderShutdown</a> 
 *         callback. This callback must be registered while the provider is processing the 
 *         <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function or the 
 *         provider will be shut down.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_CALLBACK_SERVICE_CONTROL"></a><a id="pxe_callback_service_control"></a><dl>
 * <dt><b>PXE_CALLBACK_SERVICE_CONTROL</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Register the 
 *         <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderservicecontrol">PxeProviderServiceControl</a> callback.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_CALLBACK_MAX"></a><a id="pxe_callback_max"></a><dl>
 * <dt><b>PXE_CALLBACK_MAX</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Used to determine an out-of-range index. Values greater than or equal to 
 *         <b>PXE_CALLBACK_MAX</b> are not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} pCallbackFunction Address of the callback function. The function signature varies depending on the 
 *       <i>CallbackType</i> parameter.
 * @param {Pointer<Void>} pContext Context value to be passed to the callback function.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeregistercallback
 * @since windowsserver2008
 */
export PxeRegisterCallback(_hProvider, CallbackType, pCallbackFunction, pContext) {
    pCallbackFunctionMarshal := pCallbackFunction is VarRef ? "ptr" : "ptr"
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSPXE.dll\PxeRegisterCallback", HANDLE, _hProvider, "uint", CallbackType, pCallbackFunctionMarshal, pCallbackFunction, pContextMarshal, pContext, UInt32)
    return result
}

/**
 * Sends a packet to a client request.
 * @param {HANDLE} hClientRequest Handle to the client request received in the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
 * @param {Integer} pPacket Pointer to packet allocated by the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pPacket</i> parameter.
 * @param {Pointer<PXE_ADDRESS>} pAddress Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_address">PXE_ADDRESS</a> structure that contains the 
 *       destination address of the packet. If the <i>pAddress</i> parameter is 
 *       <b>NULL</b>, then the packet is sent to the source address of the client request.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxesendreply
 * @since windowsserver2008
 */
export PxeSendReply(hClientRequest, pPacket, uPacketLen, pAddress) {
    result := DllCall("WDSPXE.dll\PxeSendReply", HANDLE, hClientRequest, "ptr", pPacket, "uint", uPacketLen, PXE_ADDRESS.Ptr, pAddress, UInt32)
    return result
}

/**
 * Passes the results of processing the client request asynchronously. This function should be called only if the PxeProviderRecvRequest function returns ERROR_IO_PENDING.
 * @param {HANDLE} hClientRequest Handle to the request received from the client.
 * @param {Integer} Action Specifies the action that the system should take for this client request. The following table lists the 
 *       possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_BA_NBP"></a><a id="pxe_ba_nbp"></a><dl>
 * <dt><b>PXE_BA_NBP</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider replied to the client with a standard DHCP response packet that contains the path to the 
 *         Network Boot Program. Returning this action means that the provider successfully completed the client request 
 *         by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxesendreply">PxeSendReply</a> function at least 
 *         once.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_BA_CUSTOM"></a><a id="pxe_ba_custom"></a><dl>
 * <dt><b>PXE_BA_CUSTOM</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider replied to the client by using a custom response that does not conform to DHCP 
 *         specifications. Returning this action means that the provider successfully completed the client request by 
 *         calling the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxesendreply">PxeSendReply</a> function at least once.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_BA_IGNORE"></a><a id="pxe_ba_ignore"></a><dl>
 * <dt><b>PXE_BA_IGNORE</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider does not want to service the client request and the request should not be passed to the next 
 *         provider. All resources associated with the client request are released and the client request is ignored. 
 *         Providers can also use this value if they recognize the client but the request was malformed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_BA_REJECTED"></a><a id="pxe_ba_rejected"></a><dl>
 * <dt><b>PXE_BA_REJECTED</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider does not want to service the client request. The system passes the request to the next 
 *         provider in the list of registered providers. If this was the last provider in the list, then all resources 
 *         associated with the client request are released and client request is ignored.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeasyncrecvdone
 * @since windowsserver2008
 */
export PxeAsyncRecvDone(hClientRequest, Action) {
    result := DllCall("WDSPXE.dll\PxeAsyncRecvDone", HANDLE, hClientRequest, "uint", Action, UInt32)
    return result
}

/**
 * Adds a trace entry to the PXE log.
 * @param {HANDLE} _hProvider <b>HANDLE</b> passed to the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
 * @param {Integer} Severity Severity of trace entry.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_TRACE_VERBOSE"></a><a id="pxe_trace_verbose"></a><dl>
 * <dt><b>PXE_TRACE_VERBOSE</b></dt>
 * <dt>0x00010000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trace entry is verbose and would primarily be useful when debugging.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_TRACE_INFO"></a><a id="pxe_trace_info"></a><dl>
 * <dt><b>PXE_TRACE_INFO</b></dt>
 * <dt>0x00020000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trace entry is informational, but does not indicate a warning condition.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_TRACE_WARNING"></a><a id="pxe_trace_warning"></a><dl>
 * <dt><b>PXE_TRACE_WARNING</b></dt>
 * <dt>0x00040000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trace message indicates a warning.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_TRACE_ERROR"></a><a id="pxe_trace_error"></a><dl>
 * <dt><b>PXE_TRACE_ERROR</b></dt>
 * <dt>0x00080000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trace message indicates an error condition.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_TRACE_FATAL"></a><a id="pxe_trace_fatal"></a><dl>
 * <dt><b>PXE_TRACE_FATAL</b></dt>
 * <dt>0x00100000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trace message indicates a fatal error condition.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PWSTR} pszFormat Address of a buffer that contains a printf-style format string.
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxetrace
 * @since windowsserver2008
 */
export PxeTrace(_hProvider, Severity, pszFormat, args*) {
    pszFormat := pszFormat is String ? StrPtr(pszFormat) : pszFormat

    varArgs := [args*]
    varArgs.Push(UInt32)

    result := DllCall("WDSPXE.dll\PxeTrace", HANDLE, _hProvider, "uint", Severity, "ptr", pszFormat, varArgs*)
    return result
}

/**
 * 
 * @param {HANDLE} _hProvider 
 * @param {Integer} Severity 
 * @param {PWSTR} pszFormat 
 * @param {Pointer<Integer>} Params 
 * @returns {Integer} 
 */
export PxeTraceV(_hProvider, Severity, pszFormat, Params) {
    pszFormat := pszFormat is String ? StrPtr(pszFormat) : pszFormat

    ParamsMarshal := Params is VarRef ? "char*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeTraceV", HANDLE, _hProvider, "uint", Severity, "ptr", pszFormat, ParamsMarshal, Params, UInt32)
    return result
}

/**
 * Allocates a packet to be sent with the PxeSendReply function.
 * @param {HANDLE} _hProvider <b>HANDLE</b> passed to the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
 * @param {HANDLE} hClientRequest Handle to the client request received in the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
 * @param {Integer} uSize Size of the buffer to be allocated.
 * @returns {Pointer<Void>} Address of allocated buffer, or <b>NULL</b> if the allocation failed. For extended error 
 *       information, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxepacketallocate
 * @since windowsserver2008
 */
export PxePacketAllocate(_hProvider, hClientRequest, uSize) {
    A_LastError := 0

    result := DllCall("WDSPXE.dll\PxePacketAllocate", HANDLE, _hProvider, HANDLE, hClientRequest, "uint", uSize, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Frees a packet allocated by the PxePacketAllocate function.
 * @param {HANDLE} _hProvider <b>HANDLE</b> passed to the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
 * @param {HANDLE} hClientRequest Handle to the client request received in the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
 * @param {Pointer<Void>} pPacket Pointer to packet allocated by the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxepacketfree
 * @since windowsserver2008
 */
export PxePacketFree(_hProvider, hClientRequest, pPacket) {
    pPacketMarshal := pPacket is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSPXE.dll\PxePacketFree", HANDLE, _hProvider, HANDLE, hClientRequest, pPacketMarshal, pPacket, UInt32)
    return result
}

/**
 * Specifies attributes for the provider.
 * @param {HANDLE} _hProvider <b>HANDLE</b> passed to 
 *       the <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
 * @param {Integer} Attribute Identifies the attribute to set.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_PROV_ATTR_FILTER"></a><a id="pxe_prov_attr_filter"></a><dl>
 * <dt><b>PXE_PROV_ATTR_FILTER</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pParameterBuffer</i> parameter points to a <b>ULONG</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_PROV_ATTR_FILTER_IPV6"></a><a id="pxe_prov_attr_filter_ipv6"></a><dl>
 * <dt><b>PXE_PROV_ATTR_FILTER_IPV6</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pParameterBuffer</i> parameter points to a <b>ULONG</b>. Use this attribute with DHCPv6 packets. Available beginning with Windows 8 and Windows Server 2012.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_PROV_ATTR_IPV6_CAPABLE"></a><a id="pxe_prov_attr_ipv6_capable"></a><dl>
 * <dt><b>PXE_PROV_ATTR_IPV6_CAPABLE</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Pointer to a <b>BOOL</b> value that is TRUE to indicate the provider is capable of processing IPv6 packets.  By default, the server assumes a provider is not capable of processing IPv6 packets and will not deliver them. Available beginning with Windows 8 and Windows Server 2012.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} pParameterBuffer Pointer to a buffer. The size and contents of this buffer vary depending on the value of the 
 *       <i>Attribute</i> parameter.
 * @param {Integer} uParamLen The size of the buffer pointed to by the <i>pParameterBuffer</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxeprovidersetattribute
 * @since windowsserver2008
 */
export PxeProviderSetAttribute(_hProvider, Attribute, pParameterBuffer, uParamLen) {
    result := DllCall("WDSPXE.dll\PxeProviderSetAttribute", HANDLE, _hProvider, "uint", Attribute, "ptr", pParameterBuffer, "uint", uParamLen, UInt32)
    return result
}

/**
 * Initializes a response packet as a DHCP reply packet.
 * @remarks
 * Providers use this function to initialize a reply packet based on the packet received from the client. The 
 *     reply packet is initialized as follows.
 * 
 * <table>
 * <tr>
 * <th>DHCP field</th>
 * <th>Initialized value</th>
 * </tr>
 * <tr>
 * <td>Operation (op)</td>
 * <td>2 (BOOTP Reply)</td>
 * </tr>
 * <tr>
 * <td>Hardware Address Type (htype)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Hardware Address Length (hlen)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Hardware Address (chaddr)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Transaction ID (xid)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Seconds Since Boot (secs)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Client IP Address (ciaddr)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Your IP Address (yiaddr)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Server IP Address (siaddr)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Relay Agent IP Address (giaddr)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * <tr>
 * <td>Magic Cookie (first 4 octets of vend)</td>
 * <td>Copied from <i>pRecvPacket</i></td>
 * </tr>
 * </table>
 *  
 * 
 * All other fields are initialized to zero.
 * @param {Integer} pRecvPacket Address of a valid DHCP packet received from the client in the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
 * @param {Integer} uRecvPacketLen Length of the packet pointed to by the <i>pRecvPacket</i> parameter.
 * @param {Integer} pReplyPacket Pointer to a reply packet allocated with 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uMaxReplyPacketLen Allocated length of the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Pointer<Integer>} puReplyPacketLen Address of a <b>ULONG</b> that on successful completion will receive the length of 
 *       the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpinitialize
 * @since windowsserver2008
 */
export PxeDhcpInitialize(pRecvPacket, uRecvPacketLen, pReplyPacket, uMaxReplyPacketLen, puReplyPacketLen) {
    puReplyPacketLenMarshal := puReplyPacketLen is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpInitialize", "ptr", pRecvPacket, "uint", uRecvPacketLen, "ptr", pReplyPacket, "uint", uMaxReplyPacketLen, puReplyPacketLenMarshal, puReplyPacketLen, UInt32)
    return result
}

/**
 * Initializes a response packet as a DHCPv6 reply packet.
 * @param {Integer} pRequest Address of a valid DHCPv6 packet received from the client in the 
 *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
 * @param {Integer} cbRequest Length of the packet pointed to by the <i>pRequest</i> parameter.
 * @param {Integer} pReply Pointer to a reply packet allocated with 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} cbReply Allocated length of the packet pointed to by the <i>pReply</i> parameter.
 * @param {Pointer<Integer>} pcbReplyUsed Address of a <b>ULONG</b> that on successful completion will receive the length of 
 *       the packet pointed to by the <i>pReply</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6initialize
 * @since windows8.0
 */
export PxeDhcpv6Initialize(pRequest, cbRequest, pReply, cbReply, pcbReplyUsed) {
    pcbReplyUsedMarshal := pcbReplyUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6Initialize", "ptr", pRequest, "uint", cbRequest, "ptr", pReply, "uint", cbReply, pcbReplyUsedMarshal, pcbReplyUsed, UInt32)
    return result
}

/**
 * Appends a DHCP option to the reply packet. (PxeDhcpAppendOption)
 * @param {Integer} pReplyPacket Pointer to a reply packet allocated with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uMaxReplyPacketLen Allocated length of the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Pointer<Integer>} puReplyPacketLen Address of a <b>ULONG</b> that on successful completion will receive the length of 
 *       the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Integer} bOption DHCP option to add to the packet.
 * @param {Integer} bOptionLen Length of the option value pointed to by the <i>pValue</i> parameter. This parameter is 
 *       ignored if the <i>bOption</i> parameter is End Option (0xFF) or Pad Option (0x00).
 * @param {Integer} pValue Address of the buffer that contains the DHCP option value. This parameter is ignored if the 
 *       <i>bOption</i> parameter is End Option (0xFF) or Pad Option (0x00).
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpappendoption
 * @since windowsserver2008
 */
export PxeDhcpAppendOption(pReplyPacket, uMaxReplyPacketLen, puReplyPacketLen, bOption, bOptionLen, pValue) {
    puReplyPacketLenMarshal := puReplyPacketLen is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpAppendOption", "ptr", pReplyPacket, "uint", uMaxReplyPacketLen, puReplyPacketLenMarshal, puReplyPacketLen, "char", bOption, "char", bOptionLen, "ptr", pValue, UInt32)
    return result
}

/**
 * Appends a DHCPv6 option to the reply packet. (PxeDhcpv6AppendOption)
 * @param {Integer} pReply Pointer to a reply packet allocated with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} cbReply The total size in bytes allocated for the buffer that is pointed to by <i>pReply</i>.
 * @param {Pointer<Integer>} pcbReplyUsed On entry, this is the number of bytes of the buffer pointed to by <i>pReply</i> that are currently used.  On success of the function, this is updated to the number of bytes used after appending the option.
 * @param {Integer} wOptionType DHCPv6 option to add to the packet.
 * @param {Integer} cbOption Length of the option value pointed to by the <i>pOption</i> parameter.
 * @param {Integer} pOption Address of the buffer that contains the DHCPv6 option value.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6appendoption
 * @since windows8.0
 */
export PxeDhcpv6AppendOption(pReply, cbReply, pcbReplyUsed, wOptionType, cbOption, pOption) {
    pcbReplyUsedMarshal := pcbReplyUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6AppendOption", "ptr", pReply, "uint", cbReply, pcbReplyUsedMarshal, pcbReplyUsed, "ushort", wOptionType, "ushort", cbOption, "ptr", pOption, UInt32)
    return result
}

/**
 * Appends a DHCP option to the reply packet. (PxeDhcpAppendOptionRaw)
 * @param {Integer} pReplyPacket Pointer to a reply packet allocated with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uMaxReplyPacketLen Allocated length of the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Pointer<Integer>} puReplyPacketLen Address of a <b>ULONG</b> that on successful completion will receive the length of 
 *       the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Integer} uBufferLen Length of the option value pointed to by the <i>pBuffer</i> parameter.
 * @param {Integer} pBuffer Address of the buffer that contains the DHCP option value.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpappendoptionraw
 * @since windowsserver2008
 */
export PxeDhcpAppendOptionRaw(pReplyPacket, uMaxReplyPacketLen, puReplyPacketLen, uBufferLen, pBuffer) {
    puReplyPacketLenMarshal := puReplyPacketLen is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpAppendOptionRaw", "ptr", pReplyPacket, "uint", uMaxReplyPacketLen, puReplyPacketLenMarshal, puReplyPacketLen, "ushort", uBufferLen, "ptr", pBuffer, UInt32)
    return result
}

/**
 * Appends a DHCPv6 option to the reply packet. (PxeDhcpv6AppendOptionRaw)
 * @param {Integer} pReply Pointer to a reply packet allocated with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} cbReply Allocated length of the packet pointed to by the <i>pReply</i> parameter.
 * @param {Pointer<Integer>} pcbReplyUsed On entry, this is the number of bytes of the buffer pointed to by <i>pReply</i> that are currently used.  On success of the function, this is updated to the number of bytes used after appending the option.
 * @param {Integer} cbBuffer Length of the option value pointed to by the <i>pBuffer</i> parameter.
 * @param {Integer} pBuffer Address of the buffer that contains the DHCPv6 option value. The buffer must contain the encoded option code and option size.
 * 
 * For more information about encoding the option code and option size, developers should refer to the Dynamic Host Configuration Protocol for IPv6 <a href="https://www.ietf.org/rfc/rfc3315.txt">RFC 3315</a> maintained by The Internet Engineering Task Force (IETF).
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6appendoptionraw
 * @since windows8.0
 */
export PxeDhcpv6AppendOptionRaw(pReply, cbReply, pcbReplyUsed, cbBuffer, pBuffer) {
    pcbReplyUsedMarshal := pcbReplyUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6AppendOptionRaw", "ptr", pReply, "uint", cbReply, pcbReplyUsedMarshal, pcbReplyUsed, "ushort", cbBuffer, "ptr", pBuffer, UInt32)
    return result
}

/**
 * Validates that a packet is a DHCP packet.
 * @remarks
 * Providers use this function when the filter set with 
 *     the  <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeprovidersetattribute">PxeProviderSetAttribute</a> function is set to receive all 
 *     packets to determine if a specified packet is a valid DHCP packet. Providers can also use this function to validate 
 *     reply packets; typically this is done only for debug or test builds of the provider.
 * 
 * The validation tests include the following tests.
 * 
 * <table>
 * <tr>
 * <th>DHCP field</th>
 * <th>Initialized value</th>
 * </tr>
 * <tr>
 * <td>Operation (op)</td>
 * <td>If the <i>bClientRequest</i> parameter is <b>TRUE</b>, this field must 
 *        be 1 (BOOTP Request), otherwise this field must be 2 (BOOTP Reply).</td>
 * </tr>
 * <tr>
 * <td>Hardware Address Length (hlen)</td>
 * <td>Must be less than or equal to 16.</td>
 * </tr>
 * <tr>
 * <td>Host Name (sname)</td>
 * <td>Must be <b>NULL</b> terminated.</td>
 * </tr>
 * <tr>
 * <td>Boot file name (file)</td>
 * <td>Must be <b>NULL</b> terminated.</td>
 * </tr>
 * <tr>
 * <td>Magic Cookie (first 4 octets of vend)</td>
 * <td>Must contain valid DHCP Magic Cookie (99 130 83 99).</td>
 * </tr>
 * <tr>
 * <td>Option Length</td>
 * <td>All options must have a valid length and do not overrun the packet.</td>
 * </tr>
 * <tr>
 * <td>DHCP Message Type (53)</td>
 * <td>Must be present.</td>
 * </tr>
 * <tr>
 * <td>End Option (255)</td>
 * <td>Packet must end with DHCP End Option. Due to minimum packet lengths, the packet may be larger but no 
 *        options may follow the End Option.</td>
 * </tr>
 * </table>
 * @param {Integer} pPacket Pointer to a reply packet allocated with 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pPacket</i> parameter.
 * @param {BOOL} bRequestPacket Indicates whether the packet is a request packet. The following table lists the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
 * <dt><b>TRUE</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Packet to be validated is a request packet from the client.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
 * <dt><b>FALSE</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Packet to be validated is a packet generated by the server.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<BOOL>} pbPxeOptionPresent Address of a <b>BOOL</b> that is set to <b>TRUE</b> if the packet 
 *       is a valid DHCP packet that contains the Vendor Class Identifier option (60) with the value set to 
 *       "PXEClient".
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpisvalid
 * @since windowsserver2008
 */
export PxeDhcpIsValid(pPacket, uPacketLen, bRequestPacket, pbPxeOptionPresent) {
    pbPxeOptionPresentMarshal := pbPxeOptionPresent is VarRef ? "int*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpIsValid", "ptr", pPacket, "uint", uPacketLen, BOOL, bRequestPacket, pbPxeOptionPresentMarshal, pbPxeOptionPresent, UInt32)
    return result
}

/**
 * Validates that a packet is a valid DHCPv6 packet.
 * @remarks
 * Providers use this function when the filter set with 
 *     the  <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeprovidersetattribute">PxeProviderSetAttribute</a> function is set to receive all 
 *     packets to determine if a specified packet is a valid DHCPv6 packet. Providers can also use this function to validate 
 *     reply packets; typically this is done only for debug or test builds of the provider.
 * @param {Integer} pPacket Pointer to a reply packet allocated with 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pPacket</i> parameter.
 * @param {BOOL} bRequestPacket Indicates whether the packet is a request packet. The following table lists the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
 * <dt><b>TRUE</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Packet to be validated is a request packet from the client.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
 * <dt><b>FALSE</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Packet to be validated is a packet generated by the server.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<BOOL>} pbPxeOptionPresent Address of a <b>BOOL</b> that is set to <b>TRUE</b> if the packet 
 *       is a valid DHCPv6 packet.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6isvalid
 * @since windows8.0
 */
export PxeDhcpv6IsValid(pPacket, uPacketLen, bRequestPacket, pbPxeOptionPresent) {
    pbPxeOptionPresentMarshal := pbPxeOptionPresent is VarRef ? "int*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6IsValid", "ptr", pPacket, "uint", uPacketLen, BOOL, bRequestPacket, pbPxeOptionPresentMarshal, pbPxeOptionPresent, UInt32)
    return result
}

/**
 * Retrieves an option value from a DHCP packet.
 * @param {Integer} pPacket Pointer to a reply packet allocated with 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Integer} uInstance One-based index that specifies which instance of the <i>bOption</i> parameter to 
 *       retrieve.
 * @param {Integer} bOption Option whose value will be retrieved.
 * @param {Pointer<Integer>} pbOptionLen Address of <b>BYTE</b> which will receive the length of the option value.
 * @param {Pointer<Pointer<Void>>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
 *       packet.
 * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
 *       error code is returned.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0 (0x0)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was found and a pointer to the value was returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2 (0x2)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was not located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DATA</b></dt>
 * <dt>13 (0xD)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The packet is not a valid DHCP packet. This test is not as thorough as the tests used by the 
 *         <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpisvalid">PxeDhcpIsValid</a> function; only the packet length and 
 *         magic cookie are verified.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpgetoptionvalue
 * @since windowsserver2008
 */
export PxeDhcpGetOptionValue(pPacket, uPacketLen, uInstance, bOption, pbOptionLen, ppOptionValue) {
    pbOptionLenMarshal := pbOptionLen is VarRef ? "char*" : "ptr"
    ppOptionValueMarshal := ppOptionValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpGetOptionValue", "ptr", pPacket, "uint", uPacketLen, "uint", uInstance, "char", bOption, pbOptionLenMarshal, pbOptionLen, ppOptionValueMarshal, ppOptionValue, UInt32)
    return result
}

/**
 * Retrieves an option value from a DHCPv6 packet.
 * @param {Integer} pPacket Pointer to a reply packet allocated with 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Integer} uInstance One-based index that specifies which instance of the <i>wOption</i> parameter to 
 *       retrieve.
 * @param {Integer} wOption Option whose value will be retrieved.
 * @param {Pointer<Integer>} pwOptionLen Address of <b>WORD</b> which will receive the length of the option value.
 * @param {Pointer<Pointer<Void>>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
 *       packet.
 * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
 *       error code is returned.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0 (0x0)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was found and a pointer to the value was returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2 (0x2)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was not located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DATA</b></dt>
 * <dt>13 (0xD)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The packet is not a valid DHCPv6 packet. This test is not as thorough as the tests used by the 
 *         <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpv6isvalid">PxeDhcpv6IsValid</a> function; only the packet length and 
 *         magic cookie are verified.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6getoptionvalue
 * @since windows8.0
 */
export PxeDhcpv6GetOptionValue(pPacket, uPacketLen, uInstance, wOption, pwOptionLen, ppOptionValue) {
    pwOptionLenMarshal := pwOptionLen is VarRef ? "ushort*" : "ptr"
    ppOptionValueMarshal := ppOptionValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6GetOptionValue", "ptr", pPacket, "uint", uPacketLen, "uint", uInstance, "ushort", wOption, pwOptionLenMarshal, pwOptionLen, ppOptionValueMarshal, ppOptionValue, UInt32)
    return result
}

/**
 * Retrieves an option value from the Vendor Specific Information field (43) of a DHCP packet.
 * @param {Integer} pPacket Pointer to a reply packet allocated with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Integer} bOption Option whose value will be retrieved.
 * @param {Integer} uInstance One-based index that specifies which instance of the <i>bOption</i> parameter to 
 *       retrieve.
 * @param {Pointer<Integer>} pbOptionLen Address of <b>BYTE</b> which will receive the length of the option value.
 * @param {Pointer<Pointer<Void>>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
 *       packet.
 * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
 *       error code is returned.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0 (0x0)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was found and a pointer to the value was returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2 (0x2)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was not located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DATA</b></dt>
 * <dt>13 (0xD)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The packet is not a valid DHCP packet. This test is not as thorough as the tests used by the 
 *         <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpisvalid">PxeDhcpIsValid</a> function; only the packet length and 
 *         magic cookie are verified.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpgetvendoroptionvalue
 * @since windowsserver2008
 */
export PxeDhcpGetVendorOptionValue(pPacket, uPacketLen, bOption, uInstance, pbOptionLen, ppOptionValue) {
    pbOptionLenMarshal := pbOptionLen is VarRef ? "char*" : "ptr"
    ppOptionValueMarshal := ppOptionValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpGetVendorOptionValue", "ptr", pPacket, "uint", uPacketLen, "char", bOption, "uint", uInstance, pbOptionLenMarshal, pbOptionLen, ppOptionValueMarshal, ppOptionValue, UInt32)
    return result
}

/**
 * Retrieves option values from the OPTION_VENDOR_OPTS (17) field of a DHCPv6 packet.
 * @param {Integer} pPacket Pointer to a reply packet allocated with the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
 * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
 * @param {Integer} dwEnterpriseNumber An Enterprise Number assigned to the vendor of the option by the Internet Assigned Numbers Authority (IANA).
 * 
 * For more information about assigned Enterprise Numbers, developers should refer to the Dynamic Host Configuration Protocol for IPv6 (<a href="https://www.ietf.org/rfc/rfc3315.txt">RFC 3315</a>) maintained by The Internet Engineering Task Force (IETF).
 * @param {Integer} wOption Option whose value will be retrieved.
 * @param {Integer} uInstance One-based index that specifies which instance of the <i>wOption</i> parameter to 
 *       retrieve.
 * @param {Pointer<Integer>} pwOptionLen Address of <b>WORD</b> which will receive the length of the option value.
 * @param {Pointer<Pointer<Void>>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
 *       packet.
 * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
 *       error code is returned.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0 (0x0)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was found and a pointer to the value was returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * <dt>2 (0x2)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was not located.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DATA</b></dt>
 * <dt>13 (0xD)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The packet is not a valid DHCP packet. This test is not as thorough as the tests used by the 
 *         <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpv6isvalid">PxeDhcpv6IsValid</a> function; only the packet length and 
 *         magic cookie are verified.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6getvendoroptionvalue
 * @since windows8.0
 */
export PxeDhcpv6GetVendorOptionValue(pPacket, uPacketLen, dwEnterpriseNumber, wOption, uInstance, pwOptionLen, ppOptionValue) {
    pwOptionLenMarshal := pwOptionLen is VarRef ? "ushort*" : "ptr"
    ppOptionValueMarshal := ppOptionValue is VarRef ? "ptr*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6GetVendorOptionValue", "ptr", pPacket, "uint", uPacketLen, "uint", dwEnterpriseNumber, "ushort", wOption, "uint", uInstance, pwOptionLenMarshal, pwOptionLen, ppOptionValueMarshal, ppOptionValue, UInt32)
    return result
}

/**
 * This function can be used by a provider to parse RELAY-FORW messages and their nested OPTION_RELAY_MSG messages.
 * @param {Integer} pRelayForwPacket Specifies a pointer to a DHCPv6 RELAY-FORW message.
 * @param {Integer} uRelayForwPacketLen The size in bytes of the RELAY-FORW message pointed to by the <i>pRelayForwPacket</i> parameter.
 * @param {Pointer<PXE_DHCPV6_NESTED_RELAY_MESSAGE>} pRelayMessages An array of <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_dhcpv6_nested_relay_message">PXE_DHCPV6_NESTED_RELAY_MESSAGE</a> structures initialized by this routine.  The array’s size is specified by <i>nRelayMessages</i>.  Elements of this array are initialized to point to the nested chain of relay packets encoded in OPTION_RELAY_MSG.  Index 0 is the outermost nested OPTION_RELAY_MSG packet. As the index increases the pointers correspond to more deeply nested OPTION_RELAY_MSG packets.
 * @param {Integer} nRelayMessages The size of the array, in number of array elements, pointed to by the <i>pRelayMessages</i> parameter.
 * @param {Pointer<Integer>} pnRelayMessages Specifies a pointer to a <b>ULONG</b> value which on success receives the actual number of elements written into the <i>pRelayMessages</i> array.
 * @param {Pointer<Pointer<Integer>>} ppInnerPacket Specifies a pointer to a <b>PVOID</b> value which on success is set to the start of the innermost packet in the relay chain. This is the original client request packet.
 * @param {Pointer<Integer>} pcbInnerPacket Specifies a pointer to a <b>ULONG</b> value which on success will be set to the size, in bytes, of the innermost packet in the relay chain which is the original client request packet.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6parserelayforw
 * @since windows8.0
 */
export PxeDhcpv6ParseRelayForw(pRelayForwPacket, uRelayForwPacketLen, pRelayMessages, nRelayMessages, pnRelayMessages, ppInnerPacket, pcbInnerPacket) {
    pnRelayMessagesMarshal := pnRelayMessages is VarRef ? "uint*" : "ptr"
    ppInnerPacketMarshal := ppInnerPacket is VarRef ? "ptr*" : "ptr"
    pcbInnerPacketMarshal := pcbInnerPacket is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6ParseRelayForw", "ptr", pRelayForwPacket, "uint", uRelayForwPacketLen, PXE_DHCPV6_NESTED_RELAY_MESSAGE.Ptr, pRelayMessages, "uint", nRelayMessages, pnRelayMessagesMarshal, pnRelayMessages, ppInnerPacketMarshal, ppInnerPacket, pcbInnerPacketMarshal, pcbInnerPacket, UInt32)
    return result
}

/**
 * Generates a RELAY-REPL message.
 * @param {Pointer<PXE_DHCPV6_NESTED_RELAY_MESSAGE>} pRelayMessages An array of <b>PXE_DHCPV6_NESTED_RELAY_FORW</b> structures which together specify the sequence of nested RELAY-FORW packets.  This value can be obtained from the <i>pRelayMessages</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpv6parserelayforw">PxeDhcpv6ParseRelayForw</a>.
 * @param {Integer} nRelayMessages The number of elements in the array pointed to by the <i>pRelayMessages</i> argument.
 * @param {Integer} pInnerPacket A pointer to a packet which is the server’s response to the innermost packet in the RELAY-FORW chain.
 * @param {Integer} cbInnerPacket The size of the packet pointed to by the <i>pInnerPacket</i> argument.
 * @param {Integer} pReplyBuffer A pointer to a buffer used to construct the outer RELAY-REPL packet. This buffer receives the nested response packet and the nested RELAY-REPL chain specified by the <i>pRelayMessages</i> parameter.
 * @param {Integer} cbReplyBuffer The size of the buffer in bytes  pointed to by <i>pRelyBuffer</i>.
 * @param {Pointer<Integer>} pcbReplyBuffer On success, this is set to the actual size of the RELAY-REPL packet in the buffer pointed to by <i>pRelyBuffer</i>.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxedhcpv6createrelayrepl
 * @since windows8.0
 */
export PxeDhcpv6CreateRelayRepl(pRelayMessages, nRelayMessages, pInnerPacket, cbInnerPacket, pReplyBuffer, cbReplyBuffer, pcbReplyBuffer) {
    pcbReplyBufferMarshal := pcbReplyBuffer is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeDhcpv6CreateRelayRepl", PXE_DHCPV6_NESTED_RELAY_MESSAGE.Ptr, pRelayMessages, "uint", nRelayMessages, "ptr", pInnerPacket, "uint", cbInnerPacket, "ptr", pReplyBuffer, "uint", cbReplyBuffer, pcbReplyBufferMarshal, pcbReplyBuffer, UInt32)
    return result
}

/**
 * Returns information about the PXE server. (PxeGetServerInfo)
 * @param {Integer} uInfoType Selects the information that will be returned.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_GSI_TRACE_ENABLED"></a><a id="pxe_gsi_trace_enabled"></a><dl>
 * <dt><b>PXE_GSI_TRACE_ENABLED</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns a <b>BOOL</b> that indicates whether tracing is enabled for the 
 *         server. <b>TRUE</b> indicates that tracing is enabled.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} pBuffer Address of a buffer that will receive the results of the query. The size and format of the results depends 
 *       on the value of the <i>uInfoType</i> parameter.
 * @param {Integer} uBufferLen Size of buffer pointed to by the <i>pBuffer</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxegetserverinfo
 * @since windowsserver2008
 */
export PxeGetServerInfo(uInfoType, pBuffer, uBufferLen) {
    result := DllCall("WDSPXE.dll\PxeGetServerInfo", "uint", uInfoType, "ptr", pBuffer, "uint", uBufferLen, UInt32)
    return result
}

/**
 * Returns information about the PXE server. (PxeGetServerInfoEx)
 * @param {Integer} uInfoType Selects the information that will be returned.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_GSI_TRACE_ENABLED"></a><a id="pxe_gsi_trace_enabled"></a><dl>
 * <dt><b>PXE_GSI_TRACE_ENABLED</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returns a <b>BOOL</b> that indicates whether tracing is enabled for the 
 *         server. <b>TRUE</b> indicates that tracing is enabled.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="PXE_GSI_SERVER_DUID"></a><a id="pxe_gsi_server_duid"></a><dl>
 * <dt><b>PXE_GSI_SERVER_DUID</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 *  Returns a byte array that corresponds to the DHCPv6 DUID that is sent to DHCPv6 PXE clients in response packets in the OPTION_SERVERID option.  <b>PXE_GSI_SERVER_DUID</b> cannot be used with <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxegetserverinfo">PxeGetServerInfo</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} pBuffer Address of a buffer that will receive the results of the query. The size and format of the results depends 
 *       on the value of the <i>uInfoType</i> parameter.
 * @param {Integer} uBufferLen Size of buffer pointed to by the <i>pBuffer</i> parameter.
 * @param {Pointer<Integer>} puBufferUsed Size of buffer pointed to by the <i>pBuffer</i> parameter.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/nf-wdspxe-pxegetserverinfoex
 * @since windows8.0
 */
export PxeGetServerInfoEx(uInfoType, pBuffer, uBufferLen, puBufferUsed) {
    puBufferUsedMarshal := puBufferUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSPXE.dll\PxeGetServerInfoEx", "uint", uInfoType, "ptr", pBuffer, "uint", uBufferLen, puBufferUsedMarshal, puBufferUsed, UInt32)
    return result
}

/**
 * Registers a provider callback with the multicast server.
 * @param {HANDLE} _hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
 * @param {TRANSPORTPROVIDER_CALLBACK_ID} CallbackId The value of this parameter is a <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/ne-wdstpdi-transportprovider_callback_id">TRANSPORTPROVIDER_CALLBACK_ID</a> structure.
 * @param {Pointer<Void>} _pfnCallback Pointer to the function pointer associated with this id.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/nf-wdstpdi-wdstransportserverregistercallback
 * @since windowsserver2008
 */
export WdsTransportServerRegisterCallback(_hProvider, CallbackId, _pfnCallback) {
    _pfnCallbackMarshal := _pfnCallback is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSMC.dll\WdsTransportServerRegisterCallback", HANDLE, _hProvider, TRANSPORTPROVIDER_CALLBACK_ID, CallbackId, _pfnCallbackMarshal, _pfnCallback, "HRESULT")
    return result
}

/**
 * Provides status of read operation.
 * @param {HANDLE} _hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
 * @param {Integer} ulBytesRead The number of bytes read.
 * @param {Pointer<Void>} pvUserData User data specified by <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderreadcontent">WdsTransportProviderReadContent</a>.
 * @param {HRESULT} hReadResult The status of this read operation.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/nf-wdstpdi-wdstransportservercompleteread
 * @since windowsserver2008
 */
export WdsTransportServerCompleteRead(_hProvider, ulBytesRead, pvUserData, hReadResult) {
    pvUserDataMarshal := pvUserData is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSMC.dll\WdsTransportServerCompleteRead", HANDLE, _hProvider, "uint", ulBytesRead, pvUserDataMarshal, pvUserData, "int", hReadResult, "HRESULT")
    return result
}

/**
 * Sends a debugging message. (WdsTransportServerTrace)
 * @param {HANDLE} _hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
 * @param {Integer} Severity Severity level of the message.
 * @param {PWSTR} pwszFormat A pointer to a null-terminated string value that contains a formatted string.
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/nf-wdstpdi-wdstransportservertrace
 * @since windowsserver2008
 */
export WdsTransportServerTrace(_hProvider, Severity, pwszFormat, args*) {
    pwszFormat := pwszFormat is String ? StrPtr(pwszFormat) : pwszFormat

    varArgs := [args*]
    varArgs.Push("HRESULT")

    result := DllCall("WDSMC.dll\WdsTransportServerTrace", HANDLE, _hProvider, "uint", Severity, "ptr", pwszFormat, varArgs*)
    return result
}

/**
 * Sends a debugging message. (WdsTransportServerTraceV)
 * @param {HANDLE} _hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
 * @param {Integer} Severity Severity level of the message.
 * @param {PWSTR} pwszFormat A pointer to a null-terminated string value that contains a formatted string.
 * @param {Pointer<Integer>} Params A list of parameters used by the formatted string.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/nf-wdstpdi-wdstransportservertracev
 * @since windowsserver2008
 */
export WdsTransportServerTraceV(_hProvider, Severity, pwszFormat, Params) {
    pwszFormat := pwszFormat is String ? StrPtr(pwszFormat) : pwszFormat

    ParamsMarshal := Params is VarRef ? "char*" : "ptr"

    result := DllCall("WDSMC.dll\WdsTransportServerTraceV", HANDLE, _hProvider, "uint", Severity, "ptr", pwszFormat, ParamsMarshal, Params, "HRESULT")
    return result
}

/**
 * Allocates a buffer in memory.
 * @param {HANDLE} _hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
 * @param {Integer} ulBufferSize Size of the buffer to be allocated.
 * @returns {Pointer<Void>} 
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/nf-wdstpdi-wdstransportserverallocatebuffer
 * @since windowsserver2008
 */
export WdsTransportServerAllocateBuffer(_hProvider, ulBufferSize) {
    result := DllCall("WDSMC.dll\WdsTransportServerAllocateBuffer", HANDLE, _hProvider, "uint", ulBufferSize, IntPtr)
    return result
}

/**
 * Releases memory used by a buffer.
 * @param {HANDLE} _hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
 * @param {Pointer<Void>} pvBuffer Pointer to location of buffer to be released.
 * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/nf-wdstpdi-wdstransportserverfreebuffer
 * @since windowsserver2008
 */
export WdsTransportServerFreeBuffer(_hProvider, pvBuffer) {
    pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSMC.dll\WdsTransportServerFreeBuffer", HANDLE, _hProvider, pvBufferMarshal, pvBuffer, "HRESULT")
    return result
}

/**
 * Initializes the Multicast Client.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientinitialize
 * @since windows6.0.6000
 */
export WdsTransportClientInitialize() {
    result := DllCall("WDSTPTC.dll\WdsTransportClientInitialize", UInt32)
    return result
}

/**
 * Initiates a multicast file transfer. (WdsTransportClientInitializeSession)
 * @remarks
 * This function only sets up the session, it does not start the transfer.  To start the transfer, call <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientstartsession">WdsTransportClientStartSession</a>.
 * @param {Pointer<WDS_TRANSPORTCLIENT_REQUEST>} pSessionRequest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/ns-wdstci-wds_transportclient_request">WDS_TRANSPORTCLIENT_REQUEST</a> structure that contains all the details required to initiate the multicast session.  The format of this structure is described below.
 * @param {Pointer<Void>} pCallerData User supplied pointer that will be provided with every callback for this session.
 * @param {Pointer<HANDLE>} hSessionKey Buffer that will receive the address of a handle that the consumer can use to uniquely identify this session to the client.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientinitializesession
 * @since windows6.0.6000
 */
export WdsTransportClientInitializeSession(pSessionRequest, pCallerData, hSessionKey) {
    pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSTPTC.dll\WdsTransportClientInitializeSession", WDS_TRANSPORTCLIENT_REQUEST.Ptr, pSessionRequest, pCallerDataMarshal, pCallerData, HANDLE.Ptr, hSessionKey, UInt32)
    return result
}

/**
 * Registers a callback with the multicast client.
 * @remarks
 * All callbacks must be registered with the client before the consumer calls <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientstartsession">WdsTransportClientStartSession</a>.  Once the session is started, no further callbacks may be registered.
 * @param {HANDLE} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
 * @param {TRANSPORTCLIENT_CALLBACK_ID} CallbackId Identifier specifying which callback is being registered. This parameter receives a <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/ne-wdstci-transportclient_callback_id">TRANSPORTCLIENT_CALLBACK_ID</a> enumeration value. 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>WDS_TRANSPORTCLIENT_SESSION_START</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessionstart">PFN_WdsTransportClientSessionStart</a> callback. This callback is required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivecontents">PFN_WdsTransportClientReceiveContents</a> callback. This callback is required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>WDS_TRANSPORTCLIENT_SESSION_COMPLETE</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessioncomplete">PFN_WdsTransportClientSessionComplete</a> callback. This callback is required.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>WDS_TRANSPORTCLIENT_RECEIVE_METADATA</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivemetadata">PFN_WdsTransportClientReceiveMetadata</a> callback. This callback is optional.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} _pfnCallback Pointer to the function pointer associated with this id.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientregistercallback
 * @since windows6.0.6000
 */
export WdsTransportClientRegisterCallback(hSessionKey, CallbackId, _pfnCallback) {
    _pfnCallbackMarshal := _pfnCallback is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSTPTC.dll\WdsTransportClientRegisterCallback", HANDLE, hSessionKey, TRANSPORTCLIENT_CALLBACK_ID, CallbackId, _pfnCallbackMarshal, _pfnCallback, UInt32)
    return result
}

/**
 * Initiates a multicast file transfer. (WdsTransportClientStartSession)
 * @remarks
 * All callbacks must be registered before this function is called.  If a required callback is not registered, this function will fail.
 * 
 * It is possible for a session to start and complete before this function  returns. This means that it is possible to receive a callback with a session handle that has not been seen yet.  This also means that a session can start and error out before this function has a chance to complete.  In this case, this function may still return success, even if the session itself fails.
 * @param {HANDLE} hSessionKey The handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a> session.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientstartsession
 * @since windows6.0.6000
 */
export WdsTransportClientStartSession(hSessionKey) {
    result := DllCall("WDSTPTC.dll\WdsTransportClientStartSession", HANDLE, hSessionKey, UInt32)
    return result
}

/**
 * Indicates that all processing on a block of data is finished, and that the multicast client may purge this block of data from its cache to make room for further receives.
 * @remarks
 * There must be one call to <b>WdsTransportClientCompleteReceive</b> for each call to the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivecontents">PFN_WdsTransportClientReceiveContents</a> callback that the consumer receives.  The length and offset parameters of this function call must match those provided in the receive contents callback.  Failure to call this function will result in a stall in the multicast client once it hits the cache limit specified by the <i>ulCacheSize</i> of the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/ns-wdstci-wds_transportclient_request">WDS_TRANSPORTCLIENT_REQUEST</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
 * @param {HANDLE} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
 * @param {Integer} ulSize The size of the block being released.
 * @param {Pointer<Integer>} pullOffset The offset of the block being released.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientcompletereceive
 * @since windows6.0.6000
 */
export WdsTransportClientCompleteReceive(hSessionKey, ulSize, pullOffset) {
    pullOffsetMarshal := pullOffset is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSTPTC.dll\WdsTransportClientCompleteReceive", HANDLE, hSessionKey, "uint", ulSize, pullOffsetMarshal, pullOffset, UInt32)
    return result
}

/**
 * Releases the resources associated with a session in the client. (WdsTransportClientCancelSession)
 * @remarks
 * It is safe to call this function from within a callback.
 * @param {HANDLE} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.  This session will eventually complete with an error code of <b>ERROR_CANCELLED</b> to the callback <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessioncomplete">PFN_WdsTransportClientSessionComplete</a> callback.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientcancelsession
 * @since windows6.0.6000
 */
export WdsTransportClientCancelSession(hSessionKey) {
    result := DllCall("WDSTPTC.dll\WdsTransportClientCancelSession", HANDLE, hSessionKey, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} hSessionKey 
 * @param {Integer} dwErrorCode 
 * @returns {Integer} 
 */
export WdsTransportClientCancelSessionEx(hSessionKey, dwErrorCode) {
    result := DllCall("WDSTPTC.dll\WdsTransportClientCancelSessionEx", HANDLE, hSessionKey, "uint", dwErrorCode, UInt32)
    return result
}

/**
 * Blocks until either the multicast session is complete or the specified timeout is reached.
 * @param {HANDLE} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
 * @param {Integer} uTimeout A timeout, in milliseconds.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientwaitforcompletion
 * @since windows6.0.6000
 */
export WdsTransportClientWaitForCompletion(hSessionKey, uTimeout) {
    result := DllCall("WDSTPTC.dll\WdsTransportClientWaitForCompletion", HANDLE, hSessionKey, "uint", uTimeout, UInt32)
    return result
}

/**
 * Retrieves the current status of an ongoing or complete multicast transmission from the multicast client.
 * @remarks
 * It is valid to call this function even after a transfer completes as long as the session key has not been closed.
 * @param {HANDLE} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
 * @param {Pointer<Integer>} puStatus 
 * @param {Pointer<Integer>} puErrorCode If puStatus is set to <b>WDS_TRANSPORTCLIENT_STATUS_FAILURE</b>, this field will be set to the error code of the session.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientquerystatus
 * @since windows6.0.6000
 */
export WdsTransportClientQueryStatus(hSessionKey, puStatus, puErrorCode) {
    puStatusMarshal := puStatus is VarRef ? "uint*" : "ptr"
    puErrorCodeMarshal := puErrorCode is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSTPTC.dll\WdsTransportClientQueryStatus", HANDLE, hSessionKey, puStatusMarshal, puStatus, puErrorCodeMarshal, puErrorCode, UInt32)
    return result
}

/**
 * Releases the resources associated with a session in the client. (WdsTransportClientCloseSession)
 * @remarks
 * This function does not cancel the session and callbacks  can be received until session completes.
 * @param {HANDLE} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>. After this handle has been used with the <b>WdsTransportClientCloseSession</b>, it cannot be used again with the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientcancelsession">WdsTransportClientCancelSession</a> function.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientclosesession
 * @since windows6.0.6000
 */
export WdsTransportClientCloseSession(hSessionKey) {
    result := DllCall("WDSTPTC.dll\WdsTransportClientCloseSession", HANDLE, hSessionKey, UInt32)
    return result
}

/**
 * Increments the reference count on a buffer owned by the multicast client.
 * @param {Pointer<Void>} pvBuffer The buffer on which to increment the reference count.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientaddrefbuffer
 * @since windows6.0.6000
 */
export WdsTransportClientAddRefBuffer(pvBuffer) {
    pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSTPTC.dll\WdsTransportClientAddRefBuffer", pvBufferMarshal, pvBuffer, UInt32)
    return result
}

/**
 * Decrements the reference count on a buffer owned by the multicast client.
 * @param {Pointer<Void>} pvBuffer The buffer on which to decrement the reference count.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientreleasebuffer
 * @since windows6.0.6000
 */
export WdsTransportClientReleaseBuffer(pvBuffer) {
    pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("WDSTPTC.dll\WdsTransportClientReleaseBuffer", pvBufferMarshal, pvBuffer, UInt32)
    return result
}

/**
 * Shuts down the multicast client.
 * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nf-wdstci-wdstransportclientshutdown
 * @since windows6.0.6000
 */
export WdsTransportClientShutdown() {
    result := DllCall("WDSTPTC.dll\WdsTransportClientShutdown", UInt32)
    return result
}

/**
 * Receives a handle to the packet sent by the network boot program. (WdsBpParseInitialize)
 * @param {Integer} pPacket A pointer to the packet received from the WDS client. The packet must be a valid DHCP packet.
 * @param {Integer} uPacketLen The length of the packet, in bytes.
 * @param {Pointer<Integer>} pbPacketType A value that indicates the type of boot program that sent the packet. The bit flags in the following table can be combined.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDSBP_PK_TYPE_DHCP"></a><a id="wdsbp_pk_type_dhcp"></a><dl>
 * <dt><b>WDSBP_PK_TYPE_DHCP</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The presence of this value indicates that the packet is a DHCP packet.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDSBP_PK_TYPE_WDSNBP"></a><a id="wdsbp_pk_type_wdsnbp"></a><dl>
 * <dt><b>WDSBP_PK_TYPE_WDSNBP</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This presence of this value indicates that the DHCP packet came from the WDS network boot program. If this value is absent the type of client was not recognized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDSBP_PK_TYPE_BCD"></a><a id="wdsbp_pk_type_bcd"></a><dl>
 * <dt><b>WDSBP_PK_TYPE_BCD</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The presence of this value indicates that the packet contains a path to a Boot Configuration Data (BCD) file. 
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<HANDLE>} phHandle A handle to the packet. This handle can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpqueryoption">WdsBpQueryOption</a> function and must be closed using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpclosehandle">WdsBpCloseHandle</a> function.
 * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsbp/nf-wdsbp-wdsbpparseinitialize
 * @since windows6.0.6000
 */
export WdsBpParseInitialize(pPacket, uPacketLen, pbPacketType, phHandle) {
    pbPacketTypeMarshal := pbPacketType is VarRef ? "char*" : "ptr"

    result := DllCall("WDSBP.dll\WdsBpParseInitialize", "ptr", pPacket, "uint", uPacketLen, pbPacketTypeMarshal, pbPacketType, HANDLE.Ptr, phHandle, UInt32)
    return result
}

/**
 * Receives a handle to the packet sent by the network boot program. (WdsBpParseInitializev6)
 * @param {Integer} pPacket A pointer to the packet received from the WDS client. The packet must be a valid DHCPv6 packet.
 * @param {Integer} uPacketLen The length of the packet, in bytes.
 * @param {Pointer<Integer>} pbPacketType A value that indicates the type of boot program that sent the packet. The bit flags in the following table can be combined except <b>WDSBP_PK_TYPE_DHCP</b> and <b>WDSBP_PK_TYPE_DHCPV6</b> are mutually exclusive.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDSBP_PK_TYPE_DHCP"></a><a id="wdsbp_pk_type_dhcp"></a><dl>
 * <dt><b>WDSBP_PK_TYPE_DHCP</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The presence of this value indicates that the packet is a DHCP packet. This value is mutually exclusive of <b>WDSBP_PK_TYPE_DHCPV6</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDSBP_PK_TYPE_WDSNBP"></a><a id="wdsbp_pk_type_wdsnbp"></a><dl>
 * <dt><b>WDSBP_PK_TYPE_WDSNBP</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This presence of this value indicates that the DHCPv6 packet came from the WDS network boot program. If this value is absent the type of client was not recognized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDSBP_PK_TYPE_BCD"></a><a id="wdsbp_pk_type_bcd"></a><dl>
 * <dt><b>WDSBP_PK_TYPE_BCD</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The presence of this value indicates that the packet contains a path to a Boot Configuration Data (BCD) file. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WDSBP_PK_TYPE_DHCPV6"></a><a id="wdsbp_pk_type_dhcpv6"></a><dl>
 * <dt><b>WDSBP_PK_TYPE_DHCPV6</b></dt>
 * <dt>8</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The presence of this value indicates that the packet is a DHCPV6 packet. This value is mutually exclusive of <b>WDSBP_PK_TYPE_DHCP</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<HANDLE>} phHandle A handle to the packet. This handle can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpqueryoption">WdsBpQueryOption</a> function and must be closed using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpclosehandle">WdsBpCloseHandle</a> function.
 * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsbp/nf-wdsbp-wdsbpparseinitializev6
 * @since windows8.0
 */
export WdsBpParseInitializev6(pPacket, uPacketLen, pbPacketType, phHandle) {
    pbPacketTypeMarshal := pbPacketType is VarRef ? "char*" : "ptr"

    result := DllCall("WDSBP.dll\WdsBpParseInitializev6", "ptr", pPacket, "uint", uPacketLen, pbPacketTypeMarshal, pbPacketType, HANDLE.Ptr, phHandle, UInt32)
    return result
}

/**
 * Constructs options for the WDS network boot program.
 * @param {Integer} bPacketType 
 * @param {Pointer<HANDLE>} phHandle A pointer to the handle to the packet. This handle can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpaddoption">WdsBpAddOption</a> function to add options for the WDS network boot program. After all the options have been added, use the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpgetoptionbuffer">WdsBpGetOptionBuffer</a> function to add these to the DHCP options list sent to WDS network boot program. The handle must be closed using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpclosehandle">WdsBpCloseHandle</a> function.
 * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsbp/nf-wdsbp-wdsbpinitialize
 * @since windows6.0.6000
 */
export WdsBpInitialize(bPacketType, phHandle) {
    result := DllCall("WDSBP.dll\WdsBpInitialize", "char", bPacketType, HANDLE.Ptr, phHandle, UInt32)
    return result
}

/**
 * Closes the specified handle.
 * @param {HANDLE} hHandle A handle to be closed. This can be a handle obtained using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpparseinitialize">WdsBpParseInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpinitialize">WdsBpInitialize</a> functions.
 * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsbp/nf-wdsbp-wdsbpclosehandle
 * @since windows6.0.6000
 */
export WdsBpCloseHandle(hHandle) {
    result := DllCall("WDSBP.dll\WdsBpCloseHandle", HANDLE, hHandle, UInt32)
    return result
}

/**
 * Returns the value of an option from the parsed packet.
 * @param {HANDLE} hHandle A handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpparseinitialize">WdsBpParseInitialize</a> function.
 * @param {Integer} uOption Specifies the option to add to the packet.
 * @param {Integer} uValueLen The total number of bytes of memory pointed to by the <i>pValue</i> parameter. To determine the number of bytes required to store the value for the option, set <i>uValueLen</i> to zero and <i>pValue</i> to <b>NULL</b>; the <b>WdsBpQueryOption</b> function returns <b>ERROR_INSUFFICIENT_BUFFER</b>, and the location pointed to by the <i>puBytes</i> parameter receives the number of bytes required for the value.
 * @param {Integer} pValue The value of the option is returned in this buffer.
 * @param {Pointer<Integer>} puBytes If the buffer is large enough for the value, this parameter receives the number of bytes copied to <i>pValue</i>. If not enough space is available, this parameter receives the total number of bytes required to store the value.
 * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsbp/nf-wdsbp-wdsbpqueryoption
 * @since windows6.0.6000
 */
export WdsBpQueryOption(hHandle, uOption, uValueLen, pValue, puBytes) {
    puBytesMarshal := puBytes is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSBP.dll\WdsBpQueryOption", HANDLE, hHandle, "uint", uOption, "uint", uValueLen, "ptr", pValue, puBytesMarshal, puBytes, UInt32)
    return result
}

/**
 * Adds an option to the packet.
 * @param {HANDLE} hHandle A handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpinitialize">WdsBpInitialize</a> function.
 * @param {Integer} uOption Specifies the option to add to the packet.
 * @param {Integer} uValueLen The length, in bytes, for the value.
 * @param {Integer} pValue A pointer to a location that contains the value for the option.
 * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsbp/nf-wdsbp-wdsbpaddoption
 * @since windows6.0.6000
 */
export WdsBpAddOption(hHandle, uOption, uValueLen, pValue) {
    result := DllCall("WDSBP.dll\WdsBpAddOption", HANDLE, hHandle, "uint", uOption, "uint", uValueLen, "ptr", pValue, UInt32)
    return result
}

/**
 * Copies information into a buffer that should be added to your DHCP packet options.
 * @param {HANDLE} hHandle A handle to the packet. This handle must have been returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpinitialize">WdsBpInitialize</a> function.
 * @param {Integer} uBufferLen The total number of bytes of memory pointed to by the <i>pBuffer</i> parameter.  To determine the amount of memory required, call the <b>WdsBpGetOptionBuffer</b> function with <i>uBufferLen</i> set to zero and  <i>pBuffer</i> set to <b>NULL</b>. The location pointed to by  the <i>puBytes</i> parameter then receives the size required.
 * @param {Integer} pBuffer A pointer to a location in memory that receives the information that is being sent to the network boot program.
 * @param {Pointer<Integer>} puBytes The number of bytes copied to the buffer.
 * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wdsbp/nf-wdsbp-wdsbpgetoptionbuffer
 * @since windows6.0.6000
 */
export WdsBpGetOptionBuffer(hHandle, uBufferLen, pBuffer, puBytes) {
    puBytesMarshal := puBytes is VarRef ? "uint*" : "ptr"

    result := DllCall("WDSBP.dll\WdsBpGetOptionBuffer", HANDLE, hHandle, "uint", uBufferLen, "ptr", pBuffer, puBytesMarshal, puBytes, UInt32)
    return result
}

;@endregion Functions

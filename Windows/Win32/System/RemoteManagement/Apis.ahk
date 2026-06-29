#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\WSMAN_AUTHENTICATION_CREDENTIALS.ahk" { WSMAN_AUTHENTICATION_CREDENTIALS }
#Import ".\WSMAN_SENDER_DETAILS.ahk" { WSMAN_SENDER_DETAILS }
#Import ".\WSMAN_DATA.ahk" { WSMAN_DATA }
#Import ".\WSMAN_OPTION_SET.ahk" { WSMAN_OPTION_SET }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WSMAN_COMMAND_ARG_SET.ahk" { WSMAN_COMMAND_ARG_SET }
#Import ".\WSManSessionOption.ahk" { WSManSessionOption }
#Import ".\WSMAN_STREAM_ID_SET.ahk" { WSMAN_STREAM_ID_SET }
#Import ".\WSMAN_PROXY_INFO.ahk" { WSMAN_PROXY_INFO }
#Import ".\WSMAN_COMMAND_HANDLE.ahk" { WSMAN_COMMAND_HANDLE }
#Import ".\WSMAN_AUTHZ_QUOTA.ahk" { WSMAN_AUTHZ_QUOTA }
#Import ".\WSMAN_API_HANDLE.ahk" { WSMAN_API_HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WSMAN_SHELL_DISCONNECT_INFO.ahk" { WSMAN_SHELL_DISCONNECT_INFO }
#Import ".\WSMAN_SHELL_ASYNC.ahk" { WSMAN_SHELL_ASYNC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_SHELL_HANDLE.ahk" { WSMAN_SHELL_HANDLE }
#Import ".\WSMAN_SHELL_STARTUP_INFO_V11.ahk" { WSMAN_SHELL_STARTUP_INFO_V11 }
#Import ".\WSMAN_PLUGIN_REQUEST.ahk" { WSMAN_PLUGIN_REQUEST }
#Import ".\WSMAN_SESSION_HANDLE.ahk" { WSMAN_SESSION_HANDLE }
#Import ".\WSMAN_OPERATION_HANDLE.ahk" { WSMAN_OPERATION_HANDLE }

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */

;@region Functions
/**
 * Initializes the Windows Remote Management Client API.
 * @param {Integer} flags A flag of type <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_0</b> or <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_1</b>.
 * The client that will use the disconnect-reconnect functionality should use the 
 * <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_1</b> flag.
 * @param {Pointer<WSMAN_API_HANDLE>} apiHandle Defines a handle that uniquely identifies the client. This parameter cannot be <b>NULL</b>. When you have finished used the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmandeinitialize">WSManDeinitialize</a> method.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmaninitialize
 * @since windows8.0
 */
export WSManInitialize(flags, apiHandle) {
    apiHandleMarshal := apiHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("WsmSvc.dll\WSManInitialize", "uint", flags, apiHandleMarshal, apiHandle, UInt32)
    return result
}

/**
 * Deinitializes the Windows Remote Management client stack.
 * @param {WSMAN_API_HANDLE} apiHandle Specifies the API handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmaninitialize">WSManInitialize</a> call. This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmandeinitialize
 * @since windows6.1
 */
export WSManDeinitialize(apiHandle, flags) {
    result := DllCall("WsmSvc.dll\WSManDeinitialize", WSMAN_API_HANDLE, apiHandle, "uint", flags, UInt32)
    return result
}

/**
 * Retrieves the error messages associated with a particular error and language codes.
 * @param {WSMAN_API_HANDLE} apiHandle Specifies the API handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmaninitialize">WSManInitialize</a> call. This parameter  cannot be <b>NULL</b>.
 * @param {PWSTR} languageCode Specifies the language code name that should be used to localize the error. For more information about the language code names, see the    RFC 3066 specification from the Internet Engineering Task Force at <a href="https://www.ietf.org/rfc/rfc3066.txt">http://www.ietf.org/rfc/rfc3066.txt</a>.  If a language code is not specified, the user interface language of the thread is  used.
 * @param {Integer} errorCode Specifies the error code for the requested error message. This error code can be a hexadecimal or decimal error code from a WinRM, WinHTTP, or other Windows operating system feature.
 * @param {Integer} messageLength Specifies the number of characters that can be stored in the output message buffer, including the <b>null</b> terminator. If this parameter is zero, the <i>message</i> parameter must be <b>NULL</b>.
 * @param {PWSTR} message Specifies the output buffer to store the message in. This buffer must be allocated and deallocated by the client. The buffer must be large enough to store the message and the <b>null</b> terminator. If this parameter is <b>NULL</b>, the <i>messageLength</i> parameter must be <b>NULL</b>.
 * @param {Pointer<Integer>} messageLengthUsed Specifies the actual number of characters written to the output buffer, including the <b>null</b> terminator. This parameter cannot be <b>NULL</b>. If either the <i>messageLength</i> or <i>message</i> parameters are zero, the function will return <b>ERROR_INSUFFICIENT_BUFFER</b> and this parameter will be set to the number of characters needed to store the message, including the <b>null</b> terminator.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmangeterrormessage
 * @since windows6.1
 */
export WSManGetErrorMessage(apiHandle, languageCode, errorCode, messageLength, message, messageLengthUsed) {
    static flags := 0 ;Reserved parameters must always be NULL

    languageCode := languageCode is String ? StrPtr(languageCode) : languageCode
    message := message is String ? StrPtr(message) : message

    messageLengthUsedMarshal := messageLengthUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WsmSvc.dll\WSManGetErrorMessage", WSMAN_API_HANDLE, apiHandle, "uint", flags, "ptr", languageCode, "uint", errorCode, "uint", messageLength, "ptr", message, messageLengthUsedMarshal, messageLengthUsed, UInt32)
    return result
}

/**
 * Creates a session object.
 * @param {WSMAN_API_HANDLE} apiHandle Specifies the API handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmaninitialize">WSManInitialize</a> call. This parameter cannot be <b>NULL</b>.
 * @param {PWSTR} _connection Indicates to which protocol and agent to connect. If this parameter is <b>NULL</b>, the 
 *        connection will default to localhost (127.0.0.1). This parameter can be a simple host name or a complete URL. 
 *        The format is the following:
 * 
 * [transport://]host[:port][/prefix] where:
 * 
 * <table>
 * <tr>
 * <th>Element</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * transport
 * 
 * </td>
 * <td>
 * Either HTTP or HTTPS. Default is HTTP.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * host
 * 
 * </td>
 * <td>
 * Can be in a DNS name, NetBIOS name, or IP address.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * port
 * 
 * </td>
 * <td>
 * Defaults to 80 for HTTP and to 443 for HTTPS. The defaults can be changed in the local configuration.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * prefix
 * 
 * </td>
 * <td>
 * Any string. Default is "wsman". The default can be changed in the local configuration.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {Pointer<WSMAN_AUTHENTICATION_CREDENTIALS>} serverAuthenticationCredentials Defines the authentication method such as Negotiate, Kerberos, Digest, Basic, or client certificate. If the authentication mechanism is Negotiate, Kerberos, Digest, or Basic, the structure can also contain the credentials used for authentication. If  client certificate authentication is used, the certificate thumbprint must be specified.
 * 
 * If credentials are specified, this parameter contains the user name and password of a local account or domain account. If this parameter is <b>NULL</b>, the default credentials are used. The default credentials are the credentials that the current thread is executing under. The client must explicitly specify the credentials when Basic or Digest authentication is used. If explicit credentials are used, both the user name and the password must be valid. For more information about the authentication credentials, see the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_authentication_credentials">WSMAN_AUTHENTICATION_CREDENTIALS</a> structure.
 * @param {Pointer<WSMAN_PROXY_INFO>} proxyInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_proxy_info">WSMAN_PROXY_INFO</a> structure that specifies proxy information. This value can be <b>NULL</b>.
 * @param {Pointer<WSMAN_SESSION_HANDLE>} session Defines the session handle that uniquely identifies the session. This parameter cannot be <b>NULL</b>. This handle  should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosesession">WSManCloseSession</a> method.
 * @returns {Integer} If the function succeeds, the return value is zero. Otherwise, the return value is an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancreatesession
 * @since windows6.1
 */
export WSManCreateSession(apiHandle, _connection, flags, serverAuthenticationCredentials, proxyInfo, session) {
    _connection := _connection is String ? StrPtr(_connection) : _connection

    sessionMarshal := session is VarRef ? "ptr*" : "ptr"

    result := DllCall("WsmSvc.dll\WSManCreateSession", WSMAN_API_HANDLE, apiHandle, "ptr", _connection, "uint", flags, WSMAN_AUTHENTICATION_CREDENTIALS.Ptr, serverAuthenticationCredentials, WSMAN_PROXY_INFO.Ptr, proxyInfo, sessionMarshal, session, UInt32)
    return result
}

/**
 * Closes a session object.
 * @remarks
 * The <b>WSManCloseSession</b> method frees the memory associated with a session and closes all related operations before returning. This is a synchronous call.  All operations are explicitly canceled. It is recommended that all pending operations are either completed or explicitly canceled before calling this function.
 * @param {WSMAN_SESSION_HANDLE} session Specifies the session handle to close. This handle is returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be NULL.
 * @param {Integer} flags Reserved for future use.  Must be zero.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanclosesession
 * @since windows6.1
 */
export WSManCloseSession(session, flags) {
    result := DllCall("WsmSvc.dll\WSManCloseSession", WSMAN_SESSION_HANDLE, session, "uint", flags, UInt32)
    return result
}

/**
 * Sets an extended set of options for the session.
 * @remarks
 * If the <b>WSManSetSessionOption</b> method is called with different values specified for the <i>option</i> parameter, the order of the different options is important. The first  time <b>WSManSetSessionOption</b> is called, the transport is set for the session. If a second call requests a different type of transport, the call will fail.
 * 
 * For example, the second method call will fail if the methods are called in the following order:
 * 
 * <ul>
 * <li><c>WSManSetSessionOption(WSMAN_OPTION_UNENCRYPTED_MESSAGES)</c></li>
 * <li><c>WSManSetSessionOption(WSMAN_OPTION_ALLOW_NEGOTIATE_IMPLICIT_CREDENTIALS)</c></li>
 * </ul>
 * The first method call sets the transport to HTTP because the <i>option</i> parameter is set to <b>WSMAN_OPTION_UNENCRYPTED_MESSAGES</b>.  The second call fails because the option that was passed is applicable for HTTPS and the transport was set to HTTP by the first message.
 * @param {WSMAN_SESSION_HANDLE} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {WSManSessionOption} option Specifies the option to be set. This parameter must be set to one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmansessionoption">WSManSessionOption</a> enumeration.
 * @param {Pointer<WSMAN_DATA>} data A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines the option value.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmansetsessionoption
 * @since windows6.1
 */
export WSManSetSessionOption(session, option, data) {
    result := DllCall("WsmSvc.dll\WSManSetSessionOption", WSMAN_SESSION_HANDLE, session, WSManSessionOption, option, WSMAN_DATA.Ptr, data, UInt32)
    return result
}

/**
 * Gets the value of a session option. (WSManGetSessionOptionAsDword)
 * @param {WSMAN_SESSION_HANDLE} session Specifies the handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {WSManSessionOption} option Specifies the option to get. Not all session options can be retrieved. The options are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmansessionoption">WSManSessionOption</a> enumeration.
 * @param {Pointer<Integer>} value Specifies the value of specified session option.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmangetsessionoptionasdword
 * @since windows6.1
 */
export WSManGetSessionOptionAsDword(session, option, value) {
    valueMarshal := value is VarRef ? "uint*" : "ptr"

    result := DllCall("WsmSvc.dll\WSManGetSessionOptionAsDword", WSMAN_SESSION_HANDLE, session, WSManSessionOption, option, valueMarshal, value, UInt32)
    return result
}

/**
 * Gets the value of a session option. (WSManGetSessionOptionAsString)
 * @param {WSMAN_SESSION_HANDLE} session Specifies the session handle returned by a  <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {WSManSessionOption} option Specifies the option to get. Not all session options can be retrieved. The values for the options are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmansessionoption">WSManSessionOption</a> enumeration.
 * @param {Integer} stringLength Specifies the length of the storage location for <i>string</i> parameter.
 * @param {PWSTR} _string A pointer to the storage location for the value of the specified session option.
 * @param {Pointer<Integer>} stringLengthUsed Specifies the length of the string returned in the <i>string</i> parameter.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmangetsessionoptionasstring
 * @since windows6.1
 */
export WSManGetSessionOptionAsString(session, option, stringLength, _string, stringLengthUsed) {
    _string := _string is String ? StrPtr(_string) : _string

    stringLengthUsedMarshal := stringLengthUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WsmSvc.dll\WSManGetSessionOptionAsString", WSMAN_SESSION_HANDLE, session, WSManSessionOption, option, "uint", stringLength, "ptr", _string, stringLengthUsedMarshal, stringLengthUsed, UInt32)
    return result
}

/**
 * Cancels or closes an asynchronous operation.
 * @remarks
 * The method de-allocates local and remote resources associated with the operation. After the <b>WSManCloseOperation</b> method is called, the <i>operationHandle</i> parameter cannot be passed to any other call. If the callback associated with the operation is pending and has not completed before <b>WSManCloseOperation</b> is called, the operation is marked for deletion and the method returns immediately.
 * @param {WSMAN_OPERATION_HANDLE} operationHandle Specifies the operation handle to be closed.
 * @param {Integer} flags Reserved for future use. Set to zero.
 * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancloseoperation
 * @since windows6.1
 */
export WSManCloseOperation(operationHandle, flags) {
    result := DllCall("WsmSvc.dll\WSManCloseOperation", WSMAN_OPERATION_HANDLE, operationHandle, "uint", flags, UInt32)
    return result
}

/**
 * Creates a shell object.
 * @param {WSMAN_SESSION_HANDLE} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call. This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {PWSTR} resourceUri Defines the shell type to create. The shell type is defined by a unique URI. The actual shell object returned by the call is dependent on the URI specified. This parameter cannot be <b>NULL</b>. To create a Windows cmd.exe shell, use the <b>WSMAN_CMDSHELL_URI</b> resource URI.
 * @param {Pointer<WSMAN_SHELL_STARTUP_INFO_V11>} startupInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure that specifies the input and output streams, working directory, idle time-out, and options for the shell.
 * 
 * If this parameter is <b>NULL</b>, the default values will be used.
 * @param {Pointer<WSMAN_OPTION_SET>} options A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies a set of options for the shell.
 * @param {Pointer<WSMAN_DATA>} createXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the shell. The content should be a valid XML string. This parameter can be <b>NULL</b>.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method.
 * @param {Pointer<WSMAN_SHELL_HANDLE>} _shell Defines a shell handle that uniquely identifies the shell object. The resource handle is used to track the client endpoint for the shell and is used by other WinRM methods to interact with the shell object. The shell object should be deleted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancreateshell
 * @since windows6.1
 */
export WSManCreateShell(session, flags, resourceUri, startupInfo, options, createXml, async, _shell) {
    resourceUri := resourceUri is String ? StrPtr(resourceUri) : resourceUri

    _shellMarshal := _shell is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManCreateShell", WSMAN_SESSION_HANDLE, session, "uint", flags, "ptr", resourceUri, WSMAN_SHELL_STARTUP_INFO_V11.Ptr, startupInfo, WSMAN_OPTION_SET.Ptr, options, WSMAN_DATA.Ptr, createXml, WSMAN_SHELL_ASYNC.Ptr, async, _shellMarshal, _shell)
}

/**
 * Starts the execution of a command within an existing shell and does not wait for the completion of the command.
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the shell handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {PWSTR} commandLine Defines a required <b>null</b>-terminated string that represents the command to be executed. Typically, the command is specified without any arguments, which are specified separately. However, a user can specify the command line and all of the arguments by using this parameter. If arguments are specified for the <i>commandLine</i> parameter, the <i>args</i> parameter should be <b>NULL</b>.
 * @param {Pointer<WSMAN_COMMAND_ARG_SET>} args A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_command_arg_set">WSMAN_COMMAND_ARG_SET</a> structure that defines an array of argument values, which are passed to the command on creation. If no arguments are required, this parameter should be <b>NULL</b>.
 * @param {Pointer<WSMAN_OPTION_SET>} options Defines a set of options for the command. These options are passed to the service to modify or refine the command execution. This parameter can be <b>NULL</b>. For more information about the options, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a>.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
 * @param {Pointer<WSMAN_COMMAND_HANDLE>} command Defines the command object associated with a command within a shell. This handle is returned on a successful call and is used to send and receive data and to signal the command. This handle should be closed  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanrunshellcommand
 * @since windows6.1
 */
export WSManRunShellCommand(_shell, flags, commandLine, args, options, async, command) {
    commandLine := commandLine is String ? StrPtr(commandLine) : commandLine

    commandMarshal := command is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManRunShellCommand", WSMAN_SHELL_HANDLE, _shell, "uint", flags, "ptr", commandLine, WSMAN_COMMAND_ARG_SET.Ptr, args, WSMAN_OPTION_SET.Ptr, options, WSMAN_SHELL_ASYNC.Ptr, async, commandMarshal, command)
}

/**
 * Sends a control code to an existing command or to the shell itself.
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {WSMAN_COMMAND_HANDLE} command Specifies the command handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call. If this value is <b>NULL</b>, the signal code is sent to the shell.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {PWSTR} code Specifies the signal code to send to the command or shell.
 * The following codes are common.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method.
 * @param {Pointer<WSMAN_OPERATION_HANDLE>} signalOperation Defines the operation handle for the signal operation. This handle is returned from a successful call of the function and can be used to asynchronously cancel the signal operation. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmansignalshell
 * @since windows6.1
 */
export WSManSignalShell(_shell, command, flags, code, async, signalOperation) {
    code := code is String ? StrPtr(code) : code

    signalOperationMarshal := signalOperation is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManSignalShell", WSMAN_SHELL_HANDLE, _shell, WSMAN_COMMAND_HANDLE, command, "uint", flags, "ptr", code, WSMAN_SHELL_ASYNC.Ptr, async, signalOperationMarshal, signalOperation)
}

/**
 * Retrieves output from a running command or from the shell.
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the shell handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {WSMAN_COMMAND_HANDLE} command Specifies the command handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {Pointer<WSMAN_STREAM_ID_SET>} desiredStreamSet Specifies the requested output from a particular stream or a list of streams.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method.
 * @param {Pointer<WSMAN_OPERATION_HANDLE>} receiveOperation Defines the operation handle for the receive operation. This handle is returned from a successful call of the function and can be used to asynchronously cancel the receive operation. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanreceiveshelloutput
 * @since windows6.1
 */
export WSManReceiveShellOutput(_shell, command, flags, desiredStreamSet, async, receiveOperation) {
    receiveOperationMarshal := receiveOperation is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManReceiveShellOutput", WSMAN_SHELL_HANDLE, _shell, WSMAN_COMMAND_HANDLE, command, "uint", flags, WSMAN_STREAM_ID_SET.Ptr, desiredStreamSet, WSMAN_SHELL_ASYNC.Ptr, async, receiveOperationMarshal, receiveOperation)
}

/**
 * Ipes the input stream to a running command or to the shell.
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the shell handle returned by a  <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {WSMAN_COMMAND_HANDLE} command Specifies the command handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call.  This handle  should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {PWSTR} streamId Specifies the input stream ID. This parameter cannot be <b>NULL</b>.
 * @param {Pointer<WSMAN_DATA>} streamData Uses the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure to specify the stream data to be sent to the command or shell. This structure should be allocated by the calling client and must remain allocated until <b>WSManSendShellInput</b> completes. If the end of the stream has been reached, the <i>endOfStream</i> parameter should be set to <b>TRUE</b>.
 * @param {BOOL} endOfStream Set to <b>TRUE</b>, if the end of the stream has been reached. Otherwise, this parameter is set to <b>FALSE</b>.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
 * @param {Pointer<WSMAN_OPERATION_HANDLE>} sendOperation Defines the operation handle for the send operation. This handle is returned from a successful call of the function and can be used to asynchronously cancel the send operation. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmansendshellinput
 * @since windows6.1
 */
export WSManSendShellInput(_shell, command, flags, streamId, streamData, endOfStream, async, sendOperation) {
    streamId := streamId is String ? StrPtr(streamId) : streamId

    sendOperationMarshal := sendOperation is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManSendShellInput", WSMAN_SHELL_HANDLE, _shell, WSMAN_COMMAND_HANDLE, command, "uint", flags, "ptr", streamId, WSMAN_DATA.Ptr, streamData, BOOL, endOfStream, WSMAN_SHELL_ASYNC.Ptr, async, sendOperationMarshal, sendOperation)
}

/**
 * Deletes a command and frees the resources that are associated with it.
 * @param {WSMAN_COMMAND_HANDLE} commandHandle Specifies the command handle to be closed. This handle is returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call.
 * @param {Integer} flags Reserved for future use.
 * Must be set to zero.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanclosecommand
 * @since windows6.1
 */
export WSManCloseCommand(commandHandle, flags, async) {
    DllCall("WsmSvc.dll\WSManCloseCommand", WSMAN_COMMAND_HANDLE, commandHandle, "uint", flags, WSMAN_SHELL_ASYNC.Ptr, async)
}

/**
 * Deletes a shell object and frees the resources associated with the shell.
 * @param {WSMAN_SHELL_HANDLE} shellHandle Specifies the shell handle to close. This handle is returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancloseshell
 * @since windows6.1
 */
export WSManCloseShell(shellHandle, flags, async) {
    DllCall("WsmSvc.dll\WSManCloseShell", WSMAN_SHELL_HANDLE, shellHandle, "uint", flags, WSMAN_SHELL_ASYNC.Ptr, async)
}

/**
 * Creates a shell object by using the same functionality as the WSManCreateShell function, with the addition of a client-specified shell ID.
 * @param {WSMAN_SESSION_HANDLE} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call. This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags Reserved for future use. Must be 0.
 * @param {PWSTR} resourceUri Defines the shell type to create. The shell type is defined by a unique URI. The actual shell object returned by the call is dependent on the URI specified. This parameter cannot be <b>NULL</b>. To create a Windows cmd.exe shell, use the <b>WSMAN_CMDSHELL_URI</b> resource URI.
 * @param {PWSTR} shellId The client specified <i>shellID</i>.
 * @param {Pointer<WSMAN_SHELL_STARTUP_INFO_V11>} startupInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure that specifies the input and output streams, working directory, idle timeout, and options for the shell. If this parameter is <b>NULL</b>, the default values will be used.
 * @param {Pointer<WSMAN_OPTION_SET>} options A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies a set of options for the shell.
 * @param {Pointer<WSMAN_DATA>} createXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the shell. The content should be a valid XML string. This parameter can be <b>NULL</b>.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method.
 * @param {Pointer<WSMAN_SHELL_HANDLE>} _shell Defines a shell handle that uniquely identifies the shell object. The resource handle is used to track the client endpoint for the shell and is used by other WinRM methods to interact with the shell object. The shell object should be deleted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancreateshellex
 * @since windows8.0
 */
export WSManCreateShellEx(session, flags, resourceUri, shellId, startupInfo, options, createXml, async, _shell) {
    resourceUri := resourceUri is String ? StrPtr(resourceUri) : resourceUri
    shellId := shellId is String ? StrPtr(shellId) : shellId

    _shellMarshal := _shell is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManCreateShellEx", WSMAN_SESSION_HANDLE, session, "uint", flags, "ptr", resourceUri, "ptr", shellId, WSMAN_SHELL_STARTUP_INFO_V11.Ptr, startupInfo, WSMAN_OPTION_SET.Ptr, options, WSMAN_DATA.Ptr, createXml, WSMAN_SHELL_ASYNC.Ptr, async, _shellMarshal, _shell)
}

/**
 * Provides the same functionality as the WSManRunShellCommand function, with the addition of a command ID option.
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the shell handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call. This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags Reserved for future use. Must be 0.
 * @param {PWSTR} commandId The client specified command Id.
 * @param {PWSTR} commandLine Defines a required null-terminated string that represents the command to be executed. Typically, the command is specified without any arguments, which are specified separately. However, a user can specify the command line and all of the arguments by using this parameter. If arguments are specified for the commandLine parameter, the args parameter should be <b>NULL</b>.
 * @param {Pointer<WSMAN_COMMAND_ARG_SET>} args A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_command_arg_set">WSMAN_COMMAND_ARG_SET</a> structure that defines an array of argument values, which are passed to the command on creation. If no arguments are required, this parameter should be <b>NULL</b>.
 * @param {Pointer<WSMAN_OPTION_SET>} options Defines a set of options for the command. These options are passed to the service to modify or refine the command execution. This parameter can be <b>NULL</b>. For more information about the options, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a>.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
 * @param {Pointer<WSMAN_COMMAND_HANDLE>} command Defines the command object associated with a command within a shell. This handle is returned on a successful call and is used to send and receive data and to signal the command. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanrunshellcommandex
 * @since windows8.0
 */
export WSManRunShellCommandEx(_shell, flags, commandId, commandLine, args, options, async, command) {
    commandId := commandId is String ? StrPtr(commandId) : commandId
    commandLine := commandLine is String ? StrPtr(commandLine) : commandLine

    commandMarshal := command is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManRunShellCommandEx", WSMAN_SHELL_HANDLE, _shell, "uint", flags, "ptr", commandId, "ptr", commandLine, WSMAN_COMMAND_ARG_SET.Ptr, args, WSMAN_OPTION_SET.Ptr, options, WSMAN_SHELL_ASYNC.Ptr, async, commandMarshal, command)
}

/**
 * Disconnects the network connection of an active shell and its associated commands.
 * @remarks
 * This function suspends network connection to an actively connected server session. Any operations performed on 
 *     the shell instance, like <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a>, 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmansendshellinput">WSManSendShellInput</a>, or 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmansignalshell">WSManSignalShell</a>, are bound to complete before 
 *     disconnection. This ensures that any data sent through 
 *     <b>WSManSendShellInput</b> is received by the server 
 *     session before the shell disconnects. The client can optionally modify the server buffering mode by using flags. 
 *     The following behavior is observed:
 * 
 * <ul>
 * <li>
 * <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_DROP</b>–When buffers are full, 
 *        the server drops earlier data in response stream buffers to ensure the corresponding command operation 
 *        continues to run.
 * 
 * </li>
 * <li>
 * <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_BLOCK</b>–When response stream 
 *        buffers are full, the server blocks command execution. If no flag is specified, the server continues to use 
 *        either the configured mode or the mode specified when the shell was created. In case of a network failure, if 
 *        the client is unable to contact the session to disconnect the shell, the following error is returned:
 * 
 * <b>ERROR_WINRS_SHELL_DISCONNECT_OPERATION_NOT_GRACEFUL</b>
 * 
 * The client session still goes into a disconnected state, but it is not guaranteed that any prior operations 
 *        have completed before the session is disconnected.
 * 
 * </li>
 * </ul>
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the handle returned by a call to the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> function. This parameter cannot 
 *       be <b>NULL</b>.
 * @param {Integer} flags Can be a <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_DROP</b> flag or a 
 *       <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_BLOCK</b> flag.
 * @param {Pointer<WSMAN_SHELL_DISCONNECT_INFO>} disconnectInfo A pointer to a 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_disconnect_info">WSMAN_SHELL_DISCONNECT_INFO</a> structure 
 *       that specifies an idle time-out that the server session may enforce. If this parameter is 
 *       <b>NULL</b>, the server session idle time-out will not be changed.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure to contain an optional user context and a mandatory callback function. 
 *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a>. This 
 *       parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmandisconnectshell
 * @since windows8.0
 */
export WSManDisconnectShell(_shell, flags, disconnectInfo, async) {
    DllCall("WsmSvc.dll\WSManDisconnectShell", WSMAN_SHELL_HANDLE, _shell, "uint", flags, WSMAN_SHELL_DISCONNECT_INFO.Ptr, disconnectInfo, WSMAN_SHELL_ASYNC.Ptr, async)
}

/**
 * Reconnects a previously disconnected shell session. To reconnect the shell session's associated commands, use WSManReconnectShellCommand.
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the handle returned by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> function. This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags This parameter is reserved for future use and must be set to zero.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure to contain an optional user context and a mandatory callback function. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a>. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanreconnectshell
 * @since windows8.0
 */
export WSManReconnectShell(_shell, flags, async) {
    DllCall("WsmSvc.dll\WSManReconnectShell", WSMAN_SHELL_HANDLE, _shell, "uint", flags, WSMAN_SHELL_ASYNC.Ptr, async)
}

/**
 * Reconnects a previously disconnected command.
 * @param {WSMAN_COMMAND_HANDLE} commandHandle Specifies the handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call or a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanconnectshellcommand">WSManConnectShellCommand</a> call. This parameter cannot be NULL.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure which will contain an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be NULL.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanreconnectshellcommand
 * @since windows8.0
 */
export WSManReconnectShellCommand(commandHandle, flags, async) {
    DllCall("WsmSvc.dll\WSManReconnectShellCommand", WSMAN_COMMAND_HANDLE, commandHandle, "uint", flags, WSMAN_SHELL_ASYNC.Ptr, async)
}

/**
 * Connects to an existing server session.
 * @remarks
 * Connects to an existing server shell session identified by the <i>ShellId</i> parameter. This builds the necessary client side context, represented by the return parameter shell, that can be used to carry out subsequent operations such as running commands and sending and receiving output on the server shell session. 
 * This <b>WSManConnectShell</b> function does not automatically construct the client side contexts for any commands that are currently associated with the server shell session.
 * @param {WSMAN_SESSION_HANDLE} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> function. This parameter cannot be NULL.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {PWSTR} resourceUri Defines the shell type  to which the connection will be made. The shell type is defined by a unique URI, therefore the shell object returned by the call is dependent on the URI that is specified by this parameter. The <i>resourceUri</i> parameter cannot be NULL and it is a null-terminated string.
 * @param {PWSTR} shellID Specifies the shell identifier that is associated with the server shell session to which the client intends to connect.
 * @param {Pointer<WSMAN_OPTION_SET>} options A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies a set of options for the shell. This parameter is optional.
 * @param {Pointer<WSMAN_DATA>} connectXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the connect shell operation. The content should be a valid XML string. This parameter can be NULL.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure that contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be NULL.
 * @param {Pointer<WSMAN_SHELL_HANDLE>} _shell Specifies a shell handle that uniquely identifies the shell object that was returned by <i>resourceURI</i>. The resource handle tracks the client endpoint for the shell and is used by other WinRM methods to interact with the shell object. The shell object should be deleted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method. This parameter cannot be NULL.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanconnectshell
 * @since windows8.0
 */
export WSManConnectShell(session, flags, resourceUri, shellID, options, connectXml, async, _shell) {
    resourceUri := resourceUri is String ? StrPtr(resourceUri) : resourceUri
    shellID := shellID is String ? StrPtr(shellID) : shellID

    _shellMarshal := _shell is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManConnectShell", WSMAN_SESSION_HANDLE, session, "uint", flags, "ptr", resourceUri, "ptr", shellID, WSMAN_OPTION_SET.Ptr, options, WSMAN_DATA.Ptr, connectXml, WSMAN_SHELL_ASYNC.Ptr, async, _shellMarshal, _shell)
}

/**
 * Connects to an existing command running in a shell.
 * @param {WSMAN_SHELL_HANDLE} _shell Specifies the shell handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call. This parameter cannot be <b>NULL</b>.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {PWSTR} commandID A null-terminated string that identifies a specific command, currently running in the server session, that the client intends to connect to.
 * @param {Pointer<WSMAN_OPTION_SET>} options Defines a set of options for the command. These options are passed to the service to modify or refine the command execution. This parameter can be <b>NULL</b>. For more information about the options, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a>.
 * @param {Pointer<WSMAN_DATA>} connectXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the connect shell operation. The content must be a valid XML string. This parameter can be <b>NULL</b>.
 * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure to contain an optional user context and a mandatory callback function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a>. This parameter cannot be <b>NULL</b>.
 * @param {Pointer<WSMAN_COMMAND_HANDLE>} command This handle is returned on a successful call and is used to send and receive data and to signal the command. When you have finished using this handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method. This parameter cannot be <b>NULL</b>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanconnectshellcommand
 * @since windows8.0
 */
export WSManConnectShellCommand(_shell, flags, commandID, options, connectXml, async, command) {
    commandID := commandID is String ? StrPtr(commandID) : commandID

    commandMarshal := command is VarRef ? "ptr*" : "ptr"

    DllCall("WsmSvc.dll\WSManConnectShellCommand", WSMAN_SHELL_HANDLE, _shell, "uint", flags, "ptr", commandID, WSMAN_OPTION_SET.Ptr, options, WSMAN_DATA.Ptr, connectXml, WSMAN_SHELL_ASYNC.Ptr, async, commandMarshal, command)
}

/**
 * Reports shell and command context back to the Windows Remote Management (WinRM) infrastructure so that further operations can be performed against the shell and/or command.
 * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {Pointer<Void>} _context Defines the value to pass into all future shell and command operations. Represents either the shell or the command. This value should be unique for all shells, and it should also be unique for all commands associated with a shell.
 * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code.  If this method returns an error, the plug-in should shut down the current operation and call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginreportcontext
 * @since windows6.1
 */
export WSManPluginReportContext(requestDetails, flags, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("WsmSvc.dll\WSManPluginReportContext", WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, "uint", flags, _contextMarshal, _context, UInt32)
    return result
}

/**
 * Reports results for the WSMAN_PLUGIN_RECEIVE plug-in call and is used by most shell plug-ins that return results.
 * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {PWSTR} stream Specifies the stream that the data is associated with. Any stream can be used, but the standard streams are STDIN, STDOUT, and STDERR.
 * @param {Pointer<WSMAN_DATA>} streamResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that specifies the result object that is returned to the client. The result can be in either binary or XML format.
 * @param {PWSTR} commandState 
 * @param {Integer} exitCode Ignored in all cases except when <i>commandState</i> is either <b>WSMAN_RECEIVE_STATE_NORMAL_TERMINATION</b> or <b>WSMAN_RECEIVE_STATE_ABNORMAL_TERMINATION</b>. Each result can have separate error codes. If the command or stream has failed, the plug-in must call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginreceiveresult
 * @since windows6.1
 */
export WSManPluginReceiveResult(requestDetails, flags, stream, streamResult, commandState, exitCode) {
    stream := stream is String ? StrPtr(stream) : stream
    commandState := commandState is String ? StrPtr(commandState) : commandState

    result := DllCall("WsmSvc.dll\WSManPluginReceiveResult", WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, "uint", flags, "ptr", stream, WSMAN_DATA.Ptr, streamResult, "ptr", commandState, "uint", exitCode, UInt32)
    return result
}

/**
 * Reports the completion of an operation by all operation entry points except for the WSManPluginStartup and WSManPluginShutdown methods.
 * @remarks
 * The <b>WSManPluginOperationComplete</b> function is used to report the completion of the 
 * data stream for <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_receive">WSManPluginReceive</a>.  The <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_shell">WSManPluginShell</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_command">WSManPluginCommand</a> operations must also call this function when the shell and command operations are complete.
 * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {Integer} errorCode Reports any failure in the operation. If this parameter is not <b>NO_ERROR</b>, any result data that has not been sent will be discarded and the error will be sent.
 * @param {PWSTR} extendedInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
 * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code. If the operation is unsuccessful, the plug-in must stop the current operation and clean up any data associated with this operation. The <i>requestDetails</i> structure is not valid if an error is received and must not be passed to any other WinRM (WinRM) method.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginoperationcomplete
 * @since windows6.1
 */
export WSManPluginOperationComplete(requestDetails, flags, errorCode, extendedInformation) {
    extendedInformation := extendedInformation is String ? StrPtr(extendedInformation) : extendedInformation

    result := DllCall("WsmSvc.dll\WSManPluginOperationComplete", WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, "uint", flags, "uint", errorCode, "ptr", extendedInformation, UInt32)
    return result
}

/**
 * Gets operational information for items such as time-outs and data restrictions that are associated with the operation.
 * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
 * @param {Integer} flags 
 * @param {Pointer<WSMAN_DATA>} data A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that specifies the result object.
 * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code. The following are the most common error codes:
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanplugingetoperationparameters
 * @since windows6.1
 */
export WSManPluginGetOperationParameters(requestDetails, flags, data) {
    result := DllCall("WsmSvc.dll\WSManPluginGetOperationParameters", WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, "uint", flags, WSMAN_DATA.Ptr, data, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pluginContext 
 * @param {Integer} flags 
 * @param {Pointer<WSMAN_DATA>} data 
 * @returns {Integer} 
 */
export WSManPluginGetConfiguration(pluginContext, flags, data) {
    pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

    result := DllCall("WsmSvc.dll\WSManPluginGetConfiguration", pluginContextMarshal, pluginContext, "uint", flags, WSMAN_DATA.Ptr, data, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pluginContext 
 * @param {Integer} flags 
 * @returns {Integer} 
 */
export WSManPluginReportCompletion(pluginContext, flags) {
    pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

    result := DllCall("WsmSvc.dll\WSManPluginReportCompletion", pluginContextMarshal, pluginContext, "uint", flags, UInt32)
    return result
}

/**
 * Releases memory that is allocated for the WSMAN_PLUGIN_REQUEST structure, which is passed into operation plug-in entry points.
 * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginfreerequestdetails
 * @since windows6.1
 */
export WSManPluginFreeRequestDetails(requestDetails) {
    result := DllCall("WsmSvc.dll\WSManPluginFreeRequestDetails", WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, UInt32)
    return result
}

/**
 * Reports either a successful or failed user connection authorization.
 * @remarks
 * If the impersonation token passed into <i>senderDetails</i> is not the identity with which the operation should be performed, or if no impersonation token is available and the plug-in specifies a new  identity to carry out the request, the plug-in should return the new <i>impersonationToken</i> that the WSMan infrastructure will use to impersonate the client before calling into the operation plug-in. If an impersonation token is provided in the <i>senderDetails</i> and the plug-in wants to carry out the operation under that identity, the plug-in should copy the impersonation token from the <i>senderDetails</i> into the <i>impersonationToken</i> parameter. If the plug-in wants to carry out the request under the context of the Internet Information Services (IIS) host process, the <i>impersonationToken</i> should be <b>NULL</b>. If the <i>impersonationToken</i> is <b>NULL</b>, the thread will impersonate the process token before calling into the operation plug-in. 
 * 
 * If the <i>userIsAdministrator</i> parameter is set to <b>TRUE</b>, the user is allowed to view and delete shells owned by different users.
 * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails A pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that was passed into the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_user">WSManPluginAuthzUser</a> plug-in call.
 * @param {Integer} flags Reserved for future use. Must be set to zero.
 * @param {Pointer<Void>} userAuthorizationContext Specifies a plug-in defined context that is used to help track user context information. This context can be returned to multiple calls, to this call, or to an operation call.  The plug-in manages reference counting for all calls.  If the user record times out or re-authorization is required, the WinRM infrastructure calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_release_context">WSManPluginAuthzReleaseContext</a>.
 * @param {HANDLE} impersonationToken Specifies the identity of the user. This parameter is the  <i>clientToken</i> that was passed into <i>senderDetails</i>. If the plug-in changes the user context, a new impersonation token should be returned.
 * 
 * <div class="alert"><b>Note</b>  This token is released after the operation has been completed.</div>
 * <div> </div>
 * @param {BOOL} userIsAdministrator Set to <b>TRUE</b> if the user is an administrator. Otherwise, this parameter is <b>FALSE</b>.
 * @param {Integer} errorCode Reports either a successful or failed authorization.  If the authorization is successful, the code  should be <b>ERROR_SUCCESS</b>.  If the user is not authorized to perform the operation,  the error  should be <b>ERROR_ACCESS_DENIED</b>.  If a failure happens for any other reason, an appropriate error code should be used.  Any error from this call will be sent back as a SOAP fault packet.
 * @param {PWSTR} extendedErrorInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
 * @returns {Integer} The method returns <b>ERROR_SUCCESS</b> if it succeeded; otherwise,  it returns <b>ERROR_INVALID_PARAMETER</b>.  If <b>ERROR_INVALID_PARAMETER</b> is returned, either  the <i>senderDetails</i> parameter was <b>NULL</b> or the <i>flags</i> parameter was not zero.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginauthzusercomplete
 * @since windows6.1
 */
export WSManPluginAuthzUserComplete(senderDetails, flags, userAuthorizationContext, impersonationToken, userIsAdministrator, errorCode, extendedErrorInformation) {
    extendedErrorInformation := extendedErrorInformation is String ? StrPtr(extendedErrorInformation) : extendedErrorInformation

    userAuthorizationContextMarshal := userAuthorizationContext is VarRef ? "ptr" : "ptr"

    result := DllCall("WsmSvc.dll\WSManPluginAuthzUserComplete", WSMAN_SENDER_DETAILS.Ptr, senderDetails, "uint", flags, userAuthorizationContextMarshal, userAuthorizationContext, HANDLE, impersonationToken, BOOL, userIsAdministrator, "uint", errorCode, "ptr", extendedErrorInformation, UInt32)
    return result
}

/**
 * Reports either a successful or failed authorization for a user operation.
 * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails A pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that was passed into the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_operation">WSManPluginAuthzOperation</a> plug-in call.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {Pointer<Void>} userAuthorizationContext Specifies a plug-in defined context that is used to help track user context information. This context can be returned to multiple calls, to this call, or to an operation call.  The plug-in manages reference counting for all calls.  If the user record times out or re-authorization is required, the WinRM (WinRM) infrastructure calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_release_context">WSManPluginAuthzReleaseContext</a>.
 * @param {Integer} errorCode Reports either a successful or failed authorization.  If the authorization is successful, the code  should be <b>ERROR_SUCCESS</b>.  If the user is not authorized to perform the operation,  the error  should be <b>ERROR_ACCESS_DENIED</b>.  If a failure happens for any other reason,  an appropriate error code should be used.  Any error from this call will be sent back as a Simple Object Access Protocol (SOAP) fault packet.
 * @param {PWSTR} extendedErrorInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
 * @returns {Integer} The method returns <b>ERROR_SUCCESS</b> if it succeeded; otherwise,  it returns <b>ERROR_INVALID_PARAMETER</b>.  If <b>ERROR_INVALID_PARAMETER</b> is returned, either  the <i>senderDetails</i> parameter was <b>NULL</b> or the <i>flags</i> parameter was not zero.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginauthzoperationcomplete
 * @since windows6.1
 */
export WSManPluginAuthzOperationComplete(senderDetails, flags, userAuthorizationContext, errorCode, extendedErrorInformation) {
    extendedErrorInformation := extendedErrorInformation is String ? StrPtr(extendedErrorInformation) : extendedErrorInformation

    userAuthorizationContextMarshal := userAuthorizationContext is VarRef ? "ptr" : "ptr"

    result := DllCall("WsmSvc.dll\WSManPluginAuthzOperationComplete", WSMAN_SENDER_DETAILS.Ptr, senderDetails, "uint", flags, userAuthorizationContextMarshal, userAuthorizationContext, "uint", errorCode, "ptr", extendedErrorInformation, UInt32)
    return result
}

/**
 * Called from the WSManPluginAuthzQueryQuota plug-in entry point and must be called whether or not the plug-in can carry out the request.
 * @remarks
 * If the <i>quota</i> parameter is <b>null</b> and the <i>errorCode</i> is <b>NO_ERROR</b>, the method returns <b>ERROR_INVALID_PARAMETER</b> and the plug-in returns the default quota information.  If the plug-in is not returning a quota, the authorization plug-in should not specify that quotas are available in the configuration because performance might be affected.
 * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails A pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that was passed into the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_query_quota">WSManPluginAuthzQueryQuota</a> plug-in call.
 * @param {Integer} flags Reserved for future use. Must be zero.
 * @param {Pointer<WSMAN_AUTHZ_QUOTA>} quota A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_authz_quota">WSMAN_AUTHZ_QUOTA</a> structure that specifies quota information for a specific user.
 * @param {Integer} errorCode Reports either a successful or failed authorization.   If the authorization is successful, the code  should be <b>ERROR_SUCCESS</b>. If a failure happens for any other reason, an appropriate error code should be used.  Any error from this call will be sent back as a Simple Object Access Protocol (SOAP) fault packet.
 * @param {PWSTR} extendedErrorInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
 * @returns {Integer} The method returns <b>ERROR_SUCCESS</b> if it succeeded; otherwise,  it returns <b>ERROR_INVALID_PARAMETER</b>.  If <b>ERROR_INVALID_PARAMETER</b> is returned, either  the <i>senderDetails</i> parameter was <b>NULL</b> or the <i>flags</i> parameter was not zero.   If the method fails, the default quota is used.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginauthzqueryquotacomplete
 * @since windows6.1
 */
export WSManPluginAuthzQueryQuotaComplete(senderDetails, flags, quota, errorCode, extendedErrorInformation) {
    extendedErrorInformation := extendedErrorInformation is String ? StrPtr(extendedErrorInformation) : extendedErrorInformation

    result := DllCall("WsmSvc.dll\WSManPluginAuthzQueryQuotaComplete", WSMAN_SENDER_DETAILS.Ptr, senderDetails, "uint", flags, WSMAN_AUTHZ_QUOTA.Ptr, quota, "uint", errorCode, "ptr", extendedErrorInformation, UInt32)
    return result
}

;@endregion Functions

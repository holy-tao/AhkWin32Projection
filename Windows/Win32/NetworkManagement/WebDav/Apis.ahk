#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WebDav
 * @version v4.0.30319
 */
class WebDav {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DAV_AUTHN_SCHEME_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DAV_AUTHN_SCHEME_NTLM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DAV_AUTHN_SCHEME_PASSPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DAV_AUTHN_SCHEME_DIGEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DAV_AUTHN_SCHEME_NEGOTIATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DAV_AUTHN_SCHEME_CERT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DAV_AUTHN_SCHEME_FBA => 1048576
;@endregion Constants

;@region Methods
    /**
     * Creates a secure connection to a WebDAV server or to a remote file or directory on a WebDAV server.
     * @remarks
     * To close the connection, use the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davdeleteconnection">DavDeleteConnection</a> function.
     * 
     * Use this function when you are connecting to a WebDAV server using the Secure Sockets Layer (SSL) protocol and therefore must specify a certificate. To connect to a WebDAV server without specifying a certificate, use a Windows networking function such as <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection3a">WNetAddConnection3</a>.
     * @param {Pointer<Void>} ConnectionHandle A pointer to a variable that receives the connection handle.
     * @param {Pointer<Char>} RemoteName A pointer to a <b>null</b>-terminated Unicode string that contains the path to the remote file or directory. This string must begin with the "https://" prefix.
     * @param {Pointer<Char>} UserName A pointer to a <b>null</b>-terminated Unicode string that contains the user name to be used for the connection. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<Char>} Password A pointer to a <b>null</b>-terminated Unicode string that contains the password to be used for the connection. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer} ClientCert A pointer to a buffer that contains the client certificate to be used for the connection. The certificate must be in a serialized form.
     * @param {Integer} CertSize Size, in bytes, of the client certificate.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davaddconnection
     * @since windows6.0.6000
     */
    static DavAddConnection(ConnectionHandle, RemoteName, UserName, Password, ClientCert, CertSize) {
        RemoteName := RemoteName is String? StrPtr(RemoteName) : RemoteName
        UserName := UserName is String? StrPtr(UserName) : UserName
        Password := Password is String? StrPtr(Password) : Password

        result := DllCall("NETAPI32.dll\DavAddConnection", "ptr", ConnectionHandle, "ptr", RemoteName, "ptr", UserName, "ptr", Password, "ptr", ClientCert, "uint", CertSize, "uint")
        return result
    }

    /**
     * Closes a connection that was created by using the DavAddConnection function.
     * @param {Pointer<Void>} ConnectionHandle A handle to an open connection that was  created by using the  <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davaddconnection">DavAddConnection</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davdeleteconnection
     * @since windows6.0.6000
     */
    static DavDeleteConnection(ConnectionHandle) {
        result := DllCall("NETAPI32.dll\DavDeleteConnection", "ptr", ConnectionHandle, "uint")
        return result
    }

    /**
     * Converts the specified HTTP path to an equivalent UNC path.
     * @param {Pointer<Char>} Url A pointer to a <b>null</b>-terminated Unicode string that contains the HTTP path. This string can be in any of the following formats, where <i>server</i> is the server name and <i>path</i> is the path to a remote file or directory on the server:
     * 
     * <ul>
     * <li>http://<i>server</i>/<i>path</i></li>
     * <li>http://<i>server</i></li>
     * <li>\\http://<i>server</i>/<i>path</i></li>
     * <li>\\http://<i>server</i></li>
     * <li>https://<i>server</i>/<i>path</i></li>
     * <li>https://<i>server</i></li>
     * <li>\\https://<i>server</i>/<i>path</i></li>
     * <li>\\https://<i>server</i></li>
     * <li>&#92;&#92;<i>server</i>&#92;<i>path</i></li>
     * <li>&#92;&#92;<i>server</i></li>
     * </ul>
     * @param {Pointer<Char>} UncPath A pointer to a caller-allocated buffer  that receives the UNC path as a <b>null</b>-terminated Unicode string.
     * @param {Pointer<UInt32>} lpSize A pointer to a variable that on input specifies the maximum size, in Unicode characters, of the buffer that the <i>UncPath</i> parameter points to. If the function succeeds, on output the variable receives the number of characters that were copied into the buffer, including the terminating <b>NULL</b> character. If the function fails with ERROR_INSUFFICIENT_BUFFER, on output the variable receives the number of characters needed to store the UNC path, including the terminating <b>NULL</b> character.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>, such as the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer that the <i>UncPath</i> parameter points to was not large enough to store the UNC path.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davgetuncfromhttppath
     * @since windows6.0.6000
     */
    static DavGetUNCFromHTTPPath(Url, UncPath, lpSize) {
        Url := Url is String? StrPtr(Url) : Url
        UncPath := UncPath is String? StrPtr(UncPath) : UncPath

        result := DllCall("NETAPI32.dll\DavGetUNCFromHTTPPath", "ptr", Url, "ptr", UncPath, "uint*", lpSize, "uint")
        return result
    }

    /**
     * Converts the specified UNC path to an equivalent HTTP path.
     * @param {Pointer<Char>} UncPath A pointer to a <b>null</b>-terminated Unicode string that contains the UNC path. This path must be in the following format:
     * 
     * &#92;&#92;<i>server</i>[@SSL][@<i>port</i>][&#92;<i>path</i>]
     * 
     * where<ul>
     * <li><i>server</i> is the server name.</li>
     * <li>@SSL is optional and indicates a request for an SSL connection.</li>
     * <li><i>port</i> is an optional port number. The standard ports are 80 for http and 443 for https (SSL).</li>
     * <li><i>path</i> is optional and specifies a path to a remote file or directory on the server.</li>
     * </ul>
     * @param {Pointer<Char>} Url A pointer to a caller-allocated buffer  that receives the HTTP path as a <b>null</b>-terminated Unicode string.
     * @param {Pointer<UInt32>} lpSize A pointer to a variable that on input specifies the maximum size, in Unicode characters, of the buffer that the <i>HttpPath</i> parameter points to. If the function succeeds, on output the variable receives the number of characters that were copied into the buffer. If the function fails with ERROR_INSUFFICIENT_BUFFER, on output the variable receives the number of characters needed to store the HTTP path, including the "http://" or "https://" prefix and the terminating <b>NULL</b> character.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>, such as the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer that the <i>HttpPath</i> parameter points to was not large enough to store the HTTP path.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davgethttpfromuncpath
     * @since windows6.0.6000
     */
    static DavGetHTTPFromUNCPath(UncPath, Url, lpSize) {
        UncPath := UncPath is String? StrPtr(UncPath) : UncPath
        Url := Url is String? StrPtr(Url) : Url

        result := DllCall("NETAPI32.dll\DavGetHTTPFromUNCPath", "ptr", UncPath, "ptr", Url, "uint*", lpSize, "uint")
        return result
    }

    /**
     * Returns the file lock owner for a file that is locked on a WebDAV server.
     * @remarks
     * If a call to a function such as <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> for a file on a WebDAV server fails with ERROR_LOCK_VIOLATION, you can use the <b>DavGetTheLockOwnerOfTheFile</b> function to determine the owner of the file lock.
     * 
     * To obtain the required buffer length for the <i>LockOwnerName</i> buffer, call <b>DavGetTheLockOwnerOfTheFile</b> with <i>LockOwnerName</i> set to <b>NULL</b> and <i>LockOwnerNameLengthInBytes</i> set to zero. The return value is ERROR_INSUFFICIENT_BUFFER, and on output the <i>LockOwnerNameLengthInBytes</i> parameter receives the required buffer length.
     * @param {Pointer<Char>} FileName A pointer to a <b>null</b>-terminated Unicode string that contains the name of a locked file on the WebDAV server. This string must be in one of the following formats:
     * 
     * <ul>
     * <li>&#92;&#92;<i>server</i>&#92;<i>path</i>&#92;<i>filename</i></li>
     * <li><i>drive</i>:&#92;<i>filename</i></li>
     * </ul>
     * where <i>server</i> is the name of a server, <i>path</i> is the path to a remote file on the server, <i>filename</i> is a valid file name, and <i>drive</i> is the drive letter that a remote share is mapped to on the local computer. (A <i>share</i> is a directory on a server that is made available to users over the network.)
     * @param {Pointer} LockOwnerName A pointer to a caller-allocated buffer  that receives the name of the owner of the file lock. This parameter is optional and can be <b>NULL</b>. If it is <b>NULL</b>, the <i>LockOwnerNameLengthInBytes</i> parameter must point to zero on input.
     * @param {Pointer<UInt32>} LockOwnerNameLengthInBytes A pointer to a variable that on input specifies the maximum size, in Unicode characters, of the buffer that the <i>LockOwnerName</i> parameter points to. If the function succeeds, on output the variable receives the number of characters that were copied into the buffer. If the function fails with ERROR_INSUFFICIENT_BUFFER, on output the variable receives the number of characters needed to store the lock owner name, including the terminating <b>NULL</b> character.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer that the <i>LockOwnerName</i> parameter points to was not large enough to store the lock owner name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameter values were not valid. For example, this error code is returned if the <i>FileName</i> parameter is a <b>null</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davgetthelockownerofthefile
     * @since windows6.0.6000
     */
    static DavGetTheLockOwnerOfTheFile(FileName, LockOwnerName, LockOwnerNameLengthInBytes) {
        FileName := FileName is String? StrPtr(FileName) : FileName

        result := DllCall("davclnt.dll\DavGetTheLockOwnerOfTheFile", "ptr", FileName, "ptr", LockOwnerName, "uint*", LockOwnerNameLengthInBytes, "uint")
        return result
    }

    /**
     * Retrieves the extended error code information that the WebDAV server returned for the previous failed I/O operation.
     * @remarks
     * If you call  this function for a file handle whose previous I/O  operation was successful, it returns ERROR_INVALID_PARAMETER.
     * @param {Pointer<Void>} hFile A handle to an open file for which the previous I/O operation has failed. If the previous operation is a failed create operation, in which case there is no open file handle, specify INVALID_HANDLE_VALUE for this parameter.
     * @param {Pointer<UInt32>} ExtError Pointer to a variable that receives the extended error code.
     * @param {Pointer<Char>} ExtErrorString Pointer to a buffer  that receives the extended error information as a null-terminated Unicode string.
     * @param {Pointer<UInt32>} cChSize A pointer to a variable that on input specifies the size, in Unicode characters, of the buffer that the <i>ExtErrorString</i> parameter points to. This value must be at least 1024 characters.
     * 
     *  If the function succeeds, on output the variable receives the number of characters that are actually copied into the buffer. If the function fails with ERROR_INSUFFICIENT_BUFFER, the variable receives 1024, but no characters are copied into the <i>ExtErrorString</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameter values were not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value that the <i>cChSize</i> parameter points to was less than 1024.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davgetextendederror
     * @since windows6.0.6000
     */
    static DavGetExtendedError(hFile, ExtError, ExtErrorString, cChSize) {
        ExtErrorString := ExtErrorString is String? StrPtr(ExtErrorString) : ExtErrorString

        result := DllCall("NETAPI32.dll\DavGetExtendedError", "ptr", hFile, "uint*", ExtError, "ptr", ExtErrorString, "uint*", cChSize, "uint")
        return result
    }

    /**
     * Flushes the data from the local version of a remote file to the WebDAV server.
     * @remarks
     * When an application creates or opens a remote file on a WebDAV server, the WebDAV service downloads the file to the local computer, and the application receives a handle to the open file on the server. Any changes that the application makes to the local file have no effect on the remote file until the file handle is closed  and the local version of the file is uploaded to the server. Because the file handle is closed at the same time that the file is saved to the server, the application cannot check whether the file was saved successfully.
     * 
     * To  avoid this problem, use the  <b>DavFlushFile</b> function to flush the data from the local version of the file to the remote file on the WebDAV server. If the function succeeds, this means that the file was saved successfully.
     * 
     * This function does not flush encrypted files. If <i>hFile</i> is a handle to an encrypted file, <b>DavFlushFile</b> returns ERROR_SUCCESS without flushing the file data.
     * @param {Pointer<Void>} hFile A handle to an open file on a WebDAV server.
     * 
     * The file handle must have the GENERIC_WRITE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>.
     * @returns {Integer} If the function succeeds,  or if <i>hFile</i> is a handle to an encrypted file, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davflushfile
     * @since windows6.0.6000
     */
    static DavFlushFile(hFile) {
        result := DllCall("NETAPI32.dll\DavFlushFile", "ptr", hFile, "uint")
        return result
    }

    /**
     * Invalidates the contents of the local cache for a remote file on a WebDAV server.
     * @remarks
     * The  <b>DavInvalidateCache</b> function marks the contents of the locally cached file (for the specified URL) for deletion. If this function succeeds, the local file cache is no longer valid. This function fails if there are any handles opened against the file either by the same process or by a different process on the local computer.
     * 
     * If the item that is named in the <i>URLName</i> parameter is not present in the cache, <b>DavInvalidateCache</b> returns ERROR_SUCCESS without invalidating the cache.
     * @param {Pointer<Char>} URLName A pointer to a Unicode string that contains the name of a remote file on a WebDAV server. This name can be an HTTP path name (URL) or a UNC path name.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davinvalidatecache
     * @since windows6.0.6000
     */
    static DavInvalidateCache(URLName) {
        URLName := URLName is String? StrPtr(URLName) : URLName

        result := DllCall("davclnt.dll\DavInvalidateCache", "ptr", URLName, "uint")
        return result
    }

    /**
     * Closes all connections to a WebDAV server or a remote file or directory on a WebDAV server.
     * @param {Pointer<Char>} lpName Pointer to a null-terminated Unicode string that contains the name of the remote file or server. This string must be in one of the following formats:
     * 
     * <ul>
     * <li>http://<i>server</i>/<i>path</i></li>
     * <li>&#92;&#92;<i>server</i>&#92;<i>path</i></li>
     * <li><i>server</i></li>
     * </ul>
     * where <i>server</i> is the name of a WebDAV server, and <i>path</i> is the path to a remote file or directory on the server.
     * @param {Integer} fForce A Boolean value that specifies whether the connection should be closed if there are open files. Set this parameter to <b>FALSE</b> if the connection should be closed only if there are no open files. Set this parameter to <b>TRUE</b> if the connection should be closed even if there are open files.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a> or network error code such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpName</i> parameter contained a value that was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_NETNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpName</i> parameter contained a value that was not a valid remote file  name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No connections to the remote file or server were found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are open files on the connection, and <i>fForce</i> parameter was set to <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davcancelconnectionstoserver
     * @since windows6.0.6000
     */
    static DavCancelConnectionsToServer(lpName, fForce) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        result := DllCall("davclnt.dll\DavCancelConnectionsToServer", "ptr", lpName, "int", fForce, "uint")
        return result
    }

    /**
     * Registers an application-defined callback function that the WebDAV client can use to prompt the user for credentials.
     * @remarks
     * The WebDAV client uses the callback function when it is unable to connect to a remote resource using default credentials.
     * 
     * To unregister the callback function, use the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davunregisterauthcallback">DavUnregisterAuthCallback</a> function, passing the returned opaque handle in the <i>hCallback</i>  parameter.
     * @param {Pointer<PFNDAVAUTHCALLBACK>} CallBack A pointer to a function of type <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">PFNDAVAUTHCALLBACK</a>.
     * @param {Integer} Version This parameter is reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is an opaque handle. Note that <b>OPAQUE_HANDLE</b> is defined to be a <b>DWORD</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davregisterauthcallback
     * @since windows6.0.6000
     */
    static DavRegisterAuthCallback(CallBack, Version) {
        result := DllCall("davclnt.dll\DavRegisterAuthCallback", "ptr", CallBack, "uint", Version, "uint")
        return result
    }

    /**
     * Unregisters a registered callback function that the WebDAV client uses to prompt the user for credentials.
     * @remarks
     * To register the callback function, use the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davregisterauthcallback">DavRegisterAuthCallback</a> function.
     * @param {Integer} hCallback The opaque handle that was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davregisterauthcallback">DavRegisterAuthCallback</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/davclnt/nf-davclnt-davunregisterauthcallback
     * @since windows6.0.6000
     */
    static DavUnregisterAuthCallback(hCallback) {
        DllCall("davclnt.dll\DavUnregisterAuthCallback", "uint", hCallback)
    }

;@endregion Methods
}

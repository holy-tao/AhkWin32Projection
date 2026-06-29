#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\CERT_USAGE_MATCH.ahk" { CERT_USAGE_MATCH }
#Import "..\..\Authentication\Identity\LSA_TOKEN_INFORMATION_TYPE.ahk" { LSA_TOKEN_INFORMATION_TYPE }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CSBACKUP_TYPE.ahk" { CSBACKUP_TYPE }
#Import "..\..\Authentication\Identity\SecPkgContext_IssuerListInfoEx.ahk" { SecPkgContext_IssuerListInfoEx }
#Import "..\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CSEDB_RSTMAPW.ahk" { CSEDB_RSTMAPW }
#Import "..\CERT_SELECT_CRITERIA.ahk" { CERT_SELECT_CRITERIA }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */

;@region Functions
/**
 * Determines if a Certificate Services server is online; if the Certificate Services server is not online, backup operations will not be successful.
 * @remarks
 * Call this function to determine whether a Certificate Services server is online and available for backup operations.
 * 
 * This function's name in Certadm.dll is <b>CertSrvIsServerOnlineW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVISSERVERONLINEW</b> in the Certbcli.h header file.
 * @param {PWSTR} pwszServerName A pointer to the NetBIOS or DNS machine name of the server to check for online status.
 * @param {Pointer<BOOL>} pfServerOnline A pointer to Boolean value which will be <b>TRUE</b> if the Certificate Services server is online and <b>FALSE</b> if it is not online.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. This function will fail if Certificate Services is not running. If Certificate Services is running and ready to accept requests, this function will return S_OK, and *<i>pfServerOnline</i> will point to a value of <b>TRUE</b>. If Certificate Services is running in suspended (or paused) mode, this function will return S_OK, and *<i>pfServerOnline</i> will point to a value of <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvisserveronlinew
 * @since windowsserver2003
 */
export CertSrvIsServerOnlineW(pwszServerName, pfServerOnline) {
    pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

    pfServerOnlineMarshal := pfServerOnline is VarRef ? "int*" : "ptr"

    result := DllCall("certadm.dll\CertSrvIsServerOnlineW", "ptr", pwszServerName, pfServerOnlineMarshal, pfServerOnline, "HRESULT")
    return result
}

/**
 * Retrieves the list of Certificate Services dynamic file names that need to be backed up for the given backup context.
 * @remarks
 * Use this function to retrieve a list of the Certificate Services dynamic file names. These files are separate from the Certificate Services database and log files, and they are not backed up by the Certificate Services backup APIs. As a result, some other means must be used to back up the dynamic files. An example of a Certificate Services dynamic file is the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL).
 * 
 * This function's name in the Certadm.dll is <b>CertSrvBackupGetDynamicFileListW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPGETDYNAMICFILELISTW</b> in the Certbcli.h header file.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @param {Pointer<PWSTR>} ppwszzFileList A pointer to a <b>WCHAR</b> pointer that will receive the list of null-terminated dynamic file names used by Certificate Services. There is a null character after every file name and an extra null character at the end of the list. The file name will be in the UNC form "&#92;&#92;<i>Server</i>&#92;<i>SharePoint</i>\…<i>Path</i>…&#92;<i>FileName</i>.ext". When you have finished using this allocated memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupfree">CertSrvBackupFree</a> function.
 * 
 * Before calling this function, setting *<i>ppwszzFileList</i> to <b>NULL</b> is optional.
 * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzFileList</i>.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupgetdynamicfilelistw
 * @since windowsserver2003
 */
export CertSrvBackupGetDynamicFileListW(hbc, ppwszzFileList, pcbSize) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
    ppwszzFileListMarshal := ppwszzFileList is VarRef ? "ptr*" : "ptr"
    pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupGetDynamicFileListW", hbcMarshal, hbc, ppwszzFileListMarshal, ppwszzFileList, pcbSizeMarshal, pcbSize, "HRESULT")
    return result
}

/**
 * Used to prepare a Certificate Services server for backup operations.
 * @remarks
 * Before a Certificate Services backup can occur, it is necessary to create an <b>HCSBC</b> by means of <b>CertSrvBackupPrepare</b>. The resulting <b>HCSBC</b> is a necessary parameter of Certificate Services backup functions which can be used to list, open, read, and close files, as well as truncate the log files.
 * 
 * <div class="alert"><b>Note</b>  When the backup session is completed, it is necessary to call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupend">CertSrvBackupEnd</a> to release the <b>HCSBC</b> which resulted from the call to <b>CertSrvBackupPrepare</b>.</div>
 * <div> </div>
 * This function's name in Certadm.dll is <b>CertSrvBackupPrepareW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPPREPAREW</b> in the Certbcli.h header file.
 * 
 * To execute this call, you must have the backup <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privilege</a>. For details, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/setting-the-backup-and-restore-privileges">Setting the Backup and Restore Privileges</a>.
 * @param {PWSTR} pwszServerName A pointer to the machine name of the server to prepare for online backup. This name can be the NetBIOS name or the DNS name.
 * @param {Integer} grbitJet Value used by the database engine; this value should be set to zero.
 * @param {CSBACKUP_TYPE} dwBackupFlags 
 * @param {Pointer<Pointer<Void>>} phbc A pointer to a Certificate Services backup context handle (<b>HCSBC</b>).
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success, and *<i>phbc</i> will be set to an <b>HCSBC</b> which can be used by other Certificate Services backup APIs.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackuppreparew
 * @since windowsserver2003
 */
export CertSrvBackupPrepareW(pwszServerName, grbitJet, dwBackupFlags, phbc) {
    pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

    phbcMarshal := phbc is VarRef ? "ptr*" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupPrepareW", "ptr", pwszServerName, "uint", grbitJet, CSBACKUP_TYPE, dwBackupFlags, phbcMarshal, phbc, "HRESULT")
    return result
}

/**
 * Retrieves the list of Certificate Services database file names that need to be backed up for the given backup context.
 * @remarks
 * This function's name in the Certadm.dll is <b>CertSrvBackupGetDatabaseNamesW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPGETDATABASENAMESW</b> in the Certbcli.h header file.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @param {Pointer<PWSTR>} ppwszzAttachmentInformation A pointer to a <b>WCHAR</b> pointer that will receive the list of null-terminated database file names. There is a null character after every file name and an extra null character at the end of the list. The file name will be in the UNC form "## \\\\<i>Server</i>\\<i>SharePoint</i>\…<i>Path</i>…\\<i>FileName</i>.ext". The directory names will have the same form but without the trailing "\\<i>FileName</i>.ext". The text "##" denotes a Certificate Services Backup file type (CSBFT_*) and is stored as a single non-null <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> character prefixed onto each UNC path. The type tag is defined in Certbcli.h and can be the following value for this function. 
 * 
 * 
 * 
 * 
 * 					
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CSBFT_CERTSERVER_DATABASE"></a><a id="csbft_certserver_database"></a><dl>
 * <dt><b>CSBFT_CERTSERVER_DATABASE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Certificate Services database file name including path.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * You must free this allocated memory when done by calling <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupfree">CertSrvBackupFree</a>. Before calling this function, setting *<i>ppwszzAttachmentInformation</i> to <b>NULL</b> is optional.
 * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzAttachmentInformation</i>.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw
 * @since windowsserver2003
 */
export CertSrvBackupGetDatabaseNamesW(hbc, ppwszzAttachmentInformation, pcbSize) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
    ppwszzAttachmentInformationMarshal := ppwszzAttachmentInformation is VarRef ? "ptr*" : "ptr"
    pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupGetDatabaseNamesW", hbcMarshal, hbc, ppwszzAttachmentInformationMarshal, ppwszzAttachmentInformation, pcbSizeMarshal, pcbSize, "HRESULT")
    return result
}

/**
 * Opens a file for backup.
 * @remarks
 * Use this function to open a file for backup purposes. When you have finished using the file, close the file by calling 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupclose">CertSrvBackupClose</a> function.
 * 
 * The name of this  function in Certadm.dll is <b>CertSrvBackupOpenFileW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPOPENFILEW</b> in  Certbcli.h.
 * @param {Pointer<Void>} hbc A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Services</a> backup context.
 * @param {PWSTR} pwszAttachmentName File name to open for backup purposes. This file name would be parsed from a list produced by means of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw">CertSrvBackupGetBackupLogs</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw">CertSrvBackupGetDatabaseNames</a>. Note that the names returned by <b>CertSrvBackupGetBackupLogs</b> and <b>CertSrvBackupGetDatabaseNames</b> must have the single-WCHAR CSBFT_* prefix stripped before <b>CertSrvBackupOpenFile</b> is called.
 * @param {Integer} cbReadHintSize Number of bytes used as a hint when the file is read by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupread">CertSrvBackupRead</a>. The <i>cbReadHintSize</i> parameter passed to the first <b>CertSrvBackupOpenFile</b> call for the backup context is used to size the read buffer. Pass zero for this parameter, and the buffer will be sized at a reasonably efficient size chosen by <b>CertSrvBackupOpenFile</b>. If insufficient memory is available, the buffer size will be reduced until memory allocation succeeds or until the buffer size reaches its minimum possible value. Pass a nonzero size to cause <b>CertSrvBackupOpenFile</b> to size the buffer to a power of two near the value of <i>cbReadHintSize</i>. The  implementation will choose only powers of two between 64 KB and 4 MB.
 * @param {Pointer<Integer>} pliFileSize A pointer to a <b>LARGE_INTEGER</b> value that represents the number of bytes in the file.
 * @returns {HRESULT} If the function succeeds, the function returns S_OK.
 * 
 * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupopenfilew
 * @since windowsserver2003
 */
export CertSrvBackupOpenFileW(hbc, pwszAttachmentName, cbReadHintSize, pliFileSize) {
    pwszAttachmentName := pwszAttachmentName is String ? StrPtr(pwszAttachmentName) : pwszAttachmentName

    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
    pliFileSizeMarshal := pliFileSize is VarRef ? "int64*" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupOpenFileW", hbcMarshal, hbc, "ptr", pwszAttachmentName, "uint", cbReadHintSize, pliFileSizeMarshal, pliFileSize, "HRESULT")
    return result
}

/**
 * Reads bytes from a Certificate Services file.
 * @remarks
 * After opening the file for backup purposes (using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupopenfilew">CertSrvBackupOpenFile</a>), call <b>CertSrvBackupRead</b> to retrieve the contents of the file, and call an application-specific routine to write the contents to a backup medium. <b>CertSrvBackupRead</b> and the application-specific routine can be placed in a loop until all the bytes of the file are read and backed up. When done reading the file, close it by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupclose">CertSrvBackupClose</a>.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @param {Pointer<Void>} pvBuffer Void pointer to storage which will contain bytes read from the file being backed up.
 * @param {Integer} cbBuffer Size of the storage area referenced by <i>pvBuffer</i>.
 * @param {Pointer<Integer>} pcbRead A pointer to a <b>DWORD</b> value which represents the actual number of bytes read by <b>CertSrvBackupRead</b>. The number of bytes read can be less than the size of the storage area allocated to <i>pvBuffer</i> if the end of the file has been reached.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupread
 * @since windowsserver2003
 */
export CertSrvBackupRead(hbc, pvBuffer, cbBuffer, pcbRead) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
    pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"
    pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupRead", hbcMarshal, hbc, pvBufferMarshal, pvBuffer, "uint", cbBuffer, pcbReadMarshal, pcbRead, "HRESULT")
    return result
}

/**
 * Closes the file opened by the CertSrvBackupOpenFile function.
 * @remarks
 * For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupopenfilew">CertSrvBackupOpenFile</a>, there should be a subsequent call to <b>CertSrvBackupClose</b>. Upon completion of backing up a  file, the file needs to be closed.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupclose
 * @since windowsserver2003
 */
export CertSrvBackupClose(hbc) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupClose", hbcMarshal, hbc, "HRESULT")
    return result
}

/**
 * Retrieves the list of Certificate Services log file names that need to be backed up for the given backup context.
 * @remarks
 * The log files represent database activity (request submissions, certificate revocation, and so on) that has occurred since the last log file truncation. Log file volume increases as database activity occurs. The log files can be decreased in size by performing a backup and then calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackuptruncatelogs">CertSrvBackupTruncateLogs</a>.
 * 
 * This function's name in the Certadm.dll is <b>CertSrvBackupGetBackupLogsW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPGETBACKUPLOGSW</b> in the Certbcli.h header file.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @param {Pointer<PWSTR>} ppwszzBackupLogFiles 
 * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzBackupLogFiles</i>.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw
 * @since windowsserver2003
 */
export CertSrvBackupGetBackupLogsW(hbc, ppwszzBackupLogFiles, pcbSize) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
    ppwszzBackupLogFilesMarshal := ppwszzBackupLogFiles is VarRef ? "ptr*" : "ptr"
    pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupGetBackupLogsW", hbcMarshal, hbc, ppwszzBackupLogFilesMarshal, ppwszzBackupLogFiles, pcbSizeMarshal, pcbSize, "HRESULT")
    return result
}

/**
 * Eliminates redundant records and reduces the disk storage space used by log files.
 * @remarks
 * After securing a backup of the database and log files, the log files can optionally be truncated. Log file volume increases with database activity, and truncating the log files will reduce the redundant records in the log files (thereby decreasing the disk space used to store the log files).
 * 
 * The log files are provided for database integrity and efficiency. If a less-than-graceful exit occurs with the Certificate Services application, the next time Certificate Services is started, the database replays the log files to prevent data corruption from being introduced into the database.
 * 
 * Depending on the volume of the log files, the log file replay can be a time-consuming process. During this replay, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> will be unavailable for other activity. Note that if the Certificate Services application is properly halted (such as by stopping the service or by shutting down the operating system properly), the log files are not replayed the next time it is started.
 * 
 * <div class="alert"><b>Note</b>  If you call <b>CertSrvBackupTruncateLogs</b> without backing up all files returned from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw">CertSrvBackupGetDatabaseNames</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw">CertSrvBackupGetBackupLogs</a>, you will not be able to restore the backup set successfully, resulting in an unusable Certificate Services machine. Therefore, call <b>CertSrvBackupTruncateLogs</b> only when the backup set contains all files returned from 
 * <b>CertSrvBackupGetDatabaseNames</b> and 
 * <b>CertSrvBackupGetBackupLogs</b>.</div>
 * <div> </div>
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackuptruncatelogs
 * @since windowsserver2003
 */
export CertSrvBackupTruncateLogs(hbc) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupTruncateLogs", hbcMarshal, hbc, "HRESULT")
    return result
}

/**
 * Ends a Certificate Services backup session.
 * @remarks
 * Upon completion of a backup session, the session needs to be terminated by means of <b>CertSrvBackupEnd</b>. For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackuppreparew">CertSrvBackupPrepare</a>, there should be a call to <b>CertSrvBackupEnd</b>.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupend
 * @since windowsserver2003
 */
export CertSrvBackupEnd(hbc) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

    result := DllCall("certadm.dll\CertSrvBackupEnd", hbcMarshal, hbc, "HRESULT")
    return result
}

/**
 * Used to free memory allocated from certain Certificate Services Backup APIs.
 * @remarks
 * Call this function when finished with memory allocated by using the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw">CertSrvBackupGetBackupLogs</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw">CertSrvBackupGetDatabaseNames</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdynamicfilelistw">CertSrvBackupGetDynamicFileList</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvservercontrolw">CertSrvServerControl</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a>
 * </li>
 * </ul>
 * @param {Pointer<Void>} pv A pointer to the memory to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupfree
 * @since windowsserver2003
 */
export CertSrvBackupFree(pv) {
    pvMarshal := pv is VarRef ? "ptr" : "ptr"

    DllCall("certadm.dll\CertSrvBackupFree", pvMarshal, pv)
}

/**
 * Used both in backup and restore scenarios and retrieves the list of Certificate Services database location names for all the files being backed up or restored.
 * @remarks
 * Certificate Services must be running for this method to succeed.
 * 
 * This function's name in Certadm.dll is <b>CertSrvRestoreGetDatabaseLocationsW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVRESTOREGETDATABASELOCATIONSW</b> in the Certbcli.h header file.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup or restore context.
 * @param {Pointer<PWSTR>} ppwszzDatabaseLocationList 
 * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzDatabaseLocationList</i>.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw
 * @since windowsserver2003
 */
export CertSrvRestoreGetDatabaseLocationsW(hbc, ppwszzDatabaseLocationList, pcbSize) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
    ppwszzDatabaseLocationListMarshal := ppwszzDatabaseLocationList is VarRef ? "ptr*" : "ptr"
    pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

    result := DllCall("certadm.dll\CertSrvRestoreGetDatabaseLocationsW", hbcMarshal, hbc, ppwszzDatabaseLocationListMarshal, ppwszzDatabaseLocationList, pcbSizeMarshal, pcbSize, "HRESULT")
    return result
}

/**
 * Prepares a Certificate Services instance for restore operations.
 * @remarks
 * Before a Certificate Services restore operation can occur, it is necessary to create an <b>HCSBC</b> by means of <b>CertSrvRestorePrepare</b>. This <b>HCSBC</b> can be used by various Certificate Services restore functions.
 * 
 * <div class="alert"><b>Note</b>  When the restore session is completed, it is necessary to call <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreend">CertSrvRestoreEnd</a> to release the <b>HCSBC</b> which resulted from the call to <b>CertSrvRestorePrepare</b>.</div>
 * <div> </div>
 * This function's name in Certadm.dll is <b>CertSrvRestorePrepareW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVRESTOREPREPAREW</b> in the Certbcli.h header file.
 * 
 * To execute this call, you must have the restore <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privilege</a>. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/setting-the-backup-and-restore-privileges">Setting the Backup and Restore Privileges</a>.
 * @param {PWSTR} pwszServerName A pointer to the computer name of the server to prepare for restore operations. This name can be the NetBIOS name or the DNS name.
 * @param {Integer} dwRestoreFlags A bitfield that represents the combination of values in the following table.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CSRESTORE_TYPE_FULL"></a><a id="csrestore_type_full"></a><dl>
 * <dt><b>CSRESTORE_TYPE_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Restore Certificate Services database, logs, and related files.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<Void>>} phbc A pointer to a Certificate Services backup context handle (<b>HCSBC</b>).
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success, and *<i>phbc</i> is set to an <b>HCSBC</b>, which can be used by other Certificate Services restore APIs.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestorepreparew
 * @since windowsserver2003
 */
export CertSrvRestorePrepareW(pwszServerName, dwRestoreFlags, phbc) {
    pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

    phbcMarshal := phbc is VarRef ? "ptr*" : "ptr"

    result := DllCall("certadm.dll\CertSrvRestorePrepareW", "ptr", pwszServerName, "uint", dwRestoreFlags, phbcMarshal, phbc, "HRESULT")
    return result
}

/**
 * Registers a Certificate Services restore. (CertSrvRestoreRegisterW)
 * @remarks
 * Use this function to register a restore operation. All subsequent restore operations will be interlocked. The restore target will be prevented from starting (or successfully executing another call to <b>CertSrvRestoreRegister</b>) until 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregistercomplete">CertSrvRestoreRegisterComplete</a> is called.
 * 
 * When restoring more than one incremental backup, the order in which the incremental backups are registered does not matter. However, the full database backup must be registered before registering the incremental backups.
 * 
 * This function requires that the calling account be  a local administrator. If this is not practical, use the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterthroughfile">CertSrvRestoreRegisterThroughFile</a> function instead. The <b>CertSrvRestoreRegisterThroughFile</b> function only requires that the calling account have the restore privilege.
 * @param {Pointer<Void>} hbc A handle to the Certificate Services restore context. This handle is obtained by calling 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a> function.
 * @param {PWSTR} pwszCheckPointFilePath A pointer to a null-terminated Unicode string that contains the restore path for the check point file. Pass <b>NULL</b> for this parameter if it is not needed.
 * @param {PWSTR} pwszLogPath A pointer to a null-terminated Unicode string that contains the current log file directory. Pass <b>NULL</b> for this parameter if it is not needed.
 * @param {Pointer<CSEDB_RSTMAPW>} rgrstmap An array of <b>CSEDB_RSTMAP</b> structures that contains the restore map. If you are performing a full database restoration, this parameter specifies the name of the backup database, as well as a new name for the database after it is restored. The backup database name is referenced by the <b>pwszDatabaseName</b> member, and the new database name is referenced by the <b>pwszNewDatabaseName</b> member. If the intent is to maintain the same name for both the backup database and the restored database, set both the <b>pwszNewDatabaseName</b> and the <b>pwszDatabaseName</b> members to the same name. The backup database name is constructed from the path returned by the backup client's call to 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a> function. <b>CertSrvRestoreGetDatabaseLocations</b> would have been called during a full backup, and the backup client would have saved the returned path.
 * 
 * If you are performing an incremental restoration, pass <b>NULL</b> for this parameter.
 * @param {Integer} crstmap The number of elements in the <i>rgrstmap</i> array. Pass zero for this parameter if you are performing an incremental restoration.
 * @param {PWSTR} pwszBackupLogPath A pointer to a null-terminated Unicode string that contains the path for the backup log directory. Pass <b>NULL</b> for this parameter if it is not needed.
 * @param {Integer} genLow The lowest log number that was restored in this restore session. Log files are in the form of edbXXXXX.log, where XXXXX is a five hexadecimal digit value. For example, edb00001.log is the first log file created by the internal database. For purposes of this function, a value of one in <i>genLow</i> corresponds to the log file edb00001.log.
 * @param {Integer} genHigh The highest log number that was restored in this restore session.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreregisterw
 * @since windowsserver2003
 */
export CertSrvRestoreRegisterW(hbc, pwszCheckPointFilePath, pwszLogPath, rgrstmap, crstmap, pwszBackupLogPath, genLow, genHigh) {
    pwszCheckPointFilePath := pwszCheckPointFilePath is String ? StrPtr(pwszCheckPointFilePath) : pwszCheckPointFilePath
    pwszLogPath := pwszLogPath is String ? StrPtr(pwszLogPath) : pwszLogPath
    pwszBackupLogPath := pwszBackupLogPath is String ? StrPtr(pwszBackupLogPath) : pwszBackupLogPath

    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

    result := DllCall("certadm.dll\CertSrvRestoreRegisterW", hbcMarshal, hbc, "ptr", pwszCheckPointFilePath, "ptr", pwszLogPath, CSEDB_RSTMAPW.Ptr, rgrstmap, "int", crstmap, "ptr", pwszBackupLogPath, "uint", genLow, "uint", genHigh, "HRESULT")
    return result
}

/**
 * Registers a Certificate Services restore. (CertSrvRestoreRegisterThroughFile)
 * @remarks
 * This function is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterw">CertSrvRestoreRegister</a> function except that <b>CertSrvRestoreRegister</b> requires the calling account to be a local administrator. The <b>CertSrvRestoreRegisterThroughFile</b> function only requires that the calling account have the restore privilege.
 * @param {Pointer<Void>} hbc A handle to the Certificate Services restore context. This handle is obtained by calling 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a> function.
 * @param {PWSTR} pwszCheckPointFilePath A pointer to a null-terminated Unicode string that contains the restore path for the check point file. Pass <b>NULL</b> for this parameter if it is not needed.
 * @param {PWSTR} pwszLogPath A pointer to a null-terminated Unicode string that contains the current log file directory. Pass <b>NULL</b> for this parameter if it is not needed.
 * @param {Pointer<CSEDB_RSTMAPW>} rgrstmap An array of <b>CSEDB_RSTMAP</b> structures that contains the restore map. If you are performing a full database restoration, this parameter specifies the name of the backup database, as well as a new name for the database after it is restored. The backup database name is referenced by the <b>pwszDatabaseName</b> member, and the new database name is referenced by the <b>pwszNewDatabaseName</b> member. If the intent is to maintain the same name for both the backup database and the restored database, set both the <b>pwszNewDatabaseName</b> and the <b>pwszDatabaseName</b> members to the same name. The backup database name is constructed from the path returned by the backup client's call to 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a> function. <b>CertSrvRestoreGetDatabaseLocations</b> would have been called during a full backup, and the backup client would have saved the returned path.
 * 
 * If you are performing an incremental restoration, set this parameter to <b>NULL</b>.
 * @param {Integer} crstmap The number of elements in the <i>rgrstmap</i> array. Set this value to one if a you are performing a full restoration, or zero if you are performing an incremental restoration.
 * @param {PWSTR} pwszBackupLogPath A pointer to a null-terminated Unicode string that contains the path for the backup log directory. Pass <b>NULL</b> for this parameter if it is not needed.
 * @param {Integer} genLow The lowest log number that was restored in this restore session. Log files are in the form of edbXXXXX.log, where XXXXX is a five hexadecimal digit value. For example, edb00001.log is the first log file created by the internal database. For purposes of this function, a value of one in <i>genLow</i> corresponds to the log file edb00001.log.
 * @param {Integer} genHigh The highest log number that was restored in this restore session.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreregisterthroughfile
 * @since windowsserver2003
 */
export CertSrvRestoreRegisterThroughFile(hbc, pwszCheckPointFilePath, pwszLogPath, rgrstmap, crstmap, pwszBackupLogPath, genLow, genHigh) {
    pwszCheckPointFilePath := pwszCheckPointFilePath is String ? StrPtr(pwszCheckPointFilePath) : pwszCheckPointFilePath
    pwszLogPath := pwszLogPath is String ? StrPtr(pwszLogPath) : pwszLogPath
    pwszBackupLogPath := pwszBackupLogPath is String ? StrPtr(pwszBackupLogPath) : pwszBackupLogPath

    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

    result := DllCall("certadm.dll\CertSrvRestoreRegisterThroughFile", hbcMarshal, hbc, "ptr", pwszCheckPointFilePath, "ptr", pwszLogPath, CSEDB_RSTMAPW.Ptr, rgrstmap, "int", crstmap, "ptr", pwszBackupLogPath, "uint", genLow, "uint", genHigh, "HRESULT")
    return result
}

/**
 * Completes a registered Certificate Services restore operation.
 * @remarks
 * If a registered restore operation is not completed, Certificate Services will not start.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services restore context. You must set this handle by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterw">CertSrvRestoreRegister</a> before using it in <b>CertSrvRestoreRegisterComplete</b>.
 * @param {HRESULT} hrRestoreState <b>HRESULT</b> value indicating the success code for the restore operation. Set this value to S_OK if the restore operation was successful.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreregistercomplete
 * @since windowsserver2003
 */
export CertSrvRestoreRegisterComplete(hbc, hrRestoreState) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

    result := DllCall("certadm.dll\CertSrvRestoreRegisterComplete", hbcMarshal, hbc, "int", hrRestoreState, "HRESULT")
    return result
}

/**
 * Ends a Certificate Services restore session.
 * @remarks
 * When a restore session is complete, terminate the session by calling <b>CertSrvRestoreEnd</b>. For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a>, there should be a call to <b>CertSrvRestoreEnd</b>.
 * 
 * When a restore is complete, it is important that you make a new full backup of the Certificate Services database. This is necessary to truncate the restored log files and to establish a base backup set for future restores. Backups performed after a restore cannot be mixed with backups (full or incremental) taken before the restore; that is, after a certificate services database is restored and has progressed to a subsequent state, you cannot use the pre-restoration backups to restore the database to that subsequent state.
 * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreend
 * @since windowsserver2003
 */
export CertSrvRestoreEnd(hbc) {
    hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

    result := DllCall("certadm.dll\CertSrvRestoreEnd", hbcMarshal, hbc, "HRESULT")
    return result
}

/**
 * Issues a service control command to programmatically stop Certificate Services.
 * @remarks
 * The purpose of this function is to allow a backup or restore application to programmatically stop the Certificate Services application (thereby not requiring the use of the service controller APIs). Stopping Certificate Services in this manner will also work when Certificate Services is running in console mode; the service controller APIs cannot control applications running in console mode.
 * 
 * This function's name in Certadm.dll is <b>CertSrvServerControlW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVSERVERCONTROLW</b> in the Certbcli.h header file.
 * @param {PWSTR} pwszServerName A pointer to a name or a configuration string of the server to be issued the control command.
 * @param {Integer} dwControlFlags Value representing the control command being issued to the Certificate Services server specified by <i>pwszServerName</i>. The following value is supported for <i>dwControlFlags</i>.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CSCONTROL_SHUTDOWN"></a><a id="cscontrol_shutdown"></a><dl>
 * <dt><b>CSCONTROL_SHUTDOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Stop Certificate Services.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} pcbOut For future use, this parameter will be the number of bytes allocated to <i>ppbOut</i>. The current implementation does not allocate memory to <i>ppbOut</i>. You can set this value to <b>NULL</b>.
 * @param {Pointer<Pointer<Integer>>} ppbOut For future use, this parameter will be the pointer to pointer to bytes representing the output from the issued command. The current implementation does not allocate memory to <i>ppbOut</i>. You can set this value to <b>NULL</b>.
 * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
 * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvservercontrolw
 * @since windowsserver2003
 */
export CertSrvServerControlW(pwszServerName, dwControlFlags, pcbOut, ppbOut) {
    pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

    pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"
    ppbOutMarshal := ppbOut is VarRef ? "ptr*" : "ptr"

    result := DllCall("certadm.dll\CertSrvServerControlW", "ptr", pwszServerName, "uint", dwControlFlags, pcbOutMarshal, pcbOut, ppbOutMarshal, ppbOut, "HRESULT")
    return result
}

/**
 * Retrieves a list of certification authorities (CAs) trusted by the specified server.
 * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server to check.
 * @param {Integer} cCriteria The number of elements in the <i>rgpCriteria</i> array.
 * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria A constant pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_select_criteria">CERT_SELECT_CRITERIA</a> structures that specify the criteria used to select certificate chains.
 * @param {Pointer<Pointer<SecPkgContext_IssuerListInfoEx>>} ppTrustedIssuers A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-secpkgcontext_issuerlistinfoex">SecPkgContext_IssuerListInfoEx</a> structures that receive the CAs trusted by the server specified by the <i>pTargetName</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
 * 
 * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
 * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstgettrustanchors
 * @since windows6.1
 */
export PstGetTrustAnchors(pTargetName, cCriteria, rgpCriteria, ppTrustedIssuers) {
    ppTrustedIssuersMarshal := ppTrustedIssuers is VarRef ? "ptr*" : "ptr"

    result := DllCall("certpoleng.dll\PstGetTrustAnchors", UNICODE_STRING.Ptr, pTargetName, "uint", cCriteria, CERT_SELECT_CRITERIA.Ptr, rgpCriteria, ppTrustedIssuersMarshal, ppTrustedIssuers, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} pTargetName 
 * @param {Integer} cCriteria 
 * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria 
 * @param {Pointer<CERT_CONTEXT>} pCertContext 
 * @param {Pointer<Pointer<SecPkgContext_IssuerListInfoEx>>} ppTrustedIssuers 
 * @returns {NTSTATUS} 
 */
export PstGetTrustAnchorsEx(pTargetName, cCriteria, rgpCriteria, pCertContext, ppTrustedIssuers) {
    ppTrustedIssuersMarshal := ppTrustedIssuers is VarRef ? "ptr*" : "ptr"

    result := DllCall("certpoleng.dll\PstGetTrustAnchorsEx", UNICODE_STRING.Ptr, pTargetName, "uint", cCriteria, CERT_SELECT_CRITERIA.Ptr, rgpCriteria, CERT_CONTEXT.Ptr, pCertContext, ppTrustedIssuersMarshal, ppTrustedIssuers, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<CERT_CONTEXT>} pCert 
 * @param {Pointer<SecPkgContext_IssuerListInfoEx>} pTrustedIssuers 
 * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChainContext 
 * @returns {NTSTATUS} 
 */
export PstGetCertificateChain(pCert, pTrustedIssuers, ppCertChainContext) {
    ppCertChainContextMarshal := ppCertChainContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("certpoleng.dll\PstGetCertificateChain", CERT_CONTEXT.Ptr, pCert, SecPkgContext_IssuerListInfoEx.Ptr, pTrustedIssuers, ppCertChainContextMarshal, ppCertChainContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves certificate chains that specify certificates that can be used to authenticate a user on the specified server.
 * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server to check.
 * @param {Integer} cCriteria The number of elements in the <i>rgpCriteria</i> array.
 * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria A constant pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_select_criteria">CERT_SELECT_CRITERIA</a> structures that specify the criteria used to select certificate chains.
 * @param {BOOL} bIsClient <b>TRUE</b> if the caller is the client; otherwise, <b>FALSE</b>.
 * @param {Pointer<Integer>} pdwCertChainContextCount The number of elements in the <i>ppCertChainContexts</i> array.
 * @param {Pointer<Pointer<Pointer<CERT_CHAIN_CONTEXT>>>} ppCertChainContexts The address of a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structures that specifies the certificate chains of certificates that can be used to authenticate a user on the server specified by the <i>pTargetName</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
 * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstgetcertificates
 * @since windows6.1
 */
export PstGetCertificates(pTargetName, cCriteria, rgpCriteria, bIsClient, pdwCertChainContextCount, ppCertChainContexts) {
    pdwCertChainContextCountMarshal := pdwCertChainContextCount is VarRef ? "uint*" : "ptr"
    ppCertChainContextsMarshal := ppCertChainContexts is VarRef ? "ptr*" : "ptr"

    result := DllCall("certpoleng.dll\PstGetCertificates", UNICODE_STRING.Ptr, pTargetName, "uint", cCriteria, CERT_SELECT_CRITERIA.Ptr, rgpCriteria, BOOL, bIsClient, pdwCertChainContextCountMarshal, pdwCertChainContextCount, ppCertChainContextsMarshal, ppCertChainContexts, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Associates the caller's private key with the specified certificate.
 * @param {Pointer<CERT_CONTEXT>} pCert The certificate with which to associate the private key.
 * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
 * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstacquireprivatekey
 * @since windows6.1
 */
export PstAcquirePrivateKey(pCert) {
    result := DllCall("certpoleng.dll\PstAcquirePrivateKey", CERT_CONTEXT.Ptr, pCert, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Validates the specified certificate.
 * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server. If the caller is not the client, this parameter is <b>NULL</b>.
 * @param {BOOL} bIsClient <b>TRUE</b> if the caller is the client; otherwise, <b>FALSE</b>.
 * @param {Pointer<CERT_USAGE_MATCH>} pRequestedIssuancePolicy A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_usage_match">CERT_USAGE_MATCH</a> structure that specifies identifiers that the certificate must match to be validated.
 * @param {Pointer<HCERTSTORE>} phAdditionalCertStore A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> that contains additional certificates used for the authentication.
 * @param {Pointer<CERT_CONTEXT>} pCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate to validate.
 * @param {Pointer<Guid>} pProvGUID A pointer to  a <b>GUID</b> structure that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) used for the authentication.
 * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
 * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstvalidate
 * @since windows6.1
 */
export PstValidate(pTargetName, bIsClient, pRequestedIssuancePolicy, phAdditionalCertStore, pCert, pProvGUID) {
    result := DllCall("certpoleng.dll\PstValidate", UNICODE_STRING.Ptr, pTargetName, BOOL, bIsClient, CERT_USAGE_MATCH.Ptr, pRequestedIssuancePolicy, HCERTSTORE.Ptr, phAdditionalCertStore, CERT_CONTEXT.Ptr, pCert, Guid.Ptr, pProvGUID, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a structure that specifies information that can be used to create a user token associated with the specified certificate.
 * @param {Pointer<CERT_CONTEXT>} pCert A constant pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate for which to obtain token information.
 * @param {Pointer<LSA_TOKEN_INFORMATION_TYPE>} pTokenInformationType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ne-ntsecpkg-lsa_token_information_type">LSA_TOKEN_INFORMATION_TYPE</a> enumeration that indicates the type of structure pointed to by the <i>ppTokenInformation</i> parameter.
 * @param {Pointer<Pointer<Void>>} ppTokenInformation The address of a pointer to a structure that specifies information that can be used to create a user token.
 * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
 * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstmapcertificate
 * @since windows6.1
 */
export PstMapCertificate(pCert, pTokenInformationType, ppTokenInformation) {
    pTokenInformationTypeMarshal := pTokenInformationType is VarRef ? "int*" : "ptr"
    ppTokenInformationMarshal := ppTokenInformation is VarRef ? "ptr*" : "ptr"

    result := DllCall("certpoleng.dll\PstMapCertificate", CERT_CONTEXT.Ptr, pCert, pTokenInformationTypeMarshal, pTokenInformationType, ppTokenInformationMarshal, ppTokenInformation, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves the user name associated with the specified certificate.
 * @param {Pointer<CERT_CONTEXT>} pCertContext A constant pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate for which to obtain the user name.
 * @param {Pointer<UNICODE_STRING>} UserName The user name associated with the certificate specified by the <i>pCertContext</i> parameter.
 * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
 * 
 * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
 * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstgetusernameforcertificate
 * @since windows6.1
 */
export PstGetUserNameForCertificate(pCertContext, UserName) {
    result := DllCall("certpoleng.dll\PstGetUserNameForCertificate", CERT_CONTEXT.Ptr, pCertContext, UNICODE_STRING.Ptr, UserName, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

;@endregion Functions

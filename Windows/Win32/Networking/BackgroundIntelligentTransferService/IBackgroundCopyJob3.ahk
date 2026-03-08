#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob2.ahk

/**
 * Use the IBackgroundCopyJob3 interface to download ranges of a file and change the prefix of a remote file name.
 * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nn-bits2_0-ibackgroundcopyjob3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob3 extends IBackgroundCopyJob2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJob3
     * @type {Guid}
     */
    static IID => Guid("{443c8934-90ff-48ed-bcde-26f5c7450042}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReplaceRemotePrefix", "AddFileWithRanges", "SetFileACLFlags", "GetFileACLFlags"]

    /**
     * Replaces the beginning text of all remote names in the download job with the specified string.
     * @remarks
     * Typically, you use this method to change the server portion of the remote name when the server is unavailable or to let  roaming users connect to the closest server. This method changes all matching remote names in the job. To change the remote name of a specific file, use the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyfile2-setremotename">IBackgroundCopyFile2::SetRemoteName</a> method.
     * 
     * The <b>ReplaceRemotePrefix</b> method performs a case-sensitive search of all the  remote names in the job. If the beginning text of the remote name matches the string in <i>OldPrefix</i>, BITS replaces the text with the string found in <i>NewPrefix</i>. For example, to change "http://Server/Path/File.ext" to "http://NewServerName/Path/File.ext", set <i>OldPrefix</i> to "http://Server" and <i>NewPrefix</i> to "http://NewServerName". Note that BITS does not perform locale conversions in the search.
     * 
     * If the time stamp or file size of the new remote name is different from the previous remote name or the new server does not support checkpoint resume (for HTTP remote names), BITS restarts the download. Otherwise, the transfer resumes from the same position on the new server. BITS does not restart already transferred files. 
     * 
     * You can use this method to change protocols. However, the resulting URL may not be well formed. For example, changing from \\Server\Dir\File.ext to http://Server\Dir\File.ext may not resolve. Consider using the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyfile2-setremotename">IBackgroundCopyFile2::SetRemoteName</a> method instead.
     * 
     * Note that this method may not find URLs to change if you called the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setsecurityflags">IBackgroundCopyJobHttpOptions::SetSecurityFlags</a> method and set the <b>BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT</b> flag. This policy changes the original URL to the final, redirected URL if the URL is redirected.
     * @param {PWSTR} OldPrefix Null-terminated string that identifies the  text to  replace in the remote name. The text must start at the beginning of the remote name.
     * @param {PWSTR} NewPrefix Null-terminated string that contains the replacement text.
     * @returns {HRESULT} This method returns the following return values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No matches found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applying  <i>NewPrefix</i> creates an invalid URL or the new URL is too long (the URL cannot exceed 2,200 characters).
     * 
     * You can also receive this return code if the <i>OldPrefix</i> or <i>NewPrefix</i> is an empty string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot call this method for upload or upload-reply jobs; call this method only for download jobs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be <b>BG_JOB_STATE_CANCELLED</b> or <b>BG_JOB_STATE_ACKNOWLEDGED</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-replaceremoteprefix
     */
    ReplaceRemotePrefix(OldPrefix, NewPrefix) {
        OldPrefix := OldPrefix is String ? StrPtr(OldPrefix) : OldPrefix
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(43, this, "ptr", OldPrefix, "ptr", NewPrefix, "HRESULT")
        return result
    }

    /**
     * Adds a file to a download job and specifies the ranges of the file you want to download.
     * @remarks
     * The ranges are written to the <i>LocalName</i> file in the order given. For example, if <i>Ranges</i> identifies bytes 100-199, 900-999, and 400-499 of the remote file, the local file will be 300 bytes long. Bytes 0-99 of the local file will contain bytes 100-199 of the remote file, bytes 100-199 of the local file will contain bytes 900-999 of the remote file, and bytes 200-299 of the local file will contain bytes 400-499 of the remote file.
     * 
     * The following table identifies possible error codes that can occur after you resume the job. These errors place the job in the BG_JOB_STATE_ERROR state.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>BG_E_INVALID_SERVER_RESPONSE</td>
     * <td> BITS does not support servers that consolidate duplicate or overlapping ranges. </td>
     * </tr>
     * <tr>
     * <td>BG_E_INVALID_RANGE</td>
     * <td>One of the ranges is outside the boundaries of the remote file.</td>
     * </tr>
     * <tr>
     * <td>BG_E_INSUFFICIENT_RANGE_SUPPORT</td>
     * <td>The server does not support ranges.</td>
     * </tr>
     * </table>
     *  
     * 
     * BITS guarantees that the version of a file (based on file size and date, not content) that it transfers will be consistent; however, it does not guarantee that a set of files will be consistent. For example, if BITS is in the middle of downloading the second of two files in the job at the time that the files are updated on the server, BITS restarts the download of the second file; however, the first file is not downloaded again.
     * 
     * By default, a user can add up to 500 ranges for a file. This limit does not apply to administrators or service accounts. To change the default, set the <b>MaxRangesPerFile</b> group policy.
     * 
     * <b>Prior to Windows Vista:  </b>There is no limit on the number of files that a user can add to a job.
     * 
     * For better performance on Windows BranchCache-enabled file transfers, it is recommended that you set the range length to at least 400 bytes.
     * @param {PWSTR} RemoteUrl Null-terminated string that contains the name of the file on the server. For information on specifying the remote name, see the <b>RemoteName</b> member and Remarks section of the <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_info">BG_FILE_INFO</a> structure. 
     * 
     * 
     * 
     * Starting with BITS 3.0, the SMB protocol is not supported for ranges.
     * 
     * <b>BITS 2.5 and 2.0:  </b>BITS supports the SMB protocol for ranges.
     * @param {PWSTR} LocalName Null-terminated string that contains the name of the file on the client. For information on specifying the local name, see the <b>LocalName</b> member and Remarks section of the <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_info">BG_FILE_INFO</a> structure.
     * @param {Integer} RangeCount Number of elements in <i>Ranges</i>.
     * @param {Pointer<BG_FILE_RANGE>} Ranges Array of one or more <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/ns-bits2_0-bg_file_range">BG_FILE_RANGE</a> structures that specify the ranges to download. Do not specify duplicate or overlapping ranges.
     * @returns {HRESULT} This method returns the following return values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can receive this error for one of the following reasons:
     * 
     * <ul>
     * <li>The <i>RangeCount</i> parameter is zero; you must specify one or more ranges.</li>
     * <li>The local or remote file name is not valid.</li>
     * <li>The remote file name uses an unsupported protocol.</li>
     * <li>The local file name was specified using a relative path.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot call this method for upload or upload-reply jobs; only call this method for download jobs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User does not have permission to write to the specified directory on the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the ranges is invalid. For example, InitialOffset is set to <b>BG_LENGTH_TO_EOF</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_OVERLAPPING_RANGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot specify duplicate or overlapping ranges. 
     * 
     * <div class="alert"><b>Note</b>  The ranges are sorted by the offset of the value, not the length.  If ranges are entered that have the same offset, but are in reverse order, then this error will be returned.  For example, if  100.5 and 100.0 are entered in that order, then you will not be able to add the file to the job. </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_TOO_MANY_RANGES_IN_FILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MaxRangesPerFile Group Policy setting determines how many ranges you can specify for a file. Adding these ranges exceeds the MaxRangesPerFile limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be <b>BG_JOB_STATE_CANCELLED</b> or <b>BG_JOB_STATE_ACKNOWLEDGED</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-addfilewithranges
     */
    AddFileWithRanges(RemoteUrl, LocalName, RangeCount, Ranges) {
        RemoteUrl := RemoteUrl is String ? StrPtr(RemoteUrl) : RemoteUrl
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName

        result := ComCall(44, this, "ptr", RemoteUrl, "ptr", LocalName, "uint", RangeCount, "ptr", Ranges, "HRESULT")
        return result
    }

    /**
     * Specifies the owner and ACL information to maintain when using SMB to download or upload a file.
     * @remarks
     * These flags apply to remote file names that specify the SMB protocol. BITS ignores the flags for HTTP transfers.
     * 
     * BITS propagates the file time stamps and  attributes (not extended attributes) for SMB files. 
     * 
     * BITS applies the owner and ACL information to the file at the time the file transfer is complete, not when it <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">creates</a> the temporary transfer file. BITS does not specify a security descriptor when it creates the temporary transfer file (the file inherits the ACL information from the destination directory). If the transferred data is sensitive, the application should specify an appropriate ACL on the destination directory to prevent unauthorized access.
     * 
     * To ensure the proper owner and ACL information is set on all files in the job, call this method after you create the job and before calling the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method. Otherwise, those files that transferred before the flags were set will not contain the appropriate owner and ACL information. 
     * 
     * This method is modeled after the XCopy DOS command.
     * 
     * The owner and ACL information is not maintained if you download to a FAT file system.
     * 
     * If the user does not have privileges on the local and remote computers to copy the owner or ACL information, BITS places the job in a transient error state and sets the error code to <b>E_ACCESSDENIED</b>.
     * @param {Integer} Flags Flags that identify the owner and ACL information to maintain when transferring a file using SMB. Subsequent calls to this method overwrite the previous flags. Specify 0 to remove the flags from the job. You can specify any combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_OWNER"></a><a id="bg_copy_file_owner"></a><dl>
     * <dt><b>BG_COPY_FILE_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the file's owner information is maintained. Otherwise, the user who calls the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">Complete</a> method owns the file.
     * 
     * You must have SeRestorePrivilege to set this flag. The administrators group contains the SeRestorePrivilege privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_GROUP"></a><a id="bg_copy_file_group"></a><dl>
     * <dt><b>BG_COPY_FILE_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the file's group information is maintained. Otherwise, BITS uses the job owner's primary group to assign the group information to the file.
     * 
     * You must have SeRestorePrivilege to set this flag. The administrators group contains the SeRestorePrivilege privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_DACL"></a><a id="bg_copy_file_dacl"></a><dl>
     * <dt><b>BG_COPY_FILE_DACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, BITS copies the explicit ACEs from the source file and inheritable  ACEs from the destination  folder.
     * Otherwise, BITS copies the inheritable ACEs from the destination  folder. If the destination folder does not contain inheritable ACEs, BITS uses the default DACL from the owner's account.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_SACL"></a><a id="bg_copy_file_sacl"></a><dl>
     * <dt><b>BG_COPY_FILE_SACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, BITS copies the explicit ACEs from the source file and inheritable  ACEs from the destination  folder.
     * Otherwise, BITS copies the inheritable ACEs from the destination  folder.
     * 
     * You must have SeSecurityPrivilege on both the local and remote computers to set this flag. The administrators group contains the SeSecurityPrivilege privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_ALL"></a><a id="bg_copy_file_all"></a><dl>
     * <dt><b>BG_COPY_FILE_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, BITS copies the owner and ACL information. This is the same as setting all the flags individually.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must call this method before the job transitions to the <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_state">BG_JOB_STATE_TRANSFERRED</a> state. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Flags</i> parameter contains a flag that is not in the list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-setfileaclflags
     */
    SetFileACLFlags(Flags) {
        result := ComCall(45, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Retrieves the flags that identify the owner and ACL information to maintain when transferring a file using SMB.
     * @returns {Integer} Flags that identify the owner and ACL information to maintain when transferring a file using SMB. <i>Flags</i> can contain any combination of the following flags. If no flags are set, <i>Flags</i> is zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_OWNER"></a><a id="bg_copy_file_owner"></a><dl>
     * <dt><b>BG_COPY_FILE_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the file's owner information is maintained. Otherwise, the job's owner becomes the  owner of the file. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_GROUP"></a><a id="bg_copy_file_group"></a><dl>
     * <dt><b>BG_COPY_FILE_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the file's group information is maintained. Otherwise, BITS uses the job owner's primary group to assign the group information to the file.   
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_DACL"></a><a id="bg_copy_file_dacl"></a><dl>
     * <dt><b>BG_COPY_FILE_DACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, BITS copies the explicit ACEs from the source file and inheritable  ACEs from the destination parent folder.
     * Otherwise, BITS copies the inheritable ACEs from the destination parent folder. If the parent folder does not contain inheritable ACEs, BITS uses the default DACL from the account. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_SACL"></a><a id="bg_copy_file_sacl"></a><dl>
     * <dt><b>BG_COPY_FILE_SACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, BITS copies the explicit ACEs from the source file and inheritable  ACEs from the destination parent folder.
     * Otherwise, BITS copies the inheritable ACEs from the destination parent folder.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_COPY_FILE_ALL"></a><a id="bg_copy_file_all"></a><dl>
     * <dt><b>BG_COPY_FILE_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, BITS copies the owner and ACL information. This is the same as setting all the flags individually.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-getfileaclflags
     */
    GetFileACLFlags() {
        result := ComCall(46, this, "uint*", &Flags := 0, "HRESULT")
        return Flags
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob.ahk

/**
 * Retrieve reply data from an upload-reply job, determine the progress of the reply data transfer to the client, request command line execution, and provide credentials for proxy and remote server authentication requests.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nn-bits1_5-ibackgroundcopyjob2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob2 extends IBackgroundCopyJob{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJob2
     * @type {Guid}
     */
    static IID => Guid("{54b50739-686f-45eb-9dff-d6a9a0faa9af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 35

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNotifyCmdLine", "GetNotifyCmdLine", "GetReplyProgress", "GetReplyData", "SetReplyFileName", "GetReplyFileName", "SetCredentials", "RemoveCredentials"]

    /**
     * Specifies a program to execute if the job enters the BG_JOB_STATE_ERROR or BG_JOB_STATE_TRANSFERRED state. BITS executes the program in the context of the user who called this method.
     * @remarks
     * BITS calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a> function to launch the program.
     * 
     * Your program should return an exit code of zero. If your program does not return an exit code of zero, BITS checks the state of the job. If the program did not cancel or complete the job, BITS calls the program again after the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setminimumretrydelay">minimum retry delay</a> specified for the job expires.
     * 
     * <b>BITS 1.5 and earlier:  </b>BITS calls the program only once. 
     * 
     * To execute a script, specify WScript.exe (include the full path to WScript.exe) in <i>pProgram</i>. The <i>pParameters</i> parameter should include WScript.exe, the script name, and any arguments.
     * 
     * If your program requires job related information, you must pass this information as arguments. Do not include environment variables, such as %system32%, in <i>pProgram</i> or <i>pParameters</i> — they are not expanded.
     * 
     * You should include the full path to the program. If any of the arguments in <i>pParameters</i> include a path that uses long file names, such as the module name, use quotes around the path.
     * 
     * If the program you want to execute uses the reply or download file, the program must call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method to make the files available to the client.
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyflags">IBackgroundCopyJob::SetNotifyFlags</a> method to specify when to execute the program. You can request command line execution only for job error or transferred events, not job modification events. Note that BITS still executes the command line even if you call the 
     * <b>SetNotifyCmdLine</b> method after the event occurs.
     * 
     * If the BITS job is in a service account context (ie, networkservice/localsystem/localservice), no form of command-line callback will execute. 
     * 
     * If you call both the <b>SetNotifyCmdLine</b> method 
     * and the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface">IBackgroundCopyJob::SetNotifyInterface</a> method, BITS will execute the command line only if the notification interface becomes invalid or the notification method that BITS calls returns a failure  code. For example, if the notification method that BITS calls returns a E_FAIL, BITS will execute the command line. However, if the notification method returns <b>S_OK</b>, BITS will not execute the command line. If the  notification method and command line execution request both fail, BITS will send the notification again after the minimum retry period expires. 
     * 
     * Note that calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-takeownership">IBackgroundCopyJob::TakeOwnership</a> method removes command line notification from the job.
     * @param {PWSTR} Program Null-terminated string that contains the program to execute. The <i>pProgram</i> parameter is limited to MAX_PATH characters, not including the null terminator. You should specify a full path to the program; the method will not use the search path to locate the program. 
     * 
     * 
     * 
     * 
     * To remove command line notification, set <i>pProgram</i> and <i>pParameters</i> to <b>NULL</b>. The method fails if <i>pProgram</i> is <b>NULL</b> and <i>pParameters</i> is non-<b>NULL</b>.
     * @param {PWSTR} Parameters Null-terminated string that contains the parameters of the program in <i>pProgram</i>. The first parameter must be the program in <i>pProgram</i> (use quotes if the path uses long file names). The <i>pParameters</i> parameter is limited to 4,000 characters, not including the null terminator. This parameter can be <b>NULL</b>.
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
     * Success.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pProgram</i> or <i>pParameters</i> string is too long.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline
     */
    SetNotifyCmdLine(Program, Parameters) {
        Program := Program is String ? StrPtr(Program) : Program
        Parameters := Parameters is String ? StrPtr(Parameters) : Parameters

        result := ComCall(35, this, "ptr", Program, "ptr", Parameters, "HRESULT")
        return result
    }

    /**
     * Retrieves the program to execute when the job enters the error or transferred state.
     * @remarks
     * The 
     * <b>GetNotifyCmdLine</b> method sets <i>pProgram</i> and <i>pParameters</i> to an empty string (L"") if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">IBackgroundCopyJob2::SetNotifyCmdLine</a> method has not been called.
     * @param {Pointer<PWSTR>} pProgram Null-terminated string that contains the program to execute when the job enters the error or transferred state. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pProgram</i> when done.
     * @param {Pointer<PWSTR>} pParameters Null-terminated string that contains the arguments of the program in <i>pProgram</i>. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pParameters</i> when done.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success or one of the standard COM <b>HRESULT</b> values on error.
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getnotifycmdline
     */
    GetNotifyCmdLine(pProgram, pParameters) {
        pProgramMarshal := pProgram is VarRef ? "ptr*" : "ptr"
        pParametersMarshal := pParameters is VarRef ? "ptr*" : "ptr"

        result := ComCall(36, this, pProgramMarshal, pProgram, pParametersMarshal, pParameters, "HRESULT")
        return result
    }

    /**
     * Retrieves progress information related to the transfer of the reply data from an upload-reply job.
     * @param {Pointer<BG_JOB_REPLY_PROGRESS>} pProgress Contains information that you use to calculate the percentage of the reply file transfer that is complete. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_job_reply_progress">BG_JOB_REPLY_PROGRESS</a>.
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
     * Progress information was successfully retrieved.
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
     * This method is not implemented for jobs of type <b>BG_JOB_TYPE_DOWNLOAD</b> or <b>BG_JOB_TYPE_UPLOAD</b>.
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
     * The <i>pProgress</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyprogress
     */
    GetReplyProgress(pProgress) {
        result := ComCall(37, this, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * Retrieves an in-memory copy of the reply data from the server application. Call this method only if the job's type is BG_JOB_TYPE_UPLOAD_REPLY and its state is BG_JOB_STATE_TRANSFERRED.
     * @remarks
     * The 
     * <b>GetReplyData</b> method lets you read the reply data before or after you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method. However, to read the reply data from the reply file, you must first call the 
     * <b>Complete</b> method; the file is not available to the client until you call the 
     * <b>Complete</b> method.
     * 
     * The 
     * <b>GetReplyData</b> method returns <b>BG_E_TOO_LARGE</b> if the reply data exceeds 1 MB (<i>pSize</i> contains the size of the reply data). To retrieve the reply if it exceeds 1 MB, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyfilename">IBackgroundCopyJob2::GetReplyFileName</a> method to retrieve the file name. Then, open the file and read the reply data directly.
     * @param {Pointer<Integer>} pLength Size, in bytes, of the reply data in <i>ppBuffer</i>.
     * @returns {Pointer<Integer>} Buffer to contain the reply data. The method sets <i>ppBuffer</i> to <b>NULL</b> if the server application did not return a reply. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppBuffer</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplydata
     */
    GetReplyData(pLength) {
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, "ptr*", &ppBuffer := 0, pLengthMarshal, pLength, "HRESULT")
        return ppBuffer
    }

    /**
     * Specifies the name of the file to contain the reply data from the server application. Call this method only if the job's type is BG_JOB_TYPE_UPLOAD_REPLY.
     * @remarks
     * BITS generates the file name if you do not call the 
     * <b>SetReplyFileName</b> method before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method for the first time.
     * 
     * If BITS generates the file name, the reply file is written to the same directory as the local upload file.
     * 
     * You can call the 
     * <b>SetReplyFileName</b> method anytime before BITS begins downloading the reply from the server application; the method fails if the download has begun.
     * 
     * The reply file is available to the client after calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method. To retrieve the reply data before calling the 
     * <b>Complete</b> method, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplydata">IBackgroundCopyJob2::GetReplyData</a> method.
     * 
     * The file is empty if the server application did not provide a reply.
     * @param {PWSTR} ReplyFileName Null-terminated string that contains the full path to the reply file. BITS generates the file name if <i>ReplyFileNamePathSpec</i> is <b>NULL</b> or an empty string. You cannot use wildcards in the path or file name, and directories in the path must exist. The path is limited to MAX_PATH, not including the null terminator. The user must have permissions to write to the directory. BITS does not support NTFS streams. Instead of using network drives, which are session specific, use UNC paths (for example, \\server\share\path\file). Do not include the \\? prefix in the path.
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
     * Successfully specified the name of the file to contain the reply data.
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
     * You cannot change the reply file name after BITS begins transferring the reply to the client. BITS is transferring the reply to the client if the state is <b>BG_JOB_STATE_TRANSFERRING</b> and the <b>BytesTotal</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_job_reply_progress">BG_JOB_REPLY_PROGRESS</a> structure is not <b>BG_SIZE_UNKNOWN</b>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reply file name is invalid or exceeds <b>MAX_PATH</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setreplyfilename
     */
    SetReplyFileName(ReplyFileName) {
        ReplyFileName := ReplyFileName is String ? StrPtr(ReplyFileName) : ReplyFileName

        result := ComCall(39, this, "ptr", ReplyFileName, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the file that contains the reply data from the server application. Call this method only if the job type is BG_JOB_TYPE_UPLOAD_REPLY.
     * @remarks
     * To specify a reply file name, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setreplyfilename">IBackgroundCopyJob2::SetReplyFileName</a> method. If you did not specify a name, the 
     * <b>GetReplyFileName</b> method returns the name that BITS generated for you. If you did not specify a name and you called this method before adding a file to the job, <i>pReplyFileName</i> is set to <b>NULL</b>.
     * 
     * You must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method before opening and reading the reply file; the reply file is not available to the client until you call the 
     * <b>Complete</b> method.
     * 
     * The file is empty if the server application did not provide a reply.
     * @returns {PWSTR} Null-terminated string that contains the full path to the reply file. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pReplyFileName</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyfilename
     */
    GetReplyFileName() {
        result := ComCall(40, this, "ptr*", &pReplyFileName := 0, "HRESULT")
        return pReplyFileName
    }

    /**
     * Specifies the credentials to use for a proxy or remote server user authentication request.
     * @remarks
     * BITS provides the credentials to a proxy or server in response to a request for user authentication. Set the credentials before the initial call to <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">Resume</a>. 
     * 
     * You must call this method for each target and scheme pair that you want to provide. For example, if you want to specify proxy credentials for both Basic and Digest authentication, you would call this method once to specify the Basic credentials and a second time to specify the Digest credentials.
     * 
     * If the job currently contains credentials with the same target and scheme pair, the existing credentials are replaced with the new credentials. The credentials persist for the life of the job. To remove the credentials from the job, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-removecredentials">IBackgroundCopyJob2::RemoveCredentials</a> method.
     * 
     * If you know the schemes the proxy or server will request, you can provide only those credentials. Otherwise, provide credentials for all schemes. 
     * 
     * The job enters the <b>BG_JOB_STATE_ERROR</b> state if you do not provide the credentials requested by the proxy or server, or the proxy or server cannot authenticate the credentials. Check the error code to determine if the authentication failed at the server (<b>BG_E_HTTP_ERROR_401</b>) or proxy (<b>BG_E_HTTP_ERROR_407</b>). To retrieve the error code, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-geterror">IBackgroundCopyJob::GetError</a> method to retrieve an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyerror">IBackgroundCopyError</a> interface pointer. Then, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyerror-geterror">IBackgroundCopyError::GetError</a> method to retrieve the error code. After you determine where the authentication failed (proxy or server), specify new credentials to use for the proxy or server and call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method to resume the job. Because you cannot determine which scheme failed, specify credentials for all schemes before calling the 
     * <b>Resume</b> method.
     * 
     * There is no method to retrieve credentials that you have set.
     * 
     * You must call this method in the context of the job's owner.
     * 
     * Calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-takeownership">IBackgroundCopyJob::TakeOwnership</a> method removes the credentials from the job.
     * 
     * To specify implicit credentials (the logged on user's credentials), set the scheme to NTLM and the user name and password to <b>NULL</b>. If you specify implicit credentials for a proxy, BITS will also use the implicit credentials for server authentication unless you specify explicit server credentials. 
     * 
     * <div class="alert"><b>Note</b>  BITS ignores credentials for <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_info">remote names</a> that specify an SMB path.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  BITS does not authenticate the server or encrypt the channel. Use HTTPS if this is an issue for your application.</div>
     * <div> </div>
     * @param {Pointer<BG_AUTH_CREDENTIALS>} credentials Identifies the target (proxy or server), authentication scheme, and the user's credentials to use for user authentication. For details, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_auth_credentials">BG_AUTH_CREDENTIALS</a> structure.
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
     * <dt><b>BG_E_INVALID_AUTH_TARGET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unrecognized target enumeration value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_AUTH_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unrecognized scheme enumeration value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_USERNAME_TOO_LARGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name is too long. For the limit, see the <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_PASSWORD_TOO_LARGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The password is too long. For the limit, see the <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure.
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
     * The UserName and Password members of the <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure cannot be <b>NULL</b> if you specify the Basic or Digest scheme.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setcredentials
     */
    SetCredentials(credentials) {
        result := ComCall(41, this, "ptr", credentials, "HRESULT")
        return result
    }

    /**
     * Removes credentials from use. The credentials must match an existing target and scheme pair that you specified using the IBackgroundCopyJob2::SetCredentials method. There is no method to retrieve the credentials you have set.
     * @param {Integer} Target Identifies whether to use the credentials for proxy or server authentication.
     * @param {Integer} Scheme Identifies the authentication scheme to use (basic or one of several challenge-response schemes). For details, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ne-bits1_5-bg_auth_scheme">BG_AUTH_SCHEME</a> enumeration.
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
     * No credentials have been set using the given <i>Target</i> and <i>Scheme</i> pair.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-removecredentials
     */
    RemoveCredentials(Target, Scheme) {
        result := ComCall(42, this, "int", Target, "int", Scheme, "HRESULT")
        return result
    }
}

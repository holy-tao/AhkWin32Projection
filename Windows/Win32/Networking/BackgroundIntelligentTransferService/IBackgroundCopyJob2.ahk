#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob.ahk

/**
 * Retrieve reply data from an upload-reply job, determine the progress of the reply data transfer to the client, request command line execution, and provide credentials for proxy and remote server authentication requests.
 * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nn-bits1_5-ibackgroundcopyjob2
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
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline
     */
    SetNotifyCmdLine(Program, Parameters) {
        Program := Program is String ? StrPtr(Program) : Program
        Parameters := Parameters is String ? StrPtr(Parameters) : Parameters

        result := ComCall(35, this, "ptr", Program, "ptr", Parameters, "HRESULT")
        return result
    }

    /**
     * Retrieves the program to execute when the job enters the error or transferred state.
     * @param {Pointer<PWSTR>} pProgram Null-terminated string that contains the program to execute when the job enters the error or transferred state. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pProgram</i> when done.
     * @param {Pointer<PWSTR>} pParameters Null-terminated string that contains the arguments of the program in <i>pProgram</i>. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pParameters</i> when done.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success or one of the standard COM <b>HRESULT</b> values on error.
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-getnotifycmdline
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
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyprogress
     */
    GetReplyProgress(pProgress) {
        result := ComCall(37, this, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * Retrieves an in-memory copy of the reply data from the server application. Call this method only if the job's type is BG_JOB_TYPE_UPLOAD_REPLY and its state is BG_JOB_STATE_TRANSFERRED.
     * @param {Pointer<Integer>} pLength Size, in bytes, of the reply data in <i>ppBuffer</i>.
     * @returns {Pointer<Integer>} Buffer to contain the reply data. The method sets <i>ppBuffer</i> to <b>NULL</b> if the server application did not return a reply. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppBuffer</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplydata
     */
    GetReplyData(pLength) {
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, "ptr*", &ppBuffer := 0, pLengthMarshal, pLength, "HRESULT")
        return ppBuffer
    }

    /**
     * Specifies the name of the file to contain the reply data from the server application. Call this method only if the job's type is BG_JOB_TYPE_UPLOAD_REPLY.
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
     * <a href="/windows/desktop/api/bits1_5/ns-bits1_5-bg_job_reply_progress">BG_JOB_REPLY_PROGRESS</a> structure is not <b>BG_SIZE_UNKNOWN</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-setreplyfilename
     */
    SetReplyFileName(ReplyFileName) {
        ReplyFileName := ReplyFileName is String ? StrPtr(ReplyFileName) : ReplyFileName

        result := ComCall(39, this, "ptr", ReplyFileName, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the file that contains the reply data from the server application. Call this method only if the job type is BG_JOB_TYPE_UPLOAD_REPLY.
     * @returns {PWSTR} Null-terminated string that contains the full path to the reply file. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pReplyFileName</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyfilename
     */
    GetReplyFileName() {
        result := ComCall(40, this, "ptr*", &pReplyFileName := 0, "HRESULT")
        return pReplyFileName
    }

    /**
     * Specifies the credentials to use for a proxy or remote server user authentication request.
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
     * The user name is too long. For the limit, see the <a href="/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure.
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
     * The password is too long. For the limit, see the <a href="/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure.
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
     * The UserName and Password members of the <a href="/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure cannot be <b>NULL</b> if you specify the Basic or Digest scheme.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-setcredentials
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
     * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nf-bits1_5-ibackgroundcopyjob2-removecredentials
     */
    RemoveCredentials(Target, Scheme) {
        result := ComCall(42, this, "int", Target, "int", Scheme, "HRESULT")
        return result
    }
}

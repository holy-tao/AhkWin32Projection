#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that work with client applications to present a user environment that provides safe download and exchange of files through email and messaging attachments.
 * @remarks
 * This interface assumes the following:
 *                 
 * 
 * <ul>
 * <li>The client has policies or settings  for attachment support and behavior.</li>
 * <li>The client interacts with the user.</li>
 * </ul>
 * The IID for this interface is <b>IID_IAttachmentExecute</b>.
 * 
 * Here is an example of how an email client might use <b>IAttachmentExecute</b>.
 * 
 * 
 * 
 * ```
 * 
 * // CClientAttachmentInfo, defined by the client, implements all the
 * // necessary client functionality concerning attachments. 
 * class CClientAttachmentInfo;  
 * 
 * // Creates an instance of IAttachmentExecute
 * HRESULT CreateAttachmentServices(IAttachmentExecute **ppae)
 * {
 *     // Assume that CoInitialize has already been called for this thread.
 *     HRESULT hr = CoCreateInstance(CLSID_AttachmentServices, 
 *                                   NULL, 
 *                                   CLSCTX_INPROC_SERVER, 
 *                                   IID_IAttachmentExecute, 
 *                                   (void**)&pAttachExec);
 * 
 *     if (SUCCEEDED(hr))
 *     {
 *         // Set the client's GUID.
 * 
 *         // UUID_ClientID should be created using uuidgen.exe and 
 *         // defined internally.
 *         (*ppae)->SetClientGuid(UUID_ClientID);
 *         
 *         // You also could call SetClientTitle at this point, but it is
 *         // not required.
 *     }
 *     return hr;
 * }
 * 
 * BOOL IsAttachmentBlocked(CClientAttachmentInfo *pinfo)
 * {
 *     // Assume that a client function has copied the file from the mail store 
 *     // into a temporary file.
 *     PWSTR pszFileName;
 * 
 *     // GetFileName is a method in this class for which we do not provide
 *     // an implementation here.
 *     HRESULT hr = pinfo->GetFileName(&pszFileName);
 *     if (SUCCEEDED(hr))
 *     {
 *         IAttachmentExecute *pExecute;
 * 
 *         hr = CreateAttachmentServices(&pExecute);
 *         if (SUCCEEDED(hr))
 *         {
 *             hr = pExecute->SetFileName(pszFileName);
 * 
 *             // Do not call SetLocalPath since we do not have the local path yet.
 *             // Do not call SetSource since email sources are not verifiable.
 *             // Do not call SetReferrer since we do not have a better zone 
 *             // than the default (Restricted sites).
 * 
 *             // Check for a policy regarding the file.
 *             if (SUCCEEDED(hr))
 *             {
 *                 hr = pExecute->CheckPolicy();
 *             }
 *             pExecute->Release();
 *         }
 *         LocalFree(pszFileName);
 *     }
 *     return FAILED(hr);
 * }
 *     
 * HRESULT OnDoubleClickAttachment(HWND hwnd, CClientAttachmentInfo *pinfo)
 * {
 *     // Assume that a client function has copied the file from the mail store 
 *     // into a temporary file.
 *     PWSTR pszTempFile;
 * 
 *     // CopyToTempFile is a method in this class for which we do not provide
 *     // an implementation here.
 *     HRESULT hr = pinfo->CopyToTempFile(&pszTempFile);
 *     if (SUCCEEDED(hr))
 *     {
 *         IAttachmentExecute *pExecute;
 * 
 *         hr = CreateAttachmentServices(&pExecute);
 *         if (SUCCEEDED(hr))
 *         {
 *             hr = pExecute->SetLocalPath(pszTempFile);
 * 
 *             // Do not call SetFileName since we already have the local path.
 *             // Do not call SetSource since email sources are not verifiable.
 *             // Do not call SetReferrer since we do not have a better zone 
 *             // than the default (Restricted sites).
 * 
 *             if (SUCCEEDED(hr))
 *             {
 *                 hr = pExecute->Execute(hwnd, NULL, NULL);
 *             }
 *             pExecute->Release();
 *         }
 *         LocalFree(pszTempFile);
 *     }
 *     return hr;
 * }
 * 
 * HRESULT OnSaveAttachment(HWND hwnd, CClientAttachmentInfo *pinfo)
 * {
 *     // Assume that a client function has copied the file from the mail store 
 *     // into a location selected by the user.
 *     PWSTR pszUserFile;
 * 
 *     // CopyToUserFile is a method in this class for which we do not provide
 *     // an implementation here.
 *     HRESULT hr = pinfo->CopyToUserFile(hwnd, &pszUserFile);
 *     if (SUCCEEDED(hr))
 *     {
 *         IAttachmentExecute *pExecute;
 * 
 *         hr = CreateAttachmentServices(&pExecute);
 *         if (SUCCEEDED(hr))
 *         {
 *             hr = pExecute->SetLocalPath(pszTempFile);
 * 
 *             // Do not call SetFileName since we have the local path.
 *             // Do not call SetSource since email sources are not verifiable.
 *             // Do not call SetReferrer since we do not have a better zone 
 *             // than the default (Restricted sites).
 * 
 *             if (SUCCEEDED(hr))
 *             {
 *                 hr = pExecute->Save();
 *             }
 *             pExecute->Release();
 *         }
 *         LocalFree(pszUserFile);
 *     }
 *     return hr;
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iattachmentexecute
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAttachmentExecute extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAttachmentExecute
     * @type {Guid}
     */
    static IID => Guid("{73db1241-1e85-4581-8e4f-a81e1d0f8c57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClientTitle", "SetClientGuid", "SetLocalPath", "SetFileName", "SetSource", "SetReferrer", "CheckPolicy", "Prompt", "Save", "Execute", "SaveWithUI", "ClearClientState"]

    /**
     * Specifies and stores the title of the prompt window.
     * @remarks
     * If <b>IAttachmentExecute::SetClientTitle</b> is not called, a default title of <b>File Download</b> is used in the prompt's title bar.
     * @param {PWSTR} pszTitle Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the title text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setclienttitle
     */
    SetClientTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(3, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * Specifies and stores the GUID for the client.
     * @remarks
     * A user can choose not to display certain prompts. That information is stored in the registry on a per-client basis, indexed by <i>guid</i>.
     * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
     * 
     * The GUID that represents the client.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setclientguid
     */
    SetClientGuid(guid) {
        result := ComCall(4, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * Sets and stores the path to the file.
     * @remarks
     * Calling <b>IAttachmentExecute::SetLocalPath</b> is required.
     * 
     * When the attachment is approved for execution by the user (either through policy or prompt), the path specified by this method is used. If only <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setfilename">IAttachmentExecute::SetFileName</a> was called before calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-checkpolicy">IAttachmentExecute::CheckPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-prompt">IAttachmentExecute::Prompt</a>, that trust could be revoked if the assumed local path was different from that set by <b>IAttachmentExecute::SetLocalPath</b>. Trust can be granted by various Zone APIs, antivirus services, file type information, policies as well as other system trust providers.
     * 
     * <b>IAttachmentExecute::SetLocalPath</b> must be called before calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-execute">IAttachmentExecute::Execute</a>.
     * @param {PWSTR} pszLocalPath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the local path where the attachment file is to be stored.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath
     */
    SetLocalPath(pszLocalPath) {
        pszLocalPath := pszLocalPath is String ? StrPtr(pszLocalPath) : pszLocalPath

        result := ComCall(5, this, "ptr", pszLocalPath, "HRESULT")
        return result
    }

    /**
     * Specifies and stores the proposed name of the file.
     * @remarks
     * No path information should be included at <i>pszFileName</i>, just the file's name.
     * 
     * <b>IAttachmentExecute::SetFileName</b> can be used by the calling application to check the validity of the file name before copying the file locally. The file name is checked for name collisions against other files stored at the local path location.
     * 
     * <b>IAttachmentExecute::SetFileName</b> is optional.
     * @param {PWSTR} pszFileName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the file name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code, including the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszFileName</i> value is is set to <b>NULL</b>, points to an empty string, or points to a file name longer than <b>MAX_PATH</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file name cannot be stored.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setfilename
     */
    SetFileName(pszFileName) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(6, this, "ptr", pszFileName, "HRESULT")
        return result
    }

    /**
     * Sets an alternate path or URL for the source of a file transfer.
     * @remarks
     * The path or URL declared here is used as the primary zone determinant. The policy under which the attachment is handled is based partially on the perceived zone. If <i>pszSource</i> is <b>NULL</b>, the default is Restricted Zone.
     * 
     * Calling <b>IAttachmentExecute::SetSource</b> is optional.
     * 
     * The path or URL declared here can also be used in the prompt UI as the <b>From</b> field.
     * 
     * The path or URL declared here can also be sent to handlers that can process URLs.
     * @param {PWSTR} pszSource Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string containing the path or URL to use as the source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setsource
     */
    SetSource(pszSource) {
        pszSource := pszSource is String ? StrPtr(pszSource) : pszSource

        result := ComCall(7, this, "ptr", pszSource, "HRESULT")
        return result
    }

    /**
     * Sets the security zone associated with the attachment file based on the referring file.
     * @remarks
     * <b>IAttachmentExecute::SetReferrer</b> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setsource">IAttachmentExecute::SetSource</a> have similar functionality. If both are set, the least-trusted zone of the two is used.
     * 
     * <b>IAttachmentExecute::SetReferrer</b> is used by container files to indicate indirect inheritance and avoid zone elevation. It can also be used with shortcut files to limit elevation based on parameters.
     * 
     * Calling <b>IAttachmentExecute::SetReferrer</b> is optional.
     * 
     * <b>IAttachmentExecute::SetReferrer</b> is only used to determine the security zone and its associated policies.
     * @param {PWSTR} pszReferrer Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string containing the path of the referring file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setreferrer
     */
    SetReferrer(pszReferrer) {
        pszReferrer := pszReferrer is String ? StrPtr(pszReferrer) : pszReferrer

        result := ComCall(8, this, "ptr", pszReferrer, "HRESULT")
        return result
    }

    /**
     * Provides a Boolean test that can be used to make decisions based on the attachment's execution policy.
     * @remarks
     * <b>IAttachmentExecute::CheckPolicy</b> examines a set of properties known collectively as <i>evidence</i>. Anything used to determine trust level is considered evidence. These properties are set using the following methods.
     * 
     * 				
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setfilename">IAttachmentExecute::SetFileName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath">IAttachmentExecute::SetLocalPath</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setreferrer">IAttachmentExecute::SetReferrer</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setsource">IAttachmentExecute::SetSource</a>
     * </li>
     * </ul>
     * The information returned by <b>IAttachmentExecute::CheckPolicy</b> enables an application to modify its UI appropriately for the situation.
     * 			
     * 
     * <b>IAttachmentExecute::CheckPolicy</b> requires the application first to call either <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setfilename">IAttachmentExecute::SetFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath">IAttachmentExecute::SetLocalPath</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     *                     
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>Enable</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>Prompt</td>
     * </tr>
     * <tr>
     * <td>Any other failure code</td>
     * <td>Disable</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-checkpolicy
     */
    CheckPolicy() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Presents a prompt UI to the user.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setfilename">IAttachmentExecute::SetFileName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath">IAttachmentExecute::SetLocalPath</a> before calling <b>IAttachmentExecute::Prompt</b>.
     * 
     * <b>IAttachmentExecute::Prompt</b> can be called by the application to force UI presentation before the file has been copied to disk.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the parent window.
     * @param {Integer} prompt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-attachment_prompt">ATTACHMENT_PROMPT</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-attachment_prompt">ATTACHMENT_PROMPT</a> enumeration that indicates what type of prompt UI to display to the user.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-attachment_action">ATTACHMENT_ACTION</a>*</b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-attachment_action">ATTACHMENT_ACTION</a> enumeration that indicates the action to be performed upon user confirmation.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-prompt
     */
    Prompt(hwnd, prompt) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "int", prompt, "int*", &paction := 0, "HRESULT")
        return paction
    }

    /**
     * Saves the attachment.
     * @remarks
     * Before calling <b>IAttachmentExecute::Save</b>, you must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath">IAttachmentExecute::SetLocalPath</a> with a valid path. The file should be copied to that local path before <b>IAttachmentExecute::Save</b> is called.
     * 
     * <b>IAttachmentExecute::Save</b> should always be called if the local path declared in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath">IAttachmentExecute::SetLocalPath</a> is not the path of a temporary directory.
     * 
     * <b>IAttachmentExecute::Save</b> may run virus scanners or other trust services to validate the file before saving it. Note that these services can delete or alter the file.
     * 
     * <b>IAttachmentExecute::Save</b> may attach <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-checkpolicy">evidence</a> to the local path in its NTFS alternate data stream (ADS).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-save
     */
    Save() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Executes an action on an attachment.
     * @remarks
     * Before calling <b>IAttachmentExecute::Execute</b>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath">IAttachmentExecute::SetLocalPath</a> must be called with a valid local path and the file must be copied to that location.
     * 
     * If a prompt is indicated, <b>IAttachmentExecute::Execute</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-prompt">IAttachmentExecute::Prompt</a> using the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-attachment_action">ATTACHMENT_ACTION_EXEC</a> value.
     * 
     * <b>IAttachmentExecute::Execute</b> may run virus scanners or other trust services to validate the file before executing it. Note that these services can delete or alter the file.
     * 
     * <b>IAttachmentExecute::Execute</b> may attach <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-checkpolicy">evidence</a> to the local path in its NTFS alternate data stream (ADS).
     * 
     * If <i>phProcess</i> is not <b>NULL</b>, <b>IAttachmentExecute::Execute</b> operates as a synchronous process and returns an <b>HPROCESS</b>, if available. If <i>phProcess</i> is <b>NULL</b>, <b>IAttachmentExecute::Execute</b> operates as an asynchronous process. This implies that the calling application has a message pump and a long-lived window.
     * 
     * If the handle pointed to by <i>phProcess</i> is non-<b>NULL</b> when the method returns, the calling application is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> to free the handle when it is no longer needed.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the parent window.
     * @param {PWSTR} pszVerb Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated string that contains a verb specifying the action to be performed on the file. See the <i>lpOperation</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecutea">ShellExecute</a> for valid strings. This value can be <b>NULL</b>.
     * @returns {HANDLE} Type: <b>HANDLE*</b>
     * 
     * A pointer to a handle to the source process, used for synchronous operation. This value can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-execute
     */
    Execute(hwnd, pszVerb) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszVerb := pszVerb is String ? StrPtr(pszVerb) : pszVerb

        phProcess := HANDLE()
        result := ComCall(12, this, "ptr", hwnd, "ptr", pszVerb, "ptr", phProcess, "HRESULT")
        return phProcess
    }

    /**
     * Presents the user with explanatory error UI if the save action fails.
     * @remarks
     * <b>IAttachmentExecute::SaveWithUI</b> does not call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-prompt">IAttachmentExecute::Prompt</a>.
     * 
     * Before calling <b>IAttachmentExecute::SaveWithUI</b>, you must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath">IAttachmentExecute::SetLocalPath</a> with a valid path. The file is copied to that local path before <b>IAttachmentExecute::SaveWithUI</b> is called.
     * 
     * <b>IAttachmentExecute::SaveWithUI</b> may run virus scanners or other trust services to validate the file before saving it. Note that these services can delete or alter the file.
     * 
     * <b>IAttachmentExecute::SaveWithUI</b> may attach <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-checkpolicy">evidence</a> to the local path in its NTFS alternate data stream (ADS).
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the parent window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-savewithui
     */
    SaveWithUI(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(13, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Removes any stored state that is based on the client's GUID. An example might be a setting based on a checked box that indicates a prompt should not be displayed again for a particular file type.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setclientguid">IAttachmentExecute::SetClientGuid</a> must be called before using <b>IAttachmentExecute::ClearClientState</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-clearclientstate
     */
    ClearClientState() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}

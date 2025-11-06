#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that work with client applications to present a user environment that provides safe download and exchange of files through email and messaging attachments.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iattachmentexecute
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
     * 
     * @param {PWSTR} pszTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setclienttitle
     */
    SetClientTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(3, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setclientguid
     */
    SetClientGuid(guid) {
        result := ComCall(4, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLocalPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setlocalpath
     */
    SetLocalPath(pszLocalPath) {
        pszLocalPath := pszLocalPath is String ? StrPtr(pszLocalPath) : pszLocalPath

        result := ComCall(5, this, "ptr", pszLocalPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setfilename
     */
    SetFileName(pszFileName) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(6, this, "ptr", pszFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setsource
     */
    SetSource(pszSource) {
        pszSource := pszSource is String ? StrPtr(pszSource) : pszSource

        result := ComCall(7, this, "ptr", pszSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszReferrer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-setreferrer
     */
    SetReferrer(pszReferrer) {
        pszReferrer := pszReferrer is String ? StrPtr(pszReferrer) : pszReferrer

        result := ComCall(8, this, "ptr", pszReferrer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-checkpolicy
     */
    CheckPolicy() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} prompt 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-prompt
     */
    Prompt(hwnd, prompt) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "int", prompt, "int*", &paction := 0, "HRESULT")
        return paction
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-save
     */
    Save() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {PWSTR} pszVerb 
     * @returns {HANDLE} 
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
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-savewithui
     */
    SaveWithUI(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(13, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iattachmentexecute-clearclientstate
     */
    ClearClientState() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}

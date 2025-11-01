#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide a rich notification system used by callers of IFileOperation to monitor the details of the operations they are performing through that interface.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Applications must implement <b>IFileOperationProgressSink</b> themselves. Windows does not provide a default implementation.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * <b>IFileOperationProgressSink</b> are essentially handlers for particular events. They are used normally to display information about the specific action being processed at that time, such as the name of a file, source and destination, and the new name of the item at the destination. Post methods receive the HRESULT of each part of the operation so that the caller can determine specifically where the process fails if it does. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> method parameter values are passed to the appropriate <b>IFileOperationProgressSink</b> methods so that they have access to the same information.
  * 
  * To attach an implementation of <b>IFileOperationProgressSink</b> to a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a>, you have two options:
  * 
  *                 
  * 
  * <ul>
  * <li>To be advised of all operations performed by the call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">IFileOperation::Advise</a> method.</li>
  * <li>To be notified only of progress for specific operations, pass <b>IFileOperationProgressSink</b> to one or more of these individual <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> methods:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-copyitem">CopyItem</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitem">DeleteItem</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-moveitem">MoveItem</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-newitem">NewItem</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-renameitem">RenameItem</a>
  * </li>
  * </ul>
  * </li>
  * </ul>
  * If you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">Advise</a> there is no need to pass <b>IFileOperationProgressSink</b> to specific <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> methods as that results in redundant calls to the <b>IFileOperationProgressSink</b> methods and duplicate notifications.
  * 
  * If you choose to pass <b>IFileOperationProgressSink</b> only to select methods, the same instance of <b>IFileOperationProgressSink</b> can be used for them all.
  * 
  * <h3><a id="Example"></a><a id="example"></a><a id="EXAMPLE"></a>Example</h3>
  * The following example passes <b>IFileOperationProgressSink</b> to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">Advise</a> method.
  * 
  *                 
  * 
  * 
  * ```
  * IFileOperation *pfo;
  * CoCreateInstance(CLSID_FileOperation, NULL, CLSCTX_ALL, IID_IFileOperation, (void **)&m_pFO)
  * HRESULT hr = SHCreateFileOperation(hwnd, 0, IID_PPV_ARGS(&pfo));
  * if (SUCCEEDED(hr))
  * {
  *     // Advise to get notifications
  *     DWORD dwCookie;
  *     hr = pfo->Advise(SAFECAST(this, IFileOperationProgressSink*), &dwCookie);
  * }
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileOperationProgressSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOperationProgressSink
     * @type {Guid}
     */
    static IID => Guid("{04b0f1a7-9490-44bc-96e1-4296a31252e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartOperations", "FinishOperations", "PreRenameItem", "PostRenameItem", "PreMoveItem", "PostMoveItem", "PreCopyItem", "PostCopyItem", "PreDeleteItem", "PostDeleteItem", "PreNewItem", "PostNewItem", "UpdateProgress", "ResetTimer", "PauseTimer", "ResumeTimer"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-startoperations
     */
    StartOperations() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-finishoperations
     */
    FinishOperations(hrResult) {
        result := ComCall(4, this, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @param {PWSTR} pszNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-prerenameitem
     */
    PreRenameItem(dwFlags, psiItem, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(5, this, "uint", dwFlags, "ptr", psiItem, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @param {PWSTR} pszNewName 
     * @param {HRESULT} hrRename 
     * @param {IShellItem} psiNewlyCreated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postrenameitem
     */
    PostRenameItem(dwFlags, psiItem, pszNewName, hrRename, psiNewlyCreated) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(6, this, "uint", dwFlags, "ptr", psiItem, "ptr", pszNewName, "int", hrRename, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-premoveitem
     */
    PreMoveItem(dwFlags, psiItem, psiDestinationFolder, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(7, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszNewName 
     * @param {HRESULT} hrMove 
     * @param {IShellItem} psiNewlyCreated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postmoveitem
     */
    PostMoveItem(dwFlags, psiItem, psiDestinationFolder, pszNewName, hrMove, psiNewlyCreated) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(8, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "int", hrMove, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-precopyitem
     */
    PreCopyItem(dwFlags, psiItem, psiDestinationFolder, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(9, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszNewName 
     * @param {HRESULT} hrCopy 
     * @param {IShellItem} psiNewlyCreated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postcopyitem
     */
    PostCopyItem(dwFlags, psiItem, psiDestinationFolder, pszNewName, hrCopy, psiNewlyCreated) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(10, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "int", hrCopy, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-predeleteitem
     */
    PreDeleteItem(dwFlags, psiItem) {
        result := ComCall(11, this, "uint", dwFlags, "ptr", psiItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiItem 
     * @param {HRESULT} hrDelete 
     * @param {IShellItem} psiNewlyCreated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postdeleteitem
     */
    PostDeleteItem(dwFlags, psiItem, hrDelete, psiNewlyCreated) {
        result := ComCall(12, this, "uint", dwFlags, "ptr", psiItem, "int", hrDelete, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-prenewitem
     */
    PreNewItem(dwFlags, psiDestinationFolder, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(13, this, "uint", dwFlags, "ptr", psiDestinationFolder, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszNewName 
     * @param {PWSTR} pszTemplateName 
     * @param {Integer} dwFileAttributes 
     * @param {HRESULT} hrNew 
     * @param {IShellItem} psiNewItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postnewitem
     */
    PostNewItem(dwFlags, psiDestinationFolder, pszNewName, pszTemplateName, dwFileAttributes, hrNew, psiNewItem) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName
        pszTemplateName := pszTemplateName is String ? StrPtr(pszTemplateName) : pszTemplateName

        result := ComCall(14, this, "uint", dwFlags, "ptr", psiDestinationFolder, "ptr", pszNewName, "ptr", pszTemplateName, "uint", dwFileAttributes, "int", hrNew, "ptr", psiNewItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iWorkTotal 
     * @param {Integer} iWorkSoFar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-updateprogress
     */
    UpdateProgress(iWorkTotal, iWorkSoFar) {
        result := ComCall(15, this, "uint", iWorkTotal, "uint", iWorkSoFar, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-resettimer
     */
    ResetTimer() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-pausetimer
     */
    PauseTimer() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-resumetimer
     */
    ResumeTimer() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}

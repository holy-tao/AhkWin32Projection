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
     * Performs caller-implemented actions before any specific file operations are performed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-startoperations
     */
    StartOperations() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions after the last operation performed by the call to IFileOperation is complete.
     * @param {HRESULT} hrResult Type: <b>HRESULT</b>
     * 
     * The return value of the final operation. Note that this is not the HRESULT returned by one of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> methods, which simply queue the operations. Instead, this is the result of the actual operation, such as copy, delete, or move.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Not used.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-finishoperations
     */
    FinishOperations(hrResult) {
        result := ComCall(4, this, "int", hrResult, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions before the rename process for each item begins.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that control the operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the item to be renamed.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname">display name</a> of the item. This is a null-terminated, Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, the rename operation and all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-prerenameitem
     */
    PreRenameItem(dwFlags, psiItem, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(5, this, "uint", dwFlags, "ptr", psiItem, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions after the rename process for each item is complete.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that were used during the rename operation. Some values can be set or changed during the rename operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the item before it was renamed.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname">display name</a> of the item. This is a null-terminated, Unicode string. Note that this might not be the name that you asked for, given collisions and other naming rules.
     * @param {HRESULT} hrRename Type: <b>HRESULT</b>
     * 
     * The return value of the rename operation. Note that this is not the HRESULT returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-renameitem">RenameItem</a>, which simply queues the rename operation. Instead, this is the result of the actual rename operation.
     * @param {IShellItem} psiNewlyCreated Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the item with its new name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postrenameitem
     */
    PostRenameItem(dwFlags, psiItem, pszNewName, hrRename, psiNewlyCreated) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(6, this, "uint", dwFlags, "ptr", psiItem, "ptr", pszNewName, "int", hrRename, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions before the move process for each item begins.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that control the operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the item to be moved.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to contain the moved item.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a new name for the item in its new location. This is a null-terminated Unicode string and can be <b>NULL</b>. If <b>NULL</b>, the name of the destination item is the same as the source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, the move operation and all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-premoveitem
     */
    PreMoveItem(dwFlags, psiItem, psiDestinationFolder, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(7, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions after the move process for each item is complete.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that were used during the move operation. Some values can be set or changed during the move operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the source item.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder that contains the moved item.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the name that was given to the item after it was moved. This is a null-terminated Unicode string. Note that this might not be the name that you asked for, given collisions and other naming rules.
     * @param {HRESULT} hrMove Type: <b>HRESULT</b>
     * 
     * The return value of the move operation. Note that this is not the HRESULT returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-moveitem">MoveItem</a>, which simply queues the move operation. Instead, this is the result of the actual move.
     * @param {IShellItem} psiNewlyCreated Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the moved item in its new location.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postmoveitem
     */
    PostMoveItem(dwFlags, psiItem, psiDestinationFolder, pszNewName, hrMove, psiNewlyCreated) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(8, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "int", hrMove, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions before the copy process for each item begins.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that control the operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the source item.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to contain the copy of the item.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a new name for the item after it has been copied. This is a null-terminated Unicode string and can be <b>NULL</b>. If <b>NULL</b>, the name of the destination item is the same as the source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, the copy operation and all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-precopyitem
     */
    PreCopyItem(dwFlags, psiItem, psiDestinationFolder, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(9, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions after the copy process for each item is complete.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that were used during the copy operation. Some values can be set or changed during the copy operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the source item.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to which the item was copied.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the new name that was given to the item after it was copied. This is a null-terminated Unicode string. Note that this might not be the name that you asked for, given collisions and other naming rules.
     * @param {HRESULT} hrCopy Type: <b>HRESULT</b>
     * 
     * The return value of the copy operation. Note that this is not the HRESULT returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-copyitem">CopyItem</a>, which simply queues the copy operation. Instead, this is the result of the actual copy.
     * @param {IShellItem} psiNewlyCreated Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the new copy of the item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postcopyitem
     */
    PostCopyItem(dwFlags, psiItem, psiDestinationFolder, pszNewName, hrCopy, psiNewlyCreated) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(10, this, "uint", dwFlags, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "int", hrCopy, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions before the delete process for each item begins.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that control the operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the item to be deleted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, the delete operation and all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-predeleteitem
     */
    PreDeleteItem(dwFlags, psiItem) {
        result := ComCall(11, this, "uint", dwFlags, "ptr", psiItem, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions after the delete process for each item is complete.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that were used during the delete operation. Some values can be set or changed during the delete operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the item that was deleted.
     * @param {HRESULT} hrDelete Type: <b>HRESULT</b>
     * 
     * The return value of the delete operation. Note that this is not the HRESULT returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitem">DeleteItem</a>, which simply queues the delete operation. Instead, this is the result of the actual deletion.
     * @param {IShellItem} psiNewlyCreated Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the deleted item, now in the Recycle Bin. If the item was fully deleted, this value is <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postdeleteitem
     */
    PostDeleteItem(dwFlags, psiItem, hrDelete, psiNewlyCreated) {
        result := ComCall(12, this, "uint", dwFlags, "ptr", psiItem, "int", hrDelete, "ptr", psiNewlyCreated, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions before the process to create a new item begins.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that control the operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder that will contain the new item.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the file name of the new item, for instance <b>Newfile.txt</b>. This is a null-terminated, Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, this operation and all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-prenewitem
     */
    PreNewItem(dwFlags, psiDestinationFolder, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(13, this, "uint", dwFlags, "ptr", psiDestinationFolder, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * Performs caller-implemented actions after the new item is created.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * bitwise value that contains flags that were used during the creation operation. Some values can be set or changed during the creation operation. See <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> for flag descriptions.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to which the new item was added.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the file name of the new item, for instance <b>Newfile.txt</b>. This is a null-terminated, Unicode string.
     * @param {PWSTR} pszTemplateName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the name of the template file (for example <b>Excel9.xls</b>) that the new item is based on, stored in one of the following locations:
     *                     
     *                     
     * 
     * <ul>
     * <li>CSIDL_COMMON_TEMPLATES. The default path for this folder is %ALLUSERSPROFILE%\Templates.</li>
     * <li>CSIDL_TEMPLATES. The default path for this folder is %USERPROFILE%\Templates.</li>
     * <li>%SystemRoot%\shellnew</li>
     * </ul>
     * This is a null-terminated, Unicode string used to specify an existing file of the same type as the new file, containing the minimal content that an application wants to include in any new file.
     * 
     * This parameter is normally <b>NULL</b> to specify a new, blank file.
     * @param {Integer} dwFileAttributes Type: <b>DWORD</b>
     * 
     * The file attributes applied to the new item. One or more of the values found at <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a>.
     * @param {HRESULT} hrNew Type: <b>HRESULT</b>
     * 
     * The return value of the creation operation. Note that this is not the HRESULT returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-newitem">NewItem</a>, which simply queues the creation operation. Instead, this is the result of the actual creation.
     * @param {IShellItem} psiNewItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the new item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. In the case of an error value, all subsequent operations pending from the call to <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperation">IFileOperation</a> are canceled.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-postnewitem
     */
    PostNewItem(dwFlags, psiDestinationFolder, pszNewName, pszTemplateName, dwFileAttributes, hrNew, psiNewItem) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName
        pszTemplateName := pszTemplateName is String ? StrPtr(pszTemplateName) : pszTemplateName

        result := ComCall(14, this, "uint", dwFlags, "ptr", psiDestinationFolder, "ptr", pszNewName, "ptr", pszTemplateName, "uint", dwFileAttributes, "int", hrNew, "ptr", psiNewItem, "HRESULT")
        return result
    }

    /**
     * Provides an estimate of the total amount of work currently done in relation to the total amount of work.
     * @param {Integer} iWorkTotal Type: <b>UINT</b>
     * 
     * An estimate of the amount of work to be completed.
     * @param {Integer} iWorkSoFar Type: <b>UINT</b>
     * 
     * The portion of <i>iWorkTotal</i> that has been completed so far.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-updateprogress
     */
    UpdateProgress(iWorkTotal, iWorkSoFar) {
        result := ComCall(15, this, "uint", iWorkTotal, "uint", iWorkSoFar, "HRESULT")
        return result
    }

    /**
     * Not supported.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-resettimer
     */
    ResetTimer() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Not supported.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-pausetimer
     */
    PauseTimer() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Not supported.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperationprogresssink-resumetimer
     */
    ResumeTimer() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods supporting status collection and failure information.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itransferadvisesink
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITransferAdviseSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransferAdviseSink
     * @type {Guid}
     */
    static IID => Guid("{d594d0d8-8da7-457b-b3b4-ce5dbaac0b88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateProgress", "UpdateTransferState", "ConfirmOverwrite", "ConfirmEncryptionLoss", "FileFailure", "SubStreamFailure", "PropertyFailure"]

    /**
     * Updates the transfer progress status in the UI.
     * @param {Integer} ullSizeCurrent Type: <b>ULONGLONG</b>
     * 
     * The number of bytes processed in the current operation.
     * @param {Integer} ullSizeTotal Type: <b>ULONGLONG</b>
     * 
     * The total number of bytes in the current operation.
     * @param {Integer} nFilesCurrent Type: <b>int</b>
     * 
     * The number of files processed in the current operation.
     * @param {Integer} nFilesTotal Type: <b>int</b>
     * 
     * The total number of files in the operation. Set to 0 to indicate that the value has not changed since the last call to this method.
     * @param {Integer} nFoldersCurrent Type: <b>int</b>
     * 
     * The number of folders processed in the current operation.
     * @param {Integer} nFoldersTotal Type: <b>int</b>
     * 
     * The total number of folders in the operation. Set to 0 to indicate that the value has not changed since the last call to this method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransferadvisesink-updateprogress
     */
    UpdateProgress(ullSizeCurrent, ullSizeTotal, nFilesCurrent, nFilesTotal, nFoldersCurrent, nFoldersTotal) {
        result := ComCall(3, this, "uint", ullSizeCurrent, "uint", ullSizeTotal, "int", nFilesCurrent, "int", nFilesTotal, "int", nFoldersCurrent, "int", nFoldersTotal, "HRESULT")
        return result
    }

    /**
     * Updates the transfer state.
     * @param {Integer} ts Type: <b>TRANSFER_ADVISE_STATE</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransferadvisesink-updatetransferstate
     */
    UpdateTransferState(ts) {
        result := ComCall(4, this, "uint", ts, "HRESULT")
        return result
    }

    /**
     * Displays a message to the user confirming that overwriting existing items is acceptable.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the source <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> .
     * @param {IShellItem} psiDestParent Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the destination parent folder <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a wide-string containing the desired name of the item at the destination. If <b>NULL</b>, the name is the same as the Shell item pointed to by <i>psiSource</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The return values listed below are emitted specifically by this method to inform the calling process of how the operation ended.  If other results or errors are emitted during the operation of this method, they should be returned to the calling process.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USER_IGNORED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked <b>Ignore</b>. Allows the calling process to continue processing other files as appropriate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked <b>Cancel</b>. Stops processing of the current document and ends the current process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransferadvisesink-confirmoverwrite
     */
    ConfirmOverwrite(psiSource, psiDestParent, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", psiSource, "ptr", psiDestParent, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Displays a message to the user confirming that loss of encryption is acceptable for this operation.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> of the file in which encryption information will be lost.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following specific Shell codes, or a system error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_YES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User responded "Yes" to the dialog. Copy continues without encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USER_IGNORED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User responded "No" to the dialog.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error has been queued and will display later. Operation on this file will be skipped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransferadvisesink-confirmencryptionloss
     */
    ConfirmEncryptionLoss(psiSource) {
        result := ComCall(6, this, "ptr", psiSource, "HRESULT")
        return result
    }

    /**
     * Called when there is a failure and user interaction is needed.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> on which the operation failed.
     * @param {PWSTR} pszItem Type: <b>LPCWSTR</b>
     * 
     * Optional. A pointer to a null-terminated buffer that contains the name of the file. If this value is <b>NULL</b>, the name given by the <i>psi</i> parameter is used.
     * @param {HRESULT} hrError Type: <b>HRESULT</b>
     * 
     * The error code generated by the failure. This error must be handled by the copy engine.
     * @param {PWSTR} pszRename Type: <b>LPWSTR</b>
     * 
     * Optional. When this method returns, contains a pointer to a null-terminated buffer that contains a new name for the file. The name cannot exceed length <i>cchRename</i>. If this parameter is <b>NULL</b>, no option to rename will be available.
     * @param {Integer} cchRename Type: <b>ULONG</b>
     * 
     * The size of the <i>pszRename</i>buffer, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any other <b>HRESULT</b> should be returned to the calling process. If the failure is not handled, the return value should be <i>hrError</i>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USER_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked <b>Retry</b>. The handler should retry the file operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_E_USERCANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked <b>Cancel</b>. The entire copy job is being terminated. The handler should return this code back to the copy engine.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USER_IGNORED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked <b>Ignore</b>. The handler should skip creating the item and return this code back to the copy engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransferadvisesink-filefailure
     */
    FileFailure(psi, pszItem, hrError, pszRename, cchRename) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem
        pszRename := pszRename is String ? StrPtr(pszRename) : pszRename

        result := ComCall(7, this, "ptr", psi, "ptr", pszItem, "int", hrError, "ptr", pszRename, "uint", cchRename, "HRESULT")
        return result
    }

    /**
     * Called when there is a failure that involves secondary streams and user interaction is needed.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that caused the failure.
     * @param {PWSTR} pszStreamName Type: <b>LPCWSTR</b>
     * 
     * The name of the data that will be lost in the operation.
     * @param {HRESULT} hrError Type: <b>HRESULT</b>
     * 
     * The error code that was generated. It must be handled by the copy engine.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any other <b>HRESULT</b> should be passed up. If the failure is not handled, the return value should be <i>hrError</i>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USERRETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handler should retry the file operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USERRETRYWITHNEWNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handler should retry the file operation using the name returned in the <i>pszRename</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_OVERWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has indicated that the handler should overwrite the existing file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_RETRYWITHOUTSECURITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has indicated that the handler should try the operation again without the security descriptor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_E_USERCANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked <b>Cancel</b>. The entire copy job is being terminated. The handler should return this code back to the copy engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransferadvisesink-substreamfailure
     */
    SubStreamFailure(psi, pszStreamName, hrError) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        result := ComCall(8, this, "ptr", psi, "ptr", pszStreamName, "int", hrError, "HRESULT")
        return result
    }

    /**
     * Called when there is a failure that involves file properties and user interaction is needed.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that caused the failure.
     * @param {Pointer<PROPERTYKEY>} pkey Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A value that corresponds to the property that will be lost. A <b>NULL</b> value indicates that all properties were lost.
     * @param {HRESULT} hrError Type: <b>HRESULT</b>
     * 
     * The error code generated by the failure. It must be handled by the copy engine.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any other <b>HRESULT</b> should be passed up. If the failure is not handled, the return value should be <i>hrError</i>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USERRETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handler should retry the file operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USERRETRYWITHNEWNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handler should retry the file operation using the name returned in the <i>pszRename</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_OVERWRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has indicated that the handler should overwrite the existing file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_RETRYWITHOUTSECURITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has indicated that the handler should try the operation again without the security descriptor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_E_USERCANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked <b>Cancel</b>. The entire copy job is being terminated. The handler should return this code back to the copy engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransferadvisesink-propertyfailure
     */
    PropertyFailure(psi, pkey, hrError) {
        result := ComCall(9, this, "ptr", psi, "ptr", pkey, "int", hrError, "HRESULT")
        return result
    }
}

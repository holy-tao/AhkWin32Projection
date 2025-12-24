#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to copy, move, rename, create, and delete Shell items as well as methods to provide progress and error dialogs. This interface replaces the SHFileOperation function.
 * @remarks
 * 
 * A Shell item can be any object in the namespace, including file system objects such as files and folders, but also virtual objects. In the <b>IFileOperation</b> method topics, the term "item" is used to refer generically to any namespace object.
 * 
 * <b>IFileOperation</b> offers many advantages over the older <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a> function.
 * 
 *                 
 * 
 * <ul>
 * <li>Use of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> to identify items rather than string paths. <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a> required path and destination strings to terminate in two null characters rather than the standard single null character, which itself was used to delimit multiple paths in the string. Identifying an item through <b>IShellItem</b> is more robust and less prone to programming errors. It also allows you to access non-file system items such as virtual folders. Multiple items in one operation can be passed as an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, or a collection accessed through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> rather than as a string.
 *                     </li>
 * <li>More accurate error reporting through HRESULT values in conjunction with an API such as <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a>. Return codes from <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a> could be misleading or inaccurate.</li>
 * <li>Extensibility. As a Component Object Model (COM) interface, <b>IFileOperation</b> can have its capabilities extended by a third-party to meet their specific needs, although this should be a very rare case. Windows provides a default implementation of <b>IFileOperation</b> that should meet the needs of most users.</li>
 * <li>Better progress feedback. Detailed operation progress, including notifications when specific operations begin and end on individual items as well as the overall progress, can be received during the operation. While <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a> did provide progress UI, it was not as detailed.</li>
 * <li>More functionality. In addition to the copy, delete, move, and rename functionality provided by <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a>, <b>IFileOperation</b> allows you to apply property values and create new items.</li>
 * <li>More control over the operation. In addition to the operation flags recognized by <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a>, new flags are recognized in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setoperationflags">IFileOperation::SetOperationFlags</a> that specify extended operation options.</li>
 * <li>Different operations can be performed in one call. For instance, you can move a set of files, copy others, rename a folder, and apply properties to yet another item all in one operation. <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a> could only do one operation—copy, move, rename, or delete—at a time.</li>
 * </ul>
 * To accomplish a file operation using this interface, a sequence of calls must be made.
 * 
 *                 
 * 
 * <ol>
 * <li>Optional. Set up the event sink for progress status and error notifications through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">Advise</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-unadvise">Unadvise</a>.</li>
 * <li>Set the operation state using the following as needed:
 *                         <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setoperationflags">SetOperationFlags</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setownerwindow">SetOwnerWindow</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setprogressdialog">SetProgressDialog</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setprogressmessage">SetProgressMessage</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setproperties">SetProperties</a>
 * </li>
 * </ul>
 * </li>
 * <li>Specify which operations to perform on which items using the following as needed.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-applypropertiestoitem">ApplyPropertiesToItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-applypropertiestoitems">ApplyPropertiesToItems</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-copyitem">CopyItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-copyitems">CopyItems</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitem">DeleteItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitems">DeleteItems</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-moveitem">MoveItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-moveitems">MoveItems</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-newitem">NewItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-renameitem">RenameItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-renameitems">RenameItems</a>
 * </li>
 * </ul>
 * </li>
 * <li>Execute the operations by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-performoperations">PerformOperations</a>
 * </li>
 * </ol>
 * <b>IFileOperation</b> can only be applied in a single-threaded apartment (STA) situation. It cannot be used for a multithreaded apartment (MTA) situation. For MTA, you still must use <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a>.
 * 
 * A full sample that demonstrates the extension of <b>IFileOperation</b> is included in the Windows Software Development Kit (SDK). In a default installation, it can be found at %ProgramFiles%\Microsoft SDKs\Windows\v6.0\Samples\WinUI\Shell\AppPlatform\FileOperations.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifileoperation
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOperation
     * @type {Guid}
     */
    static IID => Guid("{947aab5f-0a5c-4c13-b4d6-4bf7836fc9f8}")

    /**
     * The class identifier for FileOperation
     * @type {Guid}
     */
    static CLSID => Guid("{3ad05575-8857-4850-9277-11b85bdb8e09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "SetOperationFlags", "SetProgressMessage", "SetProgressDialog", "SetProperties", "SetOwnerWindow", "ApplyPropertiesToItem", "ApplyPropertiesToItems", "RenameItem", "RenameItems", "MoveItem", "MoveItems", "CopyItem", "CopyItems", "DeleteItem", "DeleteItems", "NewItem", "PerformOperations", "GetAnyOperationsAborted"]

    /**
     * Enables a handler to provide status and error information for all operations.
     * @param {IFileOperationProgressSink} pfops Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a> object to be used for progress status and error notifications.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * When this method returns, this parameter points to a returned token that uniquely identifies this connection. The calling application uses this token later to delete the connection by passing it to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-unadvise">IFileOperation::Unadvise</a>. If the call to <b>Advise</b> fails, this value is meaningless.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-advise
     */
    Advise(pfops) {
        result := ComCall(3, this, "ptr", pfops, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Terminates an advisory connection previously established through IFileOperation::Advise.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * The connection token that identifies the connection to delete. This value was originally retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">Advise</a> when the connection was made.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any value other than those listed here indicate a failure.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection was terminated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value in <i>dwCookie</i> does not represent a valid connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Sets parameters for the current operation.
     * @param {Integer} dwOperationFlags Type: <b>DWORD</b>
     * 
     * Flags that control the file operation. This member can be a combination of the following flags. FOF flags are defined in Shellapi.h and FOFX flags are defined in Shobjidl.h.
     *     
     *                         
     * 
     * <div class="alert"><b>Note</b>  If this method is not called, the default value used by the operation is FOF_ALLOWUNDO | FOF_NOCONFIRMMKDIR.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-setoperationflags
     */
    SetOperationFlags(dwOperationFlags) {
        result := ComCall(5, this, "uint", dwOperationFlags, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszMessage Type: <b>LPCWSTR</b>
     * 
     * Pointer to the window title. This is a null-terminated, Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-setprogressmessage
     */
    SetProgressMessage(pszMessage) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(6, this, "ptr", pszMessage, "HRESULT")
        return result
    }

    /**
     * Specifies a dialog box used to display the progress of the operation.
     * @param {IOperationsProgressDialog} popd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ioperationsprogressdialog">IOperationsProgressDialog</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ioperationsprogressdialog">IOperationsProgressDialog</a> object that represents the dialog box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-setprogressdialog
     */
    SetProgressDialog(popd) {
        result := ComCall(7, this, "ptr", popd, "HRESULT")
        return result
    }

    /**
     * Declares a set of properties and values to be set on an item or items.
     * @param {IPropertyChangeArray} pproparray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a>, which accesses a collection of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a> objects that specify the properties to be set and their new values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-setproperties
     */
    SetProperties(pproparray) {
        result := ComCall(8, this, "ptr", pproparray, "HRESULT")
        return result
    }

    /**
     * Sets the parent or owner window for progress and dialog windows.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the owner window of the operation. This window will receive error messages.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-setownerwindow
     */
    SetOwnerWindow(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(9, this, "ptr", hwndOwner, "HRESULT")
        return result
    }

    /**
     * Declares a single item whose property values are to be set.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the item to receive the new property values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-applypropertiestoitem
     */
    ApplyPropertiesToItem(psiItem) {
        result := ComCall(10, this, "ptr", psiItem, "HRESULT")
        return result
    }

    /**
     * Declares a set of items for which to apply a common set of property values.
     * @param {IUnknown} punkItems Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> object which represents the group of items.  You can also point to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistidlist">IPersistIDList</a> object to represent a single item, effectively accomplishing the same function as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-applypropertiestoitem">IFileOperation::ApplyPropertiesToItem</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-applypropertiestoitems
     */
    ApplyPropertiesToItems(punkItems) {
        result := ComCall(11, this, "ptr", punkItems, "HRESULT")
        return result
    }

    /**
     * Declares a single item that is to be given a new display name.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the source item.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname">display name</a> of the item. This is a null-terminated, Unicode string.
     * @param {IFileOperationProgressSink} pfopsItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a> object to be used for status and failure notifications. If you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">IFileOperation::Advise</a> for the overall operation, progress status and error notifications for the rename operation are included there, so set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-renameitem
     */
    RenameItem(psiItem, pszNewName, pfopsItem) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(12, this, "ptr", psiItem, "ptr", pszNewName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * Declares a set of items that are to be given a new display name. All items are given the same name.
     * @param {IUnknown} pUnkItems Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> object which represents the group of items to be renamed. You can also point to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistidlist">IPersistIDList</a> object to represent a single item, effectively accomplishing the same function as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-renameitem">IFileOperation::RenameItem</a>.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to the new display name of the items. This is a null-terminated, Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-renameitems
     */
    RenameItems(pUnkItems, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(13, this, "ptr", pUnkItems, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * Declares a single item that is to be moved to a specified destination.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the source item.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to contain the moved item.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a new name for the item in its new location. This is a null-terminated Unicode string and can be <b>NULL</b>. If <b>NULL</b>, the name of the destination item is the same as the source.
     * @param {IFileOperationProgressSink} pfopsItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a> object to be used for progress status and error notifications for this specific move operation. If you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">IFileOperation::Advise</a> for the overall operation, progress status and error notifications for the move operation are included there, so set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-moveitem
     */
    MoveItem(psiItem, psiDestinationFolder, pszNewName, pfopsItem) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(14, this, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * Declares a set of items that are to be moved to a specified destination.
     * @param {IUnknown} punkItems Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> object which represents the group of items to be moved. You can also point to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistidlist">IPersistIDList</a> object to represent a single item, effectively accomplishing the same function as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-moveitem">IFileOperation::MoveItem</a>.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to contain the moved items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-moveitems
     */
    MoveItems(punkItems, psiDestinationFolder) {
        result := ComCall(15, this, "ptr", punkItems, "ptr", psiDestinationFolder, "HRESULT")
        return result
    }

    /**
     * Declares a single item that is to be copied to a specified destination.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the source item.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to contain the copy of the item.
     * @param {PWSTR} pszCopyName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a new name for the item after it has been copied. This is a null-terminated Unicode string and can be <b>NULL</b>. If <b>NULL</b>, the name of the destination item is the same as the source.
     * @param {IFileOperationProgressSink} pfopsItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a> object to be used for progress status and error notifications for this specific copy operation. If you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">IFileOperation::Advise</a> for the overall operation, progress status and error notifications for the copy operation are included there, so set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-copyitem
     */
    CopyItem(psiItem, psiDestinationFolder, pszCopyName, pfopsItem) {
        pszCopyName := pszCopyName is String ? StrPtr(pszCopyName) : pszCopyName

        result := ComCall(16, this, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszCopyName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * Declares a set of items that are to be copied to a specified destination.
     * @param {IUnknown} punkItems Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> object which represents the group of items to be copied. You can also point to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistidlist">IPersistIDList</a> object to represent a single item, effectively accomplishing the same function as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-copyitem">IFileOperation::CopyItem</a>.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder to contain the copy of the items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-copyitems
     */
    CopyItems(punkItems, psiDestinationFolder) {
        result := ComCall(17, this, "ptr", punkItems, "ptr", psiDestinationFolder, "HRESULT")
        return result
    }

    /**
     * Declares a single item that is to be deleted.
     * @param {IShellItem} psiItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the item to be deleted.
     * @param {IFileOperationProgressSink} pfopsItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a> object to be used for progress status and error notifications for this specific delete operation. If you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">IFileOperation::Advise</a> for the overall operation, progress status and error notifications for the delete operation are included there, so set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitem
     */
    DeleteItem(psiItem, pfopsItem) {
        result := ComCall(18, this, "ptr", psiItem, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * Declares a set of items that are to be deleted.
     * @param {IUnknown} punkItems Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a> object which represents the group of items to be deleted. You can also point to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistidlist">IPersistIDList</a> object to represent a single item, effectively accomplishing the same function as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitem">IFileOperation::DeleteItem</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitems
     */
    DeleteItems(punkItems) {
        result := ComCall(19, this, "ptr", punkItems, "HRESULT")
        return result
    }

    /**
     * Declares a new item that is to be created in a specified location.
     * @param {IShellItem} psiDestinationFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that specifies the destination folder that will contain the new item.
     * @param {Integer} dwFileAttributes Type: <b>DWORD</b>
     * 
     * A bitwise value that specifies the file system attributes for the file or folder. See <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a> for possible values.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
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
     * @param {IFileOperationProgressSink} pfopsItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a> object to be used for status and failure notifications. If you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise">IFileOperation::Advise</a> for the overall operation, progress status and error notifications for the creation operation are included there, so set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-newitem
     */
    NewItem(psiDestinationFolder, dwFileAttributes, pszName, pszTemplateName, pfopsItem) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszTemplateName := pszTemplateName is String ? StrPtr(pszTemplateName) : pszTemplateName

        result := ComCall(20, this, "ptr", psiDestinationFolder, "uint", dwFileAttributes, "ptr", pszName, "ptr", pszTemplateName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * Executes all selected operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Note that if the operation was canceled by the user, this method can still return a success code. Use the <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileoperation-getanyoperationsaborted">GetAnyOperationsAborted</a> method to determine if this was the case.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-performoperations
     */
    PerformOperations() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Gets a value that states whether any file operations initiated by a call to IFileOperation::PerformOperations were stopped before they were complete. The operations could be stopped either by user action or silently by the system.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, points to <b>TRUE</b> if any file operations were aborted before they were complete; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifileoperation-getanyoperationsaborted
     */
    GetAnyOperationsAborted() {
        result := ComCall(22, this, "int*", &pfAnyOperationsAborted := 0, "HRESULT")
        return pfAnyOperationsAborted
    }
}

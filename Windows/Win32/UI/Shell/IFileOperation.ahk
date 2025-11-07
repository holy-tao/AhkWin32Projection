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
     * 
     * @param {IFileOperationProgressSink} pfops 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-advise
     */
    Advise(pfops) {
        result := ComCall(3, this, "ptr", pfops, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOperationFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setoperationflags
     */
    SetOperationFlags(dwOperationFlags) {
        result := ComCall(5, this, "uint", dwOperationFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setprogressmessage
     */
    SetProgressMessage(pszMessage) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(6, this, "ptr", pszMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOperationsProgressDialog} popd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setprogressdialog
     */
    SetProgressDialog(popd) {
        result := ComCall(7, this, "ptr", popd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyChangeArray} pproparray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setproperties
     */
    SetProperties(pproparray) {
        result := ComCall(8, this, "ptr", pproparray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-setownerwindow
     */
    SetOwnerWindow(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(9, this, "ptr", hwndOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-applypropertiestoitem
     */
    ApplyPropertiesToItem(psiItem) {
        result := ComCall(10, this, "ptr", psiItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-applypropertiestoitems
     */
    ApplyPropertiesToItems(punkItems) {
        result := ComCall(11, this, "ptr", punkItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiItem 
     * @param {PWSTR} pszNewName 
     * @param {IFileOperationProgressSink} pfopsItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-renameitem
     */
    RenameItem(psiItem, pszNewName, pfopsItem) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(12, this, "ptr", psiItem, "ptr", pszNewName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkItems 
     * @param {PWSTR} pszNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-renameitems
     */
    RenameItems(pUnkItems, pszNewName) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(13, this, "ptr", pUnkItems, "ptr", pszNewName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiItem 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszNewName 
     * @param {IFileOperationProgressSink} pfopsItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-moveitem
     */
    MoveItem(psiItem, psiDestinationFolder, pszNewName, pfopsItem) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(14, this, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszNewName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkItems 
     * @param {IShellItem} psiDestinationFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-moveitems
     */
    MoveItems(punkItems, psiDestinationFolder) {
        result := ComCall(15, this, "ptr", punkItems, "ptr", psiDestinationFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiItem 
     * @param {IShellItem} psiDestinationFolder 
     * @param {PWSTR} pszCopyName 
     * @param {IFileOperationProgressSink} pfopsItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-copyitem
     */
    CopyItem(psiItem, psiDestinationFolder, pszCopyName, pfopsItem) {
        pszCopyName := pszCopyName is String ? StrPtr(pszCopyName) : pszCopyName

        result := ComCall(16, this, "ptr", psiItem, "ptr", psiDestinationFolder, "ptr", pszCopyName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkItems 
     * @param {IShellItem} psiDestinationFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-copyitems
     */
    CopyItems(punkItems, psiDestinationFolder) {
        result := ComCall(17, this, "ptr", punkItems, "ptr", psiDestinationFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiItem 
     * @param {IFileOperationProgressSink} pfopsItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitem
     */
    DeleteItem(psiItem, pfopsItem) {
        result := ComCall(18, this, "ptr", psiItem, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-deleteitems
     */
    DeleteItems(punkItems) {
        result := ComCall(19, this, "ptr", punkItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiDestinationFolder 
     * @param {Integer} dwFileAttributes 
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszTemplateName 
     * @param {IFileOperationProgressSink} pfopsItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-newitem
     */
    NewItem(psiDestinationFolder, dwFileAttributes, pszName, pszTemplateName, pfopsItem) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszTemplateName := pszTemplateName is String ? StrPtr(pszTemplateName) : pszTemplateName

        result := ComCall(20, this, "ptr", psiDestinationFolder, "uint", dwFileAttributes, "ptr", pszName, "ptr", pszTemplateName, "ptr", pfopsItem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-performoperations
     */
    PerformOperations() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileoperation-getanyoperationsaborted
     */
    GetAnyOperationsAborted() {
        result := ComCall(22, this, "int*", &pfAnyOperationsAborted := 0, "HRESULT")
        return pfAnyOperationsAborted
    }
}

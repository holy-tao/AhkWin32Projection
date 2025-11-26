#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to manipulate IShellItem, including copy, move, recycle, and others. This interface is offered to provide more control over file operations by providing an ITransferSource::Advise method.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itransfersource
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITransferSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransferSource
     * @type {Guid}
     */
    static IID => Guid("{00adb003-bde9-45c6-8e29-d09f9353e108}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "SetProperties", "OpenItem", "MoveItem", "RecycleItem", "RemoveItem", "RenameItem", "LinkItem", "ApplyPropertiesToItem", "GetDefaultDestinationName", "EnterFolder", "LeaveFolder"]

    /**
     * Sets up an advisory connection for notifications on the status of file operations.
     * @param {ITransferAdviseSink} psink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransferadvisesink">ITransferAdviseSink</a>*</b>
     * 
     * A pointer to notification interface <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransferadvisesink">ITransferAdviseSink</a> to update the calling application using methods on this interface.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a returned token that uniquely identifies this connection. The calling application uses this token later to delete the connection by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itransfersource-unadvise">ITransferSource::Unadvise</a> method. If the connection was not successfully established, this value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-advise
     */
    Advise(psink) {
        result := ComCall(3, this, "ptr", psink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Terminates an advisory connection.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * The connection token previously returned from method <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itransfersource-advise">ITransferSource::Advise</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any HRESULTs other than listed indicate a failure.
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
     * The connection was successfully terminated.
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
     * The value in dwCookie does not represent a valid connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Sets properties that should be applied to an item.
     * @param {IPropertyChangeArray} pproparray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychangearray">IPropertyChangeArray</a>*</b>
     * 
     * An array of properties and their changed values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any return value other than S_OK indicates a failure.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-setproperties
     */
    SetProperties(pproparray) {
        result := ComCall(5, this, "ptr", pproparray, "HRESULT")
        return result
    }

    /**
     * Opens the item for copying. Returns an object that can be enumerated for resources (IShellItemResources).
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> to be opened.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a></b>
     * 
     * The flags that control the file operation. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> constants.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID (the interface ID or GUID) of the interface to return in <i>ppv</i>.  This should be an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemresources">IShellItemResources</a> or an interface derived from <b>IShellItemResources</b>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the interface specified by <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-openitem
     */
    OpenItem(psi, flags, riid) {
        result := ComCall(6, this, "ptr", psi, "uint", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Moves the item within the volume/namespace, returning the IShellItem in its new location.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> to be moved.
     * @param {IShellItem} psiParentDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the new parent item at the destination.
     * @param {PWSTR} pszNameDst Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated buffer that contains the destination path.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a></b>
     * 
     * Flags that control the file operation. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> constants.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When this method returns successfully, contains an address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> in its new location.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-moveitem
     */
    MoveItem(psi, psiParentDst, pszNameDst, flags) {
        pszNameDst := pszNameDst is String ? StrPtr(pszNameDst) : pszNameDst

        result := ComCall(7, this, "ptr", psi, "ptr", psiParentDst, "ptr", pszNameDst, "uint", flags, "ptr*", &ppsiNew := 0, "HRESULT")
        return IShellItem(ppsiNew)
    }

    /**
     * Recycle the item into the provided recycle location and return the item in its new location.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> to be recycled.
     * @param {IShellItem} psiParentDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> of the recycle location (the new parent of the item).
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a></b>
     * 
     * The flags that control the file operation. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> constants.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When the method returns, contains the address of a pointer to the recycled <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-recycleitem
     */
    RecycleItem(psiSource, psiParentDest, flags) {
        result := ComCall(8, this, "ptr", psiSource, "ptr", psiParentDest, "uint", flags, "ptr*", &ppsiNewDest := 0, "HRESULT")
        return IShellItem(ppsiNewDest)
    }

    /**
     * Removes the item without moving the item to the Recycle Bin.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> to be removed.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a></b>
     * 
     * Flags that control the file operation. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> constants.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following, or an error code.
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
     * User responded "Yes" to the dialog
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USER_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User responded to retry the current action
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
     * <dt><b>COPYENGINE_S_MERGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User responded to merge folders.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_USER_RETRY_WITH_NEW_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User responded to retry the file with new name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_S_DONT_PROCESS_CHILDREN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Child items should not be processed.
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
     * Error has been queued and will display later.
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
     * User canceled the current action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYENGINE_E_REQUIRES_ELEVATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operation requires elevated privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-removeitem
     */
    RemoveItem(psiSource, flags) {
        result := ComCall(9, this, "ptr", psiSource, "uint", flags, "HRESULT")
        return result
    }

    /**
     * Changes the name of an item, returning the IShellItem with the new name.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object to be renamed.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string containing the new name.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a></b>
     * 
     * Flags that control the file operation. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> constants.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-renameitem
     */
    RenameItem(psiSource, pszNewName, flags) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(10, this, "ptr", psiSource, "ptr", pszNewName, "uint", flags, "ptr*", &ppsiNewDest := 0, "HRESULT")
        return IShellItem(ppsiNewDest)
    }

    /**
     * Not implemented.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the source item.
     * @param {IShellItem} psiParentDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> as parent to link.
     * @param {PWSTR} pszNewName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string containing the name for the link.
     * @param {Integer} flags Type: <b>DWORD</b>
     * 
     * The flags that control the file operation. Value is one or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> constants.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When the method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> of the link.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-linkitem
     */
    LinkItem(psiSource, psiParentDest, pszNewName, flags) {
        pszNewName := pszNewName is String ? StrPtr(pszNewName) : pszNewName

        result := ComCall(11, this, "ptr", psiSource, "ptr", psiParentDest, "ptr", pszNewName, "uint", flags, "ptr*", &ppsiNewDest := 0, "HRESULT")
        return IShellItem(ppsiNewDest)
    }

    /**
     * Apply a set of property changes to an item.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> to be altered.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the changed <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-applypropertiestoitem
     */
    ApplyPropertiesToItem(psiSource) {
        result := ComCall(12, this, "ptr", psiSource, "ptr*", &ppsiNew := 0, "HRESULT")
        return IShellItem(ppsiNew)
    }

    /**
     * Gets the default name for a Shell item.
     * @param {IShellItem} psiSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @param {IShellItem} psiParentDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the parent <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> of the destination target of the file operation.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When the method returns, contains a pointer to a null-terminated, Unicode string containing the default name.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-getdefaultdestinationname
     */
    GetDefaultDestinationName(psiSource, psiParentDest) {
        result := ComCall(13, this, "ptr", psiSource, "ptr", psiParentDest, "ptr*", &ppszDestinationName := 0, "HRESULT")
        return ppszDestinationName
    }

    /**
     * Notifies that a folder is the destination of a file operation.
     * @param {IShellItem} psiChildFolderDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> destination folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-enterfolder
     */
    EnterFolder(psiChildFolderDest) {
        result := ComCall(14, this, "ptr", psiChildFolderDest, "HRESULT")
        return result
    }

    /**
     * Sends notification that a folder is no longer the destination of a file operation.
     * @param {IShellItem} psiChildFolderDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> destination folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-itransfersource-leavefolder
     */
    LeaveFolder(psiChildFolderDest) {
        result := ComCall(15, this, "ptr", psiChildFolderDest, "HRESULT")
        return result
    }
}

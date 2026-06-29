#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITransferAdviseSink.ahk" { ITransferAdviseSink }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that create a destination Shell item for a copy or move operation. This interface is provided to allow more control over file operations by providing an ITransferDestination::Advise method.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itransferdestination
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITransferDestination extends IUnknown {
    /**
     * The interface identifier for ITransferDestination
     * @type {Guid}
     */
    static IID := Guid("{48addd32-3ca5-4124-abe3-b5a72531b207}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransferDestination interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Advise     : IntPtr
        Unadvise   : IntPtr
        CreateItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransferDestination.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets up an advisory connection for notifications on the status of file operations. (ITransferDestination.Advise)
     * @remarks
     * Call <b>ITransferDestination::Advise</b> before calling any other <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransferdestination">ITransferDestination</a> methods so the handler can callback for any errors that might occur. If not set, the handler should consider it an indication that no feedback is available and do the "default" operation.
     * @param {ITransferAdviseSink} psink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransferadvisesink">ITransferAdviseSink</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransferadvisesink">ITransferAdviseSink</a> notification interface to update the calling application using methods on this interface.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a returned token that uniquely identifies this connection. The calling application uses this token later to delete the connection by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itransferdestination-unadvise">ITransferDestination::Unadvise</a> method. If the connection is not successfully established, this value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferdestination-advise
     */
    Advise(psink) {
        result := ComCall(3, this, "ptr", psink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Terminates an advisory connection. (ITransferDestination.Unadvise)
     * @remarks
     * Terminates an advisory connection previously established through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itransferdestination-advise">ITransferDestination::Advise</a> method.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * A connection token previously returned from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itransferdestination-advise">ITransferDestination::Advise</a>. Identifies the connection to be terminated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Any HRESULTs other than those listed here indicate a failure.
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
     * The value in <i>dwCookie</i> does not represent a valid connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferdestination-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Creates the specified file.
     * @remarks
     * This method may be used to create a Shell item object representing the destination folder for a copy or move operation. The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransfersource">ITransferSource</a> interface provides methods to actually move objects of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> to the destination.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itransferdestination-advise">ITransferDestination::Advise</a> before calling any other <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransferdestination">ITransferDestination</a> methods so the handler can callback on any errors that might occur. If not set, the handler should consider it an indication that no feedback is available and to do the "default" operation.
     * 
     * It is recommended that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riidResources</i> and <i>ppvResources</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppvResources</i>, which eliminates the possibility of a coding error.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated buffer that contains the name of the file relative to the current directory.
     * @param {Integer} dwAttributes Type: <b>DWORD</b>
     * 
     * One or more of the FILE_ATTRIBUTE flags defined in the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/ns-fileapi-by_handle_file_information">BY_HANDLE_FILE_INFORMATION</a> structure. The most significant value is FILE_ATTRIBUTE_DIRECTORY, which indicates that a folder should be created.
     * @param {Integer} ullSize Type: <b>ULONGLONG</b>
     * 
     * The size, in bytes, of the file to create. This value can be 0 if the size is unknown.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a></b>
     * 
     * Flags that control the file operation. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags">TRANSFER_SOURCE_FLAGS</a> flags.
     * @param {Pointer<Guid>} riidItem Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppvItem</i>, typically IID_IShellItem or another interface that derives from it.
     * @param {Pointer<Pointer<Void>>} ppvItem Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riidItem</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> or a derived interface.
     * @param {Pointer<Guid>} riidResources Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppvResources</i>, typically IID_IShellItemResources or another interface that derives from it.
     * @param {Pointer<Pointer<Void>>} ppvResources Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riidResources</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemresources">IShellItemResources</a> or a derived interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success code if successful, or an error value otherwise. Success codes include:
     *                 
     *                     
     * 
     * <ul>
     * <li><b>S_OK</b>: The move succeeded and <i>ppvItem</i> and <i>ppvResources</i> both point to valid objects.</li>
     * <li><b>COPYENGINE_S_USER_IGNORED</b>: The destination item already exists and has not been overwritten. The values pointed to by <i>ppvItem</i> and <i>ppvResources</i> are <b>NULL</b>. If the caller is implementing a move as a copy and delete operation, the caller should complete the move by deleting the source item.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferdestination-createitem
     */
    CreateItem(pszName, dwAttributes, ullSize, flags, riidItem, ppvItem, riidResources, ppvResources) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppvItemMarshal := ppvItem is VarRef ? "ptr*" : "ptr"
        ppvResourcesMarshal := ppvResources is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pszName, "uint", dwAttributes, "uint", ullSize, "uint", flags, Guid.Ptr, riidItem, ppvItemMarshal, ppvItem, Guid.Ptr, riidResources, ppvResourcesMarshal, ppvResources, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransferDestination.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 3)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
        this.vtbl.CreateItem := CallbackCreate(GetMethod(implObj, "CreateItem"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
        CallbackFree(this.vtbl.CreateItem)
    }
}

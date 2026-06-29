#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow an application to attach extra data blocks to a Shell link. These methods add, copy, or remove data blocks.
 * @remarks
 * The data blocks are in the form of a structure. The first two members are the same for all data blocks. The first member gives the structure's size. The second member is a signature that identifies the type of data block. The remaining members hold the block's data. There are five types of data block currently supported.
 * 				
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Data block structure</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-exp_darwin_link">EXP_DARWIN_LINK</a>
 * </td>
 * <td>The link's Windows Installer ID.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-exp_special_folder">EXP_SPECIAL_FOLDER</a>
 * </td>
 * <td>Special folder information.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-exp_sz_link">EXP_SZ_LINK</a>
 * </td>
 * <td>The target name.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-nt_console_props">NT_CONSOLE_PROPS</a>
 * </td>
 * <td>Console properties.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-nt_fe_console_props">NT_FE_CONSOLE_PROPS</a>
 * </td>
 * <td>The console's code page.</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * This interface is not implemented by applications.
 * 
 * Use this interface if your application needs to add extra data blocks to a Shell link.
 * 
 * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelllinkdatalist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellLinkDataList extends IUnknown {
    /**
     * The interface identifier for IShellLinkDataList
     * @type {Guid}
     */
    static IID := Guid("{45e2b4ae-b1c3-11d0-b92f-00a0c90312e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellLinkDataList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddDataBlock    : IntPtr
        CopyDataBlock   : IntPtr
        RemoveDataBlock : IntPtr
        GetFlags        : IntPtr
        SetFlags        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellLinkDataList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a data block to a link.
     * @param {Pointer<Void>} pDataBlock Type: <b>VOID*</b>
     * 
     * The data block structure. For a list of supported structures, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinkdatalist">IShellLinkDataList</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkdatalist-adddatablock
     */
    AddDataBlock(pDataBlock) {
        pDataBlockMarshal := pDataBlock is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pDataBlockMarshal, pDataBlock, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of a link's data block.
     * @param {Integer} dwSig Type: <b>DWORD</b>
     * 
     * The data block's signature. The signature value for a particular type of data block can be found in its structure reference. For a list of supported data block types and their associated structures, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinkdatalist">IShellLinkDataList</a>.
     * @returns {Pointer<Void>} Type: <b>VOID**</b>
     * 
     * The address of a pointer to a copy of the data block structure. If <b>IShellLinkDataList::CopyDataBlock</b> returns a successful result, the calling application must free the memory when it is no longer needed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkdatalist-copydatablock
     */
    CopyDataBlock(dwSig) {
        result := ComCall(4, this, "uint", dwSig, "ptr*", &ppDataBlock := 0, "HRESULT")
        return ppDataBlock
    }

    /**
     * Removes a data block from a link.
     * @param {Integer} dwSig Type: <b>DWORD</b>
     * 
     * The data block's signature. The signature value for a particular type of data block can be found in its structure reference. For a list of supported data block types and their associated structures, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinkdatalist">IShellLinkDataList</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkdatalist-removedatablock
     */
    RemoveDataBlock(dwSig) {
        result := ComCall(5, this, "uint", dwSig, "HRESULT")
        return result
    }

    /**
     * Gets the current option settings.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Pointer to one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-shell_link_data_flags">SHELL_LINK_DATA_FLAGS</a> that indicate the current option settings.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkdatalist-getflags
     */
    GetFlags() {
        result := ComCall(6, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets the current option settings.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-shell_link_data_flags">SHELL_LINK_DATA_FLAGS</a> that indicate the option settings.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkdatalist-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellLinkDataList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddDataBlock := CallbackCreate(GetMethod(implObj, "AddDataBlock"), flags, 2)
        this.vtbl.CopyDataBlock := CallbackCreate(GetMethod(implObj, "CopyDataBlock"), flags, 3)
        this.vtbl.RemoveDataBlock := CallbackCreate(GetMethod(implObj, "RemoveDataBlock"), flags, 2)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.SetFlags := CallbackCreate(GetMethod(implObj, "SetFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddDataBlock)
        CallbackFree(this.vtbl.CopyDataBlock)
        CallbackFree(this.vtbl.RemoveDataBlock)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.SetFlags)
    }
}

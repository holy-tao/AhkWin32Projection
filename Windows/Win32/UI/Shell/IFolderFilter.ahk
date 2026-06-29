#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellFolder.ahk" { IShellFolder }

/**
 * Exposed by a client to specify how to filter the enumeration of a Shell folder by a server application.
 * @remarks
 * This interface is most often used with <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a> to filter the contents of the tree view displayed in a folder selection dialog box. To use <b>IFolderFilter</b> with <b>SHBrowseForFolder</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-browseinfoa">BIF_NEWDIALOGSTYLE</a> flag must be set.
 * 
 * When your application calls <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a>, you become a client of the folder browser object. The folder browser object communicates with you by sending messages to a callback function, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762598(v=vs.85)">BrowseCallbackProc</a>. The <b>BFFM_IUNKNOWN</b> message handled by that callback function contains a pointer to the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. To filter the display of a folder's contents, do the following:
 * 
 *                 
 * 
 * <ol>
 * <li>Use the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method to request a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderfiltersite">IFolderFilterSite</a> interface.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfiltersite-setfilter">IFolderFilterSite::SetFilter</a>, passing it a pointer to your <b>IFolderFilter</b> interface.</li>
 * <li>The folder browser then queries <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-getenumflags">IFolderFilter::GetEnumFlags</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-shouldshow">IFolderFilter::ShouldShow</a> to determine how to filter the enumeration.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderfilter
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFolderFilter extends IUnknown {
    /**
     * The interface identifier for IFolderFilter
     * @type {Guid}
     */
    static IID := Guid("{9cc22886-dc8e-11d2-b1d0-00c04f8eeb3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShouldShow   : IntPtr
        GetEnumFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies whether an individual item should be allowed through the filter and which should be blocked.
     * @remarks
     * The host calls this method for each item in the folder referred to by <i>psf</i> or <i>pidlFolder</i>.
     * 
     * It is recommended that your implementation convert the <i>psf</i> and <i>pidlItem</i> information into an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>, which is easier to consume. The following example shows this:
     * 
     *                 
     * 
     * 
     * ```
     * STDMETHODIMP ShouldShow(IShellFolder *psf, 
     *                         PCIDLIST_ABSOLUTE pidlFolder, 
     *                         PCUITEMID_CHILD pidlItem)
     * {
     *     IShellItem *psi;
     * 
     *     HRESULT hr = SHCreateItemWithParent(NULL, psf, pidlItem, IID_PPV_ARGS(&psi));
     *     if (SUCCEEDED(hr))
     *     {
     *         // Determine here whether the item should be shown. This determination
     *         // is application-dependent.
     * 
     *         psi->Release();
     *     }
     * 
     *     return hr;
     * }
     * ```
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The PIDL of the folder.
     * @param {Pointer<ITEMIDLIST>} pidlItem Type: <b>PCUITEMID_CHILD</b>
     * 
     * The relative PIDL of the child item of <i>pidlFolder</i> in question.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the item should be shown, S_FALSE if it should not be shown, or a standard error code if an error is encountered. If an error is encountered, the item is not shown.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-shouldshow
     */
    ShouldShow(psf, pidlFolder, pidlItem) {
        result := ComCall(3, this, "ptr", psf, ITEMIDLIST.Ptr, pidlFolder, ITEMIDLIST.Ptr, pidlItem, "HRESULT")
        return result
    }

    /**
     * Allows a client to specify which classes of objects in a Shell folder should be enumerated. When used with SHBrowseForFolder, specifies the class or classes of items that should be shown in the dialog box tree view and which class or classes should not.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE </b>
     * 
     * The PIDL of the folder.
     * @param {Pointer<Integer>} pgrfFlags Type: <b>DWORD*</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a> values that specify the classes of object to enumerate.
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * A pointer to the host's window handle.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderfilter-getenumflags
     */
    GetEnumFlags(psf, pidlFolder, pgrfFlags) {
        pgrfFlagsMarshal := pgrfFlags is VarRef ? "uint*" : "ptr"

        phwnd := HWND()
        result := ComCall(4, this, "ptr", psf, ITEMIDLIST.Ptr, pidlFolder, HWND.Ptr, phwnd, pgrfFlagsMarshal, pgrfFlags, "HRESULT")
        return phwnd
    }

    Query(iid) {
        if (IFolderFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShouldShow := CallbackCreate(GetMethod(implObj, "ShouldShow"), flags, 4)
        this.vtbl.GetEnumFlags := CallbackCreate(GetMethod(implObj, "GetEnumFlags"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShouldShow)
        CallbackFree(this.vtbl.GetEnumFlags)
    }
}

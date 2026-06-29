#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exported by a host to allow clients to specify how to filter a Shell folder enumeration.
 * @remarks
 * The most common use of this interface is when your application calls <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a>. When you call this function, you become a client of the folder browser object. That object communicates with you by sending messages to a callback function, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb762598(v=vs.85)">BrowseCallbackProc</a>. The BFFM_IUNKNOWN message contains a pointer to the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. To filter folder enumeration:
 * 
 * 
 * 
 * <ol>
 * <li>Use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer to call the folder browser's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method, and request a pointer to the <b>IFolderFilterSite</b> interface.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderfiltersite-setfilter">IFolderFilterSite::SetFilter</a>, and pass the folder browser a pointer to your <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderfilter">IFolderFilter</a> (IUnknown or IFilterFolder?) interface.</li>
 * <li>The folder browser will then query the two methods of the <b>IFolderFilterSite</b> interface to determine how to filter the enumeration.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderfiltersite
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFolderFilterSite extends IUnknown {
    /**
     * The interface identifier for IFolderFilterSite
     * @type {Guid}
     */
    static IID := Guid("{c0a651f5-b48b-11d2-b5ed-006097c686f6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderFilterSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderFilterSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Exposed by a host to allow clients to pass the host their IUnknown interface pointers.
     * @remarks
     * After you get a pointer to the host's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderfiltersite">IFolderFilterSite</a> interface, call this method to pass the host a pointer to your <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. The host will then use this pointer to call your <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method to request a pointer to your <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderfilter">IFolderFilter</a> interface. If this call fails, <b>IFolderFilterSite::SetFilter</b> returns <b>E_NOINTERFACEAVAILABLE</b>. If the call is successful, the host will then call the <b>IFolderFilter</b> interface's two methods to determine how to enumerate the contents of the folder.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the client's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. To notify the host to terminate filtering and stop calling your <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderfilter">IFolderFilter</a> interface, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderfiltersite-setfilter
     */
    SetFilter(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFolderFilterSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFilter := CallbackCreate(GetMethod(implObj, "SetFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFilter)
    }
}

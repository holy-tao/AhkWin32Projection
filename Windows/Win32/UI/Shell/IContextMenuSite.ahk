#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by the default folder view created using SHCreateShellFolderView.
 * @remarks
 * The IID for this interface is <b>IID_IContextMenuSite</b>.
 * 
 * To acquire a context menu site pointer code that exists in the site chain of the folder view, use <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a> using <b>SID_SFolderView</b> to get to the folder view.
 * 
 * 
 * ```
 * CComPtr<IContextMenuSite> spcms;
 * hr = IUnknown_QueryService(_punkSite, SID_SFolderView, IID_PPV_ARGS(&spcms));
 * 
 * if (SUCCEEDED(hr))
 * {
 *     ...
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenusite
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IContextMenuSite extends IUnknown {
    /**
     * The interface identifier for IContextMenuSite
     * @type {Guid}
     */
    static IID := Guid("{0811aebe-0b87-4c54-9e72-548cf649016b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextMenuSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoContextMenuPopup : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextMenuSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * DoContextMenuPopup is no longer available for use as of Windows Server 2003.
     * @param {IUnknown} punkContextMenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the shortcut menu's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> implementation.
     * @param {Integer} fFlags Type: <b>UINT</b>
     * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * Location where you want the shortcut menu to appear. This point specifies the location of the menu's upper left corner in screen coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenusite-docontextmenupopup
     */
    DoContextMenuPopup(punkContextMenu, fFlags, pt) {
        result := ComCall(3, this, "ptr", punkContextMenu, "uint", fFlags, POINT, pt, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContextMenuSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoContextMenuPopup := CallbackCreate(GetMethod(implObj, "DoContextMenuPopup"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoContextMenuPopup)
    }
}

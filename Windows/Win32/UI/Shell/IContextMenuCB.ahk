#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\IShellFolder.ahk" { IShellFolder }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Exposes a method that enables the callback of a context menu. For example, to add a shield icon to a menuItem that requires elevation.
 * @remarks
 * This is the callback interface specified in the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-defcontextmenu">DEFCONTEXTMENU</a> structure passed with the function <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreatedefaultcontextmenu">SHCreateDefaultContextMenu</a>.
 * 
 * This interface enables <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> implementations to manage context menu messages before, after, and during the context menu handling of these messages.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenucb
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IContextMenuCB extends IUnknown {
    /**
     * The interface identifier for IContextMenuCB
     * @type {Guid}
     */
    static IID := Guid("{3409e930-5a39-11d1-83fa-00a0c90dc849}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextMenuCB interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CallBack : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextMenuCB.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables the callback function for a context menu.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface of the object that supports the <b>IContextMenuCB::CallBack</b> interface. The context menu interface is returned on a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">GetUIObjectOf</a>.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the owner of the context menu. This value can be <b>NULL</b>.
     * @param {IDataObject} pdtobj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> that contains information about a menu selection. Implement interface <b>IDataObject</b>, or call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreatedataobject">SHCreateDataObject</a> for the default implementation.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * A notification from the Shell's default menu implementation. For example, the default menu implementation calls <a href="https://docs.microsoft.com/windows/desktop/shell/registering-control-panel-items">DFM_MERGECONTEXTMENU</a> to allow the implementer of <b>IContextMenuCB::CallBack</b> to remove, add, or disable context menu items in this callback. Use one of the following notifications.
     * 
     *                     
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-mergecontextmenu">DFM_MERGECONTEXTMENU</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-invokecommand">DFM_INVOKECOMMAND</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-gethelptext">DFM_GETHELPTEXT</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-gethelptextw">DFM_GETHELPTEXTW</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-wm-measureitem">DFM_WM_MEASUREITEM</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-wm-drawitem">DFM_WM_DRAWITEM</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-wm-initmenupopup">DFM_WM_INITMENUPOPUP</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-validatecmd">DFM_VALIDATECMD</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-invokecommandex">DFM_INVOKECOMMANDEX</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-mapcommandname">DFM_MAPCOMMANDNAME</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-getdefstaticid">DFM_GETDEFSTATICID</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-getverb">DFM_GETVERB</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/shell/dfm-mergecontextmenu-bottom">DFM_MERGECONTEXTMENU_BOTTOM</a>
     * </td>
     * </tr>
     * </table>
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Data specific to the notification specified in <i>uMsg</i>. See the individual notification page for specific requirements.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Data specific to the notification specified in <i>uMsg</i>. See the individual notification page for specific requirements.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenucb-callback
     */
    CallBack(psf, hwndOwner, pdtobj, uMsg, _wParam, _lParam) {
        result := ComCall(3, this, "ptr", psf, HWND, hwndOwner, "ptr", pdtobj, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContextMenuCB.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CallBack := CallbackCreate(GetMethod(implObj, "CallBack"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CallBack)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IContextMenu.ahk" { IContextMenu }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Exposes methods that either create or merge a shortcut (context) menu associated with a Shell object. Extends IContextMenu by adding a method that allows client objects to handle messages associated with owner-drawn menu items.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> interface, from which it inherits.
 * 
 * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IContextMenu2</b> if your <a href="https://docs.microsoft.com/windows/desktop/shell/nse-works">namespace extension</a> or <a href="https://docs.microsoft.com/windows/desktop/shell/context-menu-handlers">shortcut menu handler</a> needs to process one or more of the following messages. 
 * 
 * 				
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-initmenupopup">WM_INITMENUPOPUP</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-drawitem">WM_DRAWITEM</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-measureitem">WM_MEASUREITEM</a>
 * </li>
 * </ul>
 * These messages are forwarded to <b>IContextMenu2</b>—through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu2-handlemenumsg">HandleMenuMsg</a> method—only if a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call for an <b>IContextMenu2</b> interface pointer is successful, indicating that the object supports this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Applications do not normally call this interface directly.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenu2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IContextMenu2 extends IContextMenu {
    /**
     * The interface identifier for IContextMenu2
     * @type {Guid}
     */
    static IID := Guid("{000214f4-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextMenu2 interfaces
    */
    struct Vtbl extends IContextMenu.Vtbl {
        HandleMenuMsg : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextMenu2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables client objects of the IContextMenu interface to handle messages associated with owner-drawn menu items.
     * @remarks
     * <b>IContextMenu2::HandleMenuMsg</b> is generally replaced by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu3-handlemenumsg2">HandleMenuMsg2</a>. <b>HandleMenuMsg2</b> is called when <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> determines that <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu3">IContextMenu3</a> is supported and receives one of the messages specified in the description of the <i>uMsg</i> parameter. However, in some cases, <b>IContextMenu2::HandleMenuMsg</b> is still called.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu2">IContextMenu2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu3">IContextMenu3</a> is needed, the best implementation for new context menus is to implement all their logic in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu3-handlemenumsg2">HandleMenuMsg2</a> and have their <b>IContextMenu2::HandleMenuMsg</b> implementation simply delegate the call to <b>HandleMenuMsg2</b> and pass <b>NULL</b> as the <i>plResult</i> parameter.
     * 
     * 
     * <div class="alert"><b>Note</b>  If <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu3">IContextMenu3</a> is not implemented, there is no guarantee that <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu2">IContextMenu2</a> will be called in its place. In some cases, the absence of <b>IContextMenu3</b> is determined and then the process is halted.
     *       </div>
     * <div> </div>
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message to be processed. In the case of some messages, such as WM_INITMENUPOPUP, WM_DRAWITEM, WM_MENUCHAR, or WM_MEASUREITEM, the client object being called may provide owner-drawn menu items.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional message information. The value of this parameter depends on the value of the <i>uMsg</i> parameter.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional message information. The value of this parameter depends on the value of the <i>uMsg</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu2-handlemenumsg
     */
    HandleMenuMsg(uMsg, _wParam, _lParam) {
        result := ComCall(6, this, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContextMenu2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleMenuMsg := CallbackCreate(GetMethod(implObj, "HandleMenuMsg"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleMenuMsg)
    }
}

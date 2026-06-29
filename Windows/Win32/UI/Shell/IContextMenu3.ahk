#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IContextMenu2.ahk" { IContextMenu2 }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Exposes methods that either create or merge a shortcut menu associated with a Shell object. Allows client objects to handle messages associated with owner-drawn menu items and extends IContextMenu2 by accepting a return value from that message handling.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu2">IContextMenu2</a> interfaces, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IContextMenu3</b> if your shortcut menu extension needs to process the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-menuchar">WM_MENUCHAR</a> message.
 * 
 * 			    
 * 
 * This message is forwarded to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu3-handlemenumsg2">IContextMenu3::HandleMenuMsg2</a> only if a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call for an <b>IContextMenu3</b> interface pointer is successful, which indicates that the object supports this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You do not call this interface directly. <b>IContextMenu3</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
 * 
 * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenu3
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IContextMenu3 extends IContextMenu2 {
    /**
     * The interface identifier for IContextMenu3
     * @type {Guid}
     */
    static IID := Guid("{bcfce0a0-ec17-11d0-8d10-00a0c90f2719}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextMenu3 interfaces
    */
    struct Vtbl extends IContextMenu2.Vtbl {
        HandleMenuMsg2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextMenu3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows client objects of the IContextMenu3 interface to handle messages associated with owner-drawn menu items.
     * @remarks
     * <b>IContextMenu3::HandleMenuMsg2</b> generally replaces <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu2-handlemenumsg">IContextMenu2::HandleMenuMsg</a>, and is called when <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a> determines that <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu3">IContextMenu3</a> is supported and one of the supported messages (see <i>uMsg</i>) has been received. However, in some cases, <b>IContextMenu2::HandleMenuMsg</b> is still called. Context menu hosts may dispatch menu messages through either or both methods. Consequently, if a Shell extension implements both <b>IContextMenu2::HandleMenuMsg</b> and <b>IContextMenu3::HandleMenuMsg2</b>, it must be prepared for menu messages to arrive through either method.
     * 
     * <div class="alert"><b>Note</b>  If <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu3">IContextMenu3</a> is not implemented, there is no guarantee that <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu2">IContextMenu2</a> will be called in its place. In some cases, the absence of <b>IContextMenu3</b> is determined and then the process is halted.</div>
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
     * @returns {LRESULT} Type: <b>LRESULT*</b>
     * 
     * The address of an <b>LRESULT</b> value that the owner of the menu will return from the message. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenu3-handlemenumsg2
     */
    HandleMenuMsg2(uMsg, _wParam, _lParam) {
        result := ComCall(7, this, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, LRESULT.Ptr, &plResult := 0, "HRESULT")
        return plResult
    }

    Query(iid) {
        if (IContextMenu3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleMenuMsg2 := CallbackCreate(GetMethod(implObj, "HandleMenuMsg2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleMenuMsg2)
    }
}

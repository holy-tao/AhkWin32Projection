#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PREVIEWHANDLERFRAMEINFO.ahk" { PREVIEWHANDLERFRAMEINFO }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\WindowsAndMessaging\MSG.ahk" { MSG }

/**
 * Enables preview handlers to pass keyboard shortcuts to the host. This interface retrieves a list of keyboard shortcuts and directs the host to handle a keyboard shortcut.
 * @remarks
 * This is an interface that preview handlers use to communicate keyboard shortcuts to the host. Preview handlers obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the pointer passed as a parameter to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">SetSite</a>. Preview handlers do not need to implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipreviewhandlerframe
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPreviewHandlerFrame extends IUnknown {
    /**
     * The interface identifier for IPreviewHandlerFrame
     * @type {Guid}
     */
    static IID := Guid("{fec87aaf-35f9-447a-adb7-20234491401a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPreviewHandlerFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWindowContext     : IntPtr
        TranslateAccelerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPreviewHandlerFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a list of the keyboard shortcuts for the preview host.
     * @remarks
     * An accelerator table is a list of keyboard shortcuts and the commands that the host should execute. As an optimization, the preview handler can then look at the keystrokes it receives, check them against the accelerator table to see if the host is interested in them, and forward them on if appropriate, ignoring the commands in the structure. The accelerator table returned from <b>IPreviewHandlerFrame::GetWindowContext</b>, contains only keystrokes and does not contain valid command entries. Preview handlers can also skip this optimization and simply call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-translateaccelerator">IPreviewHandlerFrame::TranslateAccelerator</a> for every keystroke. When the preview handler is destroyed, the accelerator table must be freed using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyacceleratortable">DestroyAcceleratorTable</a> function.
     * 
     * This method should be called at the point when the preview handler has called <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iobjectwithsite-setsite">SetSite</a> and the results have been cached for later use by the preview handler. This method cannot be called by preview handlers running in low-integrity mode.  Those preview handlers must always call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-translateaccelerator">IPreviewHandlerFrame::TranslateAccelerator</a> for every keystroke.
     * @returns {PREVIEWHANDLERFRAMEINFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-previewhandlerframeinfo">PREVIEWHANDLERFRAMEINFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-previewhandlerframeinfo">PREVIEWHANDLERFRAMEINFO</a> structure that receives accelerator table information.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-getwindowcontext
     */
    GetWindowContext() {
        pinfo := PREVIEWHANDLERFRAMEINFO()
        result := ComCall(3, this, PREVIEWHANDLERFRAMEINFO.Ptr, pinfo, "HRESULT")
        return pinfo
    }

    /**
     * Directs the host to handle a keyboard shortcut passed from the preview handler.
     * @remarks
     * <div class="alert"><b>Note</b>  This method is only called by a preview handler in response to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ipreviewhandler-translateaccelerator">TranslateAccelerator</a> call.</div>
     * <div> </div>
     * @param {Pointer<MSG>} pmsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> or <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-syscommand">WM_SYSCOMMAND</a> window message that corresponds to a keyboard shortcut.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the keyboard shortcut is one that the host intends to handle, the host will process it and return <b>S_OK</b>; otherwise, it returns <b>S_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlerframe-translateaccelerator
     */
    TranslateAccelerator(pmsg) {
        result := ComCall(4, this, MSG.Ptr, pmsg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPreviewHandlerFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWindowContext := CallbackCreate(GetMethod(implObj, "GetWindowContext"), flags, 2)
        this.vtbl.TranslateAccelerator := CallbackCreate(GetMethod(implObj, "TranslateAccelerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWindowContext)
        CallbackFree(this.vtbl.TranslateAccelerator)
    }
}

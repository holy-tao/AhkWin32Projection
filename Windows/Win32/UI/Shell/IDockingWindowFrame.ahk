#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\IOleWindow.ahk" { IOleWindow }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that support the addition of IDockingWindow objects to a frame. Implemented by the browser.
 * @remarks
 * <b>IDockingWindowFrame</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a>. See the following topics for details on these methods also available to <b>IDockingWindowFrame</b> through that inheritance.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Additional IDockingWindowFrame Methods</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-getwindow">IOleWindow::GetWindow</a>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-contextsensitivehelp">IOleWindow::ContextSensitiveHelp</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * You do not typically implement the <b>IDockingWindowFrame</b> interface. The Shell browser implements this interface to support docked windows inside the browser frame.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You use <b>IDockingWindowFrame</b> to add, find, and remove docking window objects in a browser frame.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-idockingwindowframe
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDockingWindowFrame extends IOleWindow {
    /**
     * The interface identifier for IDockingWindowFrame
     * @type {Guid}
     */
    static IID := Guid("{47d2657a-7b27-11d0-8ca9-00a0c92dbfe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDockingWindowFrame interfaces
    */
    struct Vtbl extends IOleWindow.Vtbl {
        AddToolbar    : IntPtr
        RemoveToolbar : IntPtr
        FindToolbar   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDockingWindowFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds the specified IDockingWindow object to the frame.
     * @param {IUnknown} punkSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> object to be added.
     * @param {PWSTR} pwszItem Type: <b>PCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode, application-defined string that is used to identify the docking window object.
     * @param {Integer} dwAddFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idockingwindowframe-addtoolbar
     */
    AddToolbar(punkSrc, pwszItem, dwAddFlags) {
        pwszItem := pwszItem is String ? StrPtr(pwszItem) : pwszItem

        result := ComCall(5, this, "ptr", punkSrc, "ptr", pwszItem, "uint", dwAddFlags, "HRESULT")
        return result
    }

    /**
     * Removes the specified IDockingWindow from the toolbar frame.
     * @param {IUnknown} punkSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> object to be removed. The <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nn-shlobj-idockingwindowframe">IDockingWindowFrame</a> implementation calls the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idockingwindow-closedw">IDockingWindow::CloseDW</a> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IDockingWindow::Release</a> methods.
     * @param {Integer} dwRemoveFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idockingwindowframe-removetoolbar
     */
    RemoveToolbar(punkSrc, dwRemoveFlags) {
        result := ComCall(6, this, "ptr", punkSrc, "uint", dwRemoveFlags, "HRESULT")
        return result
    }

    /**
     * Finds the specified IDockingWindow object in the toolbar frame and returns an interface pointer to it.
     * @param {PWSTR} pwszItem Type: <b>PCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode, application-defined string used to identify the object. This is the same string that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nf-shlobj-idockingwindowframe-addtoolbar">AddToolbar</a> method.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired interface ID. This is typically IID_IDockingWindow.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a>. If an error occurs, this value receives a null pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idockingwindowframe-findtoolbar
     */
    FindToolbar(pwszItem, riid) {
        pwszItem := pwszItem is String ? StrPtr(pwszItem) : pwszItem

        result := ComCall(7, this, "ptr", pwszItem, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IDockingWindowFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddToolbar := CallbackCreate(GetMethod(implObj, "AddToolbar"), flags, 4)
        this.vtbl.RemoveToolbar := CallbackCreate(GetMethod(implObj, "RemoveToolbar"), flags, 3)
        this.vtbl.FindToolbar := CallbackCreate(GetMethod(implObj, "FindToolbar"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddToolbar)
        CallbackFree(this.vtbl.RemoveToolbar)
        CallbackFree(this.vtbl.FindToolbar)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\IOleWindow.ahk" { IOleWindow }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Exposes methods that notify the docking window object of changes, including showing, hiding, and impending removal. This interface is implemented by window objects that can be docked within the border space of a Windows Explorer window.
 * @remarks
 * <b>IDockingWindow</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a>. See the following topics for details on these methods also available to <b>IDockingWindow</b> through that inheritance.
 * 
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Additional IDockingWindow Methods</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-getwindow">IDockingWindow::GetWindow</a>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-contextsensitivehelp">IDockingWindow::ContextSensitiveHelp</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IDockingWindow</b> when you want to display a window inside a browser frame. This is typically used for user interface windows, such as toolbars.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You do not usually use the <b>IDockingWindow</b> interface directly. The Shell browser uses this interface to support docked windows inside the browser frame.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idockingwindow
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDockingWindow extends IOleWindow {
    /**
     * The interface identifier for IDockingWindow
     * @type {Guid}
     */
    static IID := Guid("{012dd920-7b26-11d0-8ca9-00a0c92dbfe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDockingWindow interfaces
    */
    struct Vtbl extends IOleWindow.Vtbl {
        ShowDW         : IntPtr
        CloseDW        : IntPtr
        ResizeBorderDW : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDockingWindow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Instructs the docking window object to show or hide itself.
     * @param {BOOL} fShow Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the docking window object should show its window. <b>FALSE</b> if the docking window object should hide its window and return its border space by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-idockingwindowsite-setborderspacedw">SetBorderSpaceDW</a> with zero values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idockingwindow-showdw
     */
    ShowDW(fShow) {
        result := ComCall(5, this, BOOL, fShow, "HRESULT")
        return result
    }

    /**
     * Notifies the docking window object that it is about to be removed from the frame. The docking window object should save any persistent information at this time.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved. This parameter should always be zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idockingwindow-closedw
     */
    CloseDW(dwReserved) {
        result := ComCall(6, this, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Notifies the docking window object that the frame's border space has changed. In response to this method, the IDockingWindow implementation must call SetBorderSpaceDW, even if no border space is required or a change is not necessary.
     * @remarks
     * The <i>prcBorder</i> parameter contains the frame's entire available border space. The docking window object should negotiate its border space and then use this information to position itself.
     * 
     * For example, if the docking window object requires 25 pixels at the top of the border space, it should negotiate for this through the following steps:
     * 
     *                 
     * 
     * <ol>
     * <li>Allocate a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure and set its <b>top</b> member to 25.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-idockingwindowsite-requestborderspacedw">RequestBorderSpaceDW</a> to request the space.</li>
     * <li>If the request is approved by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-idockingwindowsite-requestborderspacedw">RequestBorderSpaceDW</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-idockingwindowsite-setborderspacedw">SetBorderSpaceDW</a> to allocate the space.</li>
     * </ol>
     *  
     *                 
     *                 The docking window object can then position its window at prcBorder-&gt;left and prcBorder-&gt;top. The width of the docking window object's window is determined by subtracting prcBorder-&gt;left from prcBorder-&gt;right. Its height is contained in the <b>top</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure.
     * @param {Pointer<RECT>} prcBorder Type: <b>LPCRECT</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the frame's available border space.
     * @param {IUnknown} punkToolbarSite Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the site's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. The docking window object should call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method for this interface, requesting IID_IDockingWindowSite. The docking window object then uses that interface to negotiate its border space. It is the docking window object's responsibility to release this interface when it is no longer needed.
     * @param {BOOL} fReserved Type: <b>BOOL</b>
     * 
     * Reserved. This parameter should always be zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idockingwindow-resizeborderdw
     */
    ResizeBorderDW(prcBorder, punkToolbarSite, fReserved) {
        result := ComCall(7, this, RECT.Ptr, prcBorder, "ptr", punkToolbarSite, BOOL, fReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDockingWindow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowDW := CallbackCreate(GetMethod(implObj, "ShowDW"), flags, 2)
        this.vtbl.CloseDW := CallbackCreate(GetMethod(implObj, "CloseDW"), flags, 2)
        this.vtbl.ResizeBorderDW := CallbackCreate(GetMethod(implObj, "ResizeBorderDW"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowDW)
        CallbackFree(this.vtbl.CloseDW)
        CallbackFree(this.vtbl.ResizeBorderDW)
    }
}

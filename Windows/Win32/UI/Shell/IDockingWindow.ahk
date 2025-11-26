#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Exposes methods that notify the docking window object of changes, including showing, hiding, and impending removal. This interface is implemented by window objects that can be docked within the border space of a Windows Explorer window.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idockingwindow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDockingWindow extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDockingWindow
     * @type {Guid}
     */
    static IID => Guid("{012dd920-7b26-11d0-8ca9-00a0c92dbfe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowDW", "CloseDW", "ResizeBorderDW"]

    /**
     * Instructs the docking window object to show or hide itself.
     * @param {BOOL} fShow Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the docking window object should show its window. <b>FALSE</b> if the docking window object should hide its window and return its border space by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-idockingwindowsite-setborderspacedw">SetBorderSpaceDW</a> with zero values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idockingwindow-showdw
     */
    ShowDW(fShow) {
        result := ComCall(5, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * Notifies the docking window object that it is about to be removed from the frame. The docking window object should save any persistent information at this time.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved. This parameter should always be zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idockingwindow-closedw
     */
    CloseDW(dwReserved) {
        result := ComCall(6, this, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Notifies the docking window object that the frame's border space has changed. In response to this method, the IDockingWindow implementation must call SetBorderSpaceDW, even if no border space is required or a change is not necessary.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idockingwindow-resizeborderdw
     */
    ResizeBorderDW(prcBorder, punkToolbarSite, fReserved) {
        result := ComCall(7, this, "ptr", prcBorder, "ptr", punkToolbarSite, "int", fReserved, "HRESULT")
        return result
    }
}

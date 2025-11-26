#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Exposes methods that manage the border space for one or more IDockingWindow objects. This interface is implemented by the browser and is similar to the IOleInPlaceUIWindow interface.
 * @remarks
 * 
 * <b>IDockingWindowSite</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a>. See the following topics for details on these methods also available to <b>IDockingWindowSite</b> through that inheritance.
 * 
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Additional IDockingWindowSite Methods</th>
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
 * You do not typically implement the <b>IDockingWindowSite</b> interface. The Shell browser implements this interface to support docked windows inside the browser frame.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You use <b>IDockingWindowSite</b> to negotiate the space for a docking window object in a browser frame.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-idockingwindowsite
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDockingWindowSite extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDockingWindowSite
     * @type {Guid}
     */
    static IID => Guid("{2a342fc2-7b26-11d0-8ca9-00a0c92dbfe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBorderDW", "RequestBorderSpaceDW", "SetBorderSpaceDW"]

    /**
     * Gets the border space allocated for the specified IDockingWindow object.
     * @param {IUnknown} punkObj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> object for which the border space is being requested.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a structure that, when this method returns successfully, receives the entire available border space for the browser. The docking window object should use this information to determine where to place itself. See the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idockingwindow-resizeborderdw">IDockingWindow::ResizeBorderDW</a> method for more information.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-idockingwindowsite-getborderdw
     */
    GetBorderDW(punkObj) {
        prcBorder := RECT()
        result := ComCall(5, this, "ptr", punkObj, "ptr", prcBorder, "HRESULT")
        return prcBorder
    }

    /**
     * Approves, modifies, or refuses a request for an IDockingWindow object's border space. The border space is not allocated until the SetBorderSpaceDW method is called.
     * @param {IUnknown} punkObj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> object for which the border space is being requested.
     * @param {Pointer<RECT>} pbw Type: <b>LPCBORDERWIDTHS</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure. Before calling this method, the structure must be filled with the desired border space. After the method returns successfully, the structure contains the approved border space. The <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-idockingwindowsite">IDockingWindowSite</a> object may change these values. If border space is critical, it is the caller's responsibility to determine if the returned border space is sufficient.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the border space request is approved or modified, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-idockingwindowsite-requestborderspacedw
     */
    RequestBorderSpaceDW(punkObj, pbw) {
        result := ComCall(6, this, "ptr", punkObj, "ptr", pbw, "HRESULT")
        return result
    }

    /**
     * Allocates and reserves border space for an IDockingWindow object.
     * @param {IUnknown} punkObj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> object for which the border space is being set.
     * @param {Pointer<RECT>} pbw Type: <b>LPCBORDERWIDTHS</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure that contains the coordinates of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> object's border space. The border space should be approved through a successful call to the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-idockingwindowsite-requestborderspacedw">IDockingWindowSite::RequestBorderSpaceDW</a> method before <b>SetBorderSpaceDW</b> is called with these coordinates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-idockingwindowsite-setborderspacedw
     */
    SetBorderSpaceDW(punkObj, pbw) {
        result := ComCall(7, this, "ptr", punkObj, "ptr", pbw, "HRESULT")
        return result
    }
}

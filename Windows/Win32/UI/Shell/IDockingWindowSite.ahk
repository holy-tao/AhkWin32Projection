#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IUnknown} punkObj 
     * @param {Pointer<RECT>} prcBorder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-idockingwindowsite-getborderdw
     */
    GetBorderDW(punkObj, prcBorder) {
        result := ComCall(5, this, "ptr", punkObj, "ptr", prcBorder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkObj 
     * @param {Pointer<RECT>} pbw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-idockingwindowsite-requestborderspacedw
     */
    RequestBorderSpaceDW(punkObj, pbw) {
        result := ComCall(6, this, "ptr", punkObj, "ptr", pbw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkObj 
     * @param {Pointer<RECT>} pbw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-idockingwindowsite-setborderspacedw
     */
    SetBorderSpaceDW(punkObj, pbw) {
        result := ComCall(7, this, "ptr", punkObj, "ptr", pbw, "HRESULT")
        return result
    }
}

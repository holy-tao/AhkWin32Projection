#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Exposes methods that support the addition of IDockingWindow objects to a frame. Implemented by the browser.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-idockingwindowframe
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDockingWindowFrame extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDockingWindowFrame
     * @type {Guid}
     */
    static IID => Guid("{47d2657a-7b27-11d0-8ca9-00a0c92dbfe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddToolbar", "RemoveToolbar", "FindToolbar"]

    /**
     * 
     * @param {IUnknown} punkSrc 
     * @param {PWSTR} pwszItem 
     * @param {Integer} dwAddFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idockingwindowframe-addtoolbar
     */
    AddToolbar(punkSrc, pwszItem, dwAddFlags) {
        pwszItem := pwszItem is String ? StrPtr(pwszItem) : pwszItem

        result := ComCall(5, this, "ptr", punkSrc, "ptr", pwszItem, "uint", dwAddFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkSrc 
     * @param {Integer} dwRemoveFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idockingwindowframe-removetoolbar
     */
    RemoveToolbar(punkSrc, dwRemoveFlags) {
        result := ComCall(6, this, "ptr", punkSrc, "uint", dwRemoveFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszItem 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idockingwindowframe-findtoolbar
     */
    FindToolbar(pwszItem, riid, ppv) {
        pwszItem := pwszItem is String ? StrPtr(pwszItem) : pwszItem

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pwszItem, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}

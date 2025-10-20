#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICommDlgBrowser.ahk

/**
 * Extends the capabilities of ICommDlgBrowser. This interface is exposed by the common file dialog boxes when they host a Shell browser. A pointer to ICommDlgBrowser2 can be obtained by calling QueryInterface on the IShellBrowser object.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser">ICommDlgBrowser</a> interface, from which it inherits.
  * 
  * <div class="alert"><b>Note</b>  In Windows XP and earlier, this interface was defined in Shlobj.h.</div>
  * <div> </div>
  * This interface is implemented only by common file dialog boxes.
  * 
  * Use <b>ICommDlgBrowser2</b> when your Shell view is hosted inside a common dialog box.
  * 
  * <b>ICommDlgBrowser2</b> implements all the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser">ICommDlgBrowser</a> methods, as well as <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed methods are specific to <b>ICommDlgBrowser2</b>.
  * 
  * <div class="alert"><b>Note</b>  <b>Windows Vista and later.</b> Prior to Windows Vista this interface was declared in Shlobj.h.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icommdlgbrowser2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICommDlgBrowser2 extends ICommDlgBrowser{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommDlgBrowser2
     * @type {Guid}
     */
    static IID => Guid("{10339516-2894-11d2-9039-00c04f8eeb3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify", "GetDefaultMenuText", "GetViewFlags"]

    /**
     * 
     * @param {IShellView} ppshv 
     * @param {Integer} dwNotifyType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-notify
     */
    Notify(ppshv, dwNotifyType) {
        result := ComCall(6, this, "ptr", ppshv, "uint", dwNotifyType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} ppshv 
     * @param {PWSTR} pszText 
     * @param {Integer} cchMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getdefaultmenutext
     */
    GetDefaultMenuText(ppshv, pszText, cchMax) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", ppshv, "ptr", pszText, "int", cchMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getviewflags
     */
    GetViewFlags(pdwFlags) {
        result := ComCall(8, this, "uint*", pdwFlags, "HRESULT")
        return result
    }
}

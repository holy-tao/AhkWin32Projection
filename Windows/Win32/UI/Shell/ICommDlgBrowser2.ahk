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
     * Called by a Shell view to notify the common dialog box hosting it that an event has occurred.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @param {Integer} dwNotifyType Type: <b>DWORD</b>
     * 
     * A flag that can can take one of the following two values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-notify
     */
    Notify(ppshv, dwNotifyType) {
        result := ComCall(6, this, "ptr", ppshv, "uint", dwNotifyType, "HRESULT")
        return result
    }

    /**
     * Called by the Shell view to get the default shortcut menu text.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @param {PWSTR} pszText Type: <b>WCHAR*</b>
     * 
     * A pointer to a buffer that is used by the Shell browser to return the default shortcut menu text.
     * @param {Integer} cchMax Type: <b>int</b>
     * 
     * The size of the <i>pszText</i> buffer, in characters. It should be at least the maximum allowable path length (MAX_PATH) in size.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if a new default shortcut menu text was returned in <i>pshv</i>. If S_FALSE is returned, use the normal default text. Otherwise, returns a standard COM error value.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getdefaultmenutext
     */
    GetDefaultMenuText(ppshv, pszText, cchMax) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", ppshv, "ptr", pszText, "int", cchMax, "HRESULT")
        return result
    }

    /**
     * Called when the view must determine if special customization needs to be made for the common dialog browser.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a <b>DWORD</b> value that controls the behavior of the view when in common dialog mode.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getviewflags
     */
    GetViewFlags() {
        result := ComCall(8, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}

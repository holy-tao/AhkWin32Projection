#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve the view state of the Control Panel, the path of individual Control Panel items, and that open either the Control Panel itself or an individual Control Panel item.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iopencontrolpanel
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IOpenControlPanel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenControlPanel
     * @type {Guid}
     */
    static IID => Guid("{d11ad862-66de-4df4-bf6c-1f5621996af1}")

    /**
     * The class identifier for OpenControlPanel
     * @type {Guid}
     */
    static CLSID => Guid("{06622d85-6856-4460-8de1-a81921b41c4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "GetPath", "GetCurrentView"]

    /**
     * Opens the specified Control Panel item, optionally to a specific page.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the item's canonical name as a Unicode string. This parameter is optional and can be <b>NULL</b>. If the calling application passes <b>NULL</b>, then the Control Panel itself opens. For a complete list of Control Panel item canonical names, see <a href="https://docs.microsoft.com/windows/desktop/shell/controlpanel-canonical-names">Canonical Names of Control Panel Items</a>.
     * @param {PWSTR} pszPage Type: <b>LPCWSTR</b>
     * 
     * A pointer to the name of the page within the item to display. This string is appended to the end of the path for Shell folder Control Panel items or appended as a command-line parameter for Control Panel (.cpl) file items. This parameter can be <b>NULL</b>, in which case the first page is shown.
     * @param {IUnknown} punkSite Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the site for navigating in-frame for Shell folder Control Panel items. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iopencontrolpanel-open
     */
    Open(pszName, pszPage, punkSite) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszPage := pszPage is String ? StrPtr(pszPage) : pszPage

        result := ComCall(3, this, "ptr", pszName, "ptr", pszPage, "ptr", punkSite, "HRESULT")
        return result
    }

    /**
     * Gets the path of a specified Control Panel item.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the item's canonical name or its <b>GUID</b>. This value can be <b>NULL</b>. See Remarks for further details. For a complete list of Control Panel item canonical names, see <a href="https://docs.microsoft.com/windows/desktop/shell/controlpanel-canonical-names">Canonical Names of Control Panel Items</a>.
     * @param {PWSTR} pszPath Type: <b>LPWSTR</b>
     * 
     * When this method returns, contains the path of the specified Control Panel item as a Unicode string.
     * @param {Integer} cchPath Type: <b>UINT</b>
     * 
     * The size of the buffer pointed to by <i>pszPath</i>, in WCHARs.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iopencontrolpanel-getpath
     */
    GetPath(pszName, pszPath, cchPath) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszName, "ptr", pszPath, "uint", cchPath, "HRESULT")
        return result
    }

    /**
     * Gets the most recent Control Panel view:\_Classic view or Category view.
     * @returns {Integer} Type: <b>CPVIEW*</b>
     * 
     * A pointer that receives the most recent view. Valid values are as follows:
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iopencontrolpanel-getcurrentview
     */
    GetCurrentView() {
        result := ComCall(5, this, "int*", &pView := 0, "HRESULT")
        return pView
    }
}

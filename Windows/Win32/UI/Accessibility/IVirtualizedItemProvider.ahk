#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to virtualized items, which are items that are represented by placeholder automation elements in the Microsoft UI Automation tree.
 * @remarks
 * 
 * A virtualized item is typically an item in a virtual list; that is, a list that does not manage its own data. When an application retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> for a virtualized item by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationitemcontainerpattern-finditembyproperty">FindItemByProperty</a>, UI Automation calls the provider's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iitemcontainerprovider-finditembyproperty">FindItemByProperty</a>, where the provider may return a placeholder element that also implements <b>IVirtualizedItemProvider</b>. On a call to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvirtualizeditempattern-realize">Realize</a>, the provider's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-ivirtualizeditemprovider-realize">Realize</a> returns a full UI Automation element reference and may also scroll the item into view.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-ivirtualizeditemprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IVirtualizedItemProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualizedItemProvider
     * @type {Guid}
     */
    static IID => Guid("{cb98b665-2d35-4fac-ad35-f3c60d0c0b8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Realize"]

    /**
     * Makes the virtual item fully accessible as a UI Automation element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ivirtualizeditemprovider-realize
     */
    Realize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}

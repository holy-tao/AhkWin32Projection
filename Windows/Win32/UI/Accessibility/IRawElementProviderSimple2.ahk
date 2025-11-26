#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk

/**
 * Extends the IRawElementProviderSimple interface to enable programmatically invoking context menus.
 * @remarks
 * 
 * This interface can be implemented on:
 * 			
 * 
 * <ul>
 * <li>Providers that add or override properties or control patterns on a UI element that already has a provider.</li>
 * </ul>
 *  If no context menu is available directly on the element on which <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple2-showcontextmenu">ShowContextMenu</a>  was invoked, the provider should attempt to invoke a context menu on the UI Automation parent of the current item.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementprovidersimple2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderSimple2 extends IRawElementProviderSimple{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderSimple2
     * @type {Guid}
     */
    static IID => Guid("{a0a839a9-8da1-4a82-806a-8e0d44e79f56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContextMenu"]

    /**
     * Programmatically invokes a context menu on the target element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irawelementprovidersimple2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}

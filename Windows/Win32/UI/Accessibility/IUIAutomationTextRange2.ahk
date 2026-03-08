#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange.ahk

/**
 * Extends the IUIAutomationTextRange interface to enable Microsoft UI Automation clients to programmatically invoke context menus.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRange2 extends IUIAutomationTextRange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextRange2
     * @type {Guid}
     */
    static IID => Guid("{bb9b40e0-5e04-46bd-9be0-4b601b9afad4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContextMenu"]

    /**
     * Programmatically invokes a context menu on the target text range.
     * @remarks
     * This method returns an error code if the context menu could not be invoked. If no context menu is available directly on the text range on which it was invoked, the Microsoft UI Automation system might attempt to invoke a context menu on the UI Automation parent of the current item.
     * 
     * The context menus themselves fire menu opened / closed events when they are invoked and dismissed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}

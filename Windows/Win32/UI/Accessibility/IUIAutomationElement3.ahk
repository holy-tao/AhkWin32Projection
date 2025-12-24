#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement2.ahk

/**
 * Extends the IUIAutomationElement2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement3
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement3 extends IUIAutomationElement2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement3
     * @type {Guid}
     */
    static IID => Guid("{8471df34-aee0-4a01-a7de-7db9af12c296}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 91

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContextMenu", "get_CurrentIsPeripheral", "get_CachedIsPeripheral"]

    /**
     * @type {BOOL} 
     */
    CurrentIsPeripheral {
        get => this.get_CurrentIsPeripheral()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsPeripheral {
        get => this.get_CachedIsPeripheral()
    }

    /**
     * Programmatically invokes a context menu on the target element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement3-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(91, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the current peripheral UI indicator for the element.
     * @remarks
     * 
     * When the <b>IsPeripheral</b> property is <b>TRUE</b>, a client application can't assume that focus was taken by the element even if it's currently keyboard-interactive.
     * 
     * This property is relevant for these control types:
     * 
     * <ul>
     * <li><b>UIA_GroupControlTypeId</b></li>
     * <li><b>UIA_MenuControlTypeId</b></li>
     * <li><b>UIA_PaneControlTypeId</b></li>
     * <li><b>UIA_ToolBarControlTypeId</b></li>
     * <li><b>UIA_ToolTipControlTypeId</b></li>
     * <li><b>UIA_WindowControlTypeId</b></li>
     * <li><b>UIA_CustomControlTypeId</b></li>
     * </ul>
     * The appearance of peripheral UI often triggers one of these events, if the peripheral UI supports one of the relevant patterns:
     * 
     * <ul>
     * <li><b>WindowOpened</b> (<b>UIA_Window_WindowOpenedEventId</b>)</li>
     * <li><b>MenuOpened</b> (<b>UIA_MenuOpenedEventId</b>)</li>
     * <li><b>ToolTipOpened</b> (<b>UIA_ToolTipOpenedEventId</b>)</li>
     * </ul>
     * When client applications that are assistive technologies handle one of these events, the client should check the value of <b>CurrentIsPeripheral</b>. If the value is <b>TRUE</b>, the client may need to provide an alternative representation of the peripheral UI that the user can reach with a single action, because the client can't use changed focus as an indicator of new UI or a UI of interest. The peripheral UI won't otherwise exist in the control view, tab sequence and so on. A client is guaranteed that only one peripheral UI item exists in the overall tree at any one time, opening another would close the first one automatically.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement3-get_currentisperipheral
     */
    get_CurrentIsPeripheral() {
        result := ComCall(92, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached peripheral UI indicator for the element.
     * @remarks
     * 
     * When the <b>IsPeripheral</b> property is <b>TRUE</b>, a client application can't assume that focus was taken by the element even if it's currently keyboard-interactive.
     * 
     * This property is relevant for these control types:
     * 
     * <ul>
     * <li><b>UIA_GroupControlTypeId</b></li>
     * <li><b>UIA_MenuControlTypeId</b></li>
     * <li><b>UIA_PaneControlTypeId</b></li>
     * <li><b>UIA_ToolBarControlTypeId</b></li>
     * <li><b>UIA_ToolTipControlTypeId</b></li>
     * <li><b>UIA_WindowControlTypeId</b></li>
     * <li><b>UIA_CustomControlTypeId</b></li>
     * </ul>
     * The appearance of peripheral UI often triggers one of these events, if the peripheral UI supports one of the relevant patterns:
     * 
     * <ul>
     * <li><b>WindowOpened</b> (<b>UIA_Window_WindowOpenedEventId</b>)</li>
     * <li><b>MenuOpened</b> (<b>UIA_MenuOpenedEventId</b>)</li>
     * <li><b>ToolTipOpened</b> (<b>UIA_ToolTipOpenedEventId</b>)</li>
     * </ul>
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement3-get_cachedisperipheral
     */
    get_CachedIsPeripheral() {
        result := ComCall(93, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}

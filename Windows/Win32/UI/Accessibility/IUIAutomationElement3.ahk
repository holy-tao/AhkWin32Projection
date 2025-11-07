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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement3-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(91, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement3-get_currentisperipheral
     */
    get_CurrentIsPeripheral() {
        result := ComCall(92, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement3-get_cachedisperipheral
     */
    get_CachedIsPeripheral() {
        result := ComCall(93, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}

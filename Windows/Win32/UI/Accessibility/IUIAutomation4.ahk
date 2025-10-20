#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomation3.ahk

/**
 * Extends the IUIAutomation3 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomation4
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomation4 extends IUIAutomation3{
    /**
     * The interface identifier for IUIAutomation4
     * @type {Guid}
     */
    static IID => Guid("{1189c02a-05f8-4319-8e21-e817e3db2860}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 66

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Integer} scope 
     * @param {Pointer<Int32>} changeTypes 
     * @param {Integer} changesCount 
     * @param {Pointer<IUIAutomationCacheRequest>} pCacheRequest 
     * @param {Pointer<IUIAutomationChangesEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddChangesEventHandler(element, scope, changeTypes, changesCount, pCacheRequest, handler) {
        result := ComCall(66, this, "ptr", element, "int", scope, "int*", changeTypes, "int", changesCount, "ptr", pCacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationChangesEventHandler>} handler 
     * @returns {HRESULT} 
     */
    RemoveChangesEventHandler(element, handler) {
        result := ComCall(67, this, "ptr", element, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

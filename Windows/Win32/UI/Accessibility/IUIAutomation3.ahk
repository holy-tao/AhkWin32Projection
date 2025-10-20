#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomation2.ahk

/**
 * Extends the IUIAutomation2 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomation3
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomation3 extends IUIAutomation2{
    /**
     * The interface identifier for IUIAutomation3
     * @type {Guid}
     */
    static IID => Guid("{73d768da-9b51-4b89-936e-c209290973e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 64

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Integer} scope 
     * @param {Integer} textEditChangeType 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationTextEditTextChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddTextEditTextChangedEventHandler(element, scope, textEditChangeType, cacheRequest, handler) {
        result := ComCall(64, this, "ptr", element, "int", scope, "int", textEditChangeType, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationTextEditTextChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    RemoveTextEditTextChangedEventHandler(element, handler) {
        result := ComCall(65, this, "ptr", element, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

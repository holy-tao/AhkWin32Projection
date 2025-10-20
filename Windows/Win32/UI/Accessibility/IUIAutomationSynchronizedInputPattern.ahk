#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the keyboard or mouse input of a control.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationsynchronizedinputpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSynchronizedInputPattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationSynchronizedInputPattern
     * @type {Guid}
     */
    static IID => Guid("{2233be0b-afb7-448b-9fda-3b378aa5eae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} inputType 
     * @returns {HRESULT} 
     */
    StartListening(inputType) {
        result := ComCall(3, this, "int", inputType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

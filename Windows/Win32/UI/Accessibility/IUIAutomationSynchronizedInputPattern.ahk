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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartListening", "Cancel"]

    /**
     * 
     * @param {Integer} inputType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationsynchronizedinputpattern-startlistening
     */
    StartListening(inputType) {
        result := ComCall(3, this, "int", inputType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationsynchronizedinputpattern-cancel
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}

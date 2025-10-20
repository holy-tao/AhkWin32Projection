#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables Microsoft UI Automation client applications to direct the mouse or keyboard input to a specific UI element.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-isynchronizedinputprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISynchronizedInputProvider extends IUnknown{
    /**
     * The interface identifier for ISynchronizedInputProvider
     * @type {Guid}
     */
    static IID => Guid("{29db1a06-02ce-4cf7-9b42-565d4fab20ee}")

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

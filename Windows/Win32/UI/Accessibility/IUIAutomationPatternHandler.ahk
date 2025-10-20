#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns a client API wrapper object and to unmarshal property and method requests to an actual provider instance.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iuiautomationpatternhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationPatternHandler extends IUnknown{
    /**
     * The interface identifier for IUIAutomationPatternHandler
     * @type {Guid}
     */
    static IID => Guid("{d97022f3-a947-465e-8b2a-ac4315fa54e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationPatternInstance>} pPatternInstance 
     * @param {Pointer<IUnknown>} pClientWrapper 
     * @returns {HRESULT} 
     */
    CreateClientWrapper(pPatternInstance, pClientWrapper) {
        result := ComCall(3, this, "ptr", pPatternInstance, "ptr", pClientWrapper, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pTarget 
     * @param {Integer} index 
     * @param {Pointer<UIAutomationParameter>} pParams 
     * @param {Integer} cParams 
     * @returns {HRESULT} 
     */
    Dispatch(pTarget, index, pParams, cParams) {
        result := ComCall(4, this, "ptr", pTarget, "uint", index, "ptr", pParams, "uint", cParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

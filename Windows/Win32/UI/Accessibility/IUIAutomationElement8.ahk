#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement7.ahk

/**
 * Extends the IUIAutomationElement7 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement8
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement8 extends IUIAutomationElement7{
    /**
     * The interface identifier for IUIAutomationElement8
     * @type {Guid}
     */
    static IID => Guid("{8c60217d-5411-4cde-bcc0-1ceda223830c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 115

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentHeadingLevel(retVal) {
        result := ComCall(115, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedHeadingLevel(retVal) {
        result := ComCall(116, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

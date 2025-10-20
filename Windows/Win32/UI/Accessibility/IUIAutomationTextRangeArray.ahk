#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of IUIAutomationTextRange objects.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRangeArray extends IUnknown{
    /**
     * The interface identifier for IUIAutomationTextRangeArray
     * @type {Guid}
     */
    static IID => Guid("{ce4ae76a-e717-4c98-81ea-47371d028eb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} length 
     * @returns {HRESULT} 
     */
    get_Length(length) {
        result := ComCall(3, this, "int*", length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUIAutomationTextRange>} element 
     * @returns {HRESULT} 
     */
    GetElement(index, element) {
        result := ComCall(4, this, "int", index, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

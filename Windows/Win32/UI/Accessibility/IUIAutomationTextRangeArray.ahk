#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of IUIAutomationTextRange objects.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRangeArray extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Length", "GetElement"]

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Retrieves the number of text ranges in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrangearray-get_length
     */
    get_Length() {
        result := ComCall(3, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Retrieves a text range from the collection.
     * @param {Integer} index Type: <b>int</b>
     * 
     * The zero-based index of the item.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the text range.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrangearray-getelement
     */
    GetElement(index) {
        result := ComCall(4, this, "int", index, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationTextRange(element)
    }
}

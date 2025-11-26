#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of UI Automation elements.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelementarray
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElementArray extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElementArray
     * @type {Guid}
     */
    static IID => Guid("{14314595-b4bc-4055-95f2-58f2e42c9855}")

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
     * Retrieves the number of elements in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelementarray-get_length
     */
    get_Length() {
        result := ComCall(3, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Retrieves a Microsoft UI Automation element from the collection.
     * @param {Integer} index Type: <b>int</b>
     * 
     * The zero-based index of the element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelementarray-getelement
     */
    GetElement(index) {
        result := ComCall(4, this, "int", index, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }
}

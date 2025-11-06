#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUIAutomationTextRange.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IUIAutomationElement.ahk
#Include .\IUIAutomationElementArray.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a span of continuous text in a container that supports the IUIAutomationTextPattern interface. Client applications can use the IUIAutomationTextRange interface to select, compare, and retrieve embedded objects from the text span.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextrange
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextRange
     * @type {Guid}
     */
    static IID => Guid("{a543cc6a-f4ae-494b-8239-c814481187a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Compare", "CompareEndpoints", "ExpandToEnclosingUnit", "FindAttribute", "FindText", "GetAttributeValue", "GetBoundingRectangles", "GetEnclosingElement", "GetText", "Move", "MoveEndpointByUnit", "MoveEndpointByRange", "Select", "AddToSelection", "RemoveFromSelection", "ScrollIntoView", "GetChildren"]

    /**
     * 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &clonedRange := 0, "HRESULT")
        return IUIAutomationTextRange(clonedRange)
    }

    /**
     * 
     * @param {IUIAutomationTextRange} range 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compare
     */
    Compare(range) {
        result := ComCall(4, this, "ptr", range, "int*", &areSame := 0, "HRESULT")
        return areSame
    }

    /**
     * 
     * @param {Integer} srcEndPoint 
     * @param {IUIAutomationTextRange} range 
     * @param {Integer} targetEndPoint 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compareendpoints
     */
    CompareEndpoints(srcEndPoint, range, targetEndPoint) {
        result := ComCall(5, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "int*", &compValue := 0, "HRESULT")
        return compValue
    }

    /**
     * 
     * @param {Integer} textUnit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-expandtoenclosingunit
     */
    ExpandToEnclosingUnit(textUnit) {
        result := ComCall(6, this, "int", textUnit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} attr 
     * @param {VARIANT} val 
     * @param {BOOL} backward 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findattribute
     */
    FindAttribute(attr, val, backward) {
        result := ComCall(7, this, "int", attr, "ptr", val, "int", backward, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationTextRange(found)
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {BOOL} backward 
     * @param {BOOL} ignoreCase 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findtext
     */
    FindText(text, backward, ignoreCase) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationTextRange(found)
    }

    /**
     * 
     * @param {Integer} attr 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getattributevalue
     */
    GetAttributeValue(attr) {
        value := VARIANT()
        result := ComCall(9, this, "int", attr, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getboundingrectangles
     */
    GetBoundingRectangles() {
        result := ComCall(10, this, "ptr*", &boundingRects := 0, "HRESULT")
        return boundingRects
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getenclosingelement
     */
    GetEnclosingElement() {
        result := ComCall(11, this, "ptr*", &enclosingElement := 0, "HRESULT")
        return IUIAutomationElement(enclosingElement)
    }

    /**
     * 
     * @param {Integer} maxLength 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-gettext
     */
    GetText(maxLength) {
        text := BSTR()
        result := ComCall(12, this, "int", maxLength, "ptr", text, "HRESULT")
        return text
    }

    /**
     * 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-move
     */
    Move(unit, count) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", &moved := 0, "HRESULT")
        return moved
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit, count) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", &moved := 0, "HRESULT")
        return moved
    }

    /**
     * 
     * @param {Integer} srcEndPoint 
     * @param {IUIAutomationTextRange} range 
     * @param {Integer} targetEndPoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-moveendpointbyrange
     */
    MoveEndpointByRange(srcEndPoint, range, targetEndPoint) {
        result := ComCall(15, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-select
     */
    Select() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-addtoselection
     */
    AddToSelection() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} alignToTop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-scrollintoview
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(19, this, "int", alignToTop, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getchildren
     */
    GetChildren() {
        result := ComCall(20, this, "ptr*", &children := 0, "HRESULT")
        return IUIAutomationElementArray(children)
    }
}

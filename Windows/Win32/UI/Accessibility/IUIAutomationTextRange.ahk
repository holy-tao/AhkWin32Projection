#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IUIAutomationTextRange>} clonedRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-clone
     */
    Clone(clonedRange) {
        result := ComCall(3, this, "ptr*", clonedRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationTextRange} range 
     * @param {Pointer<BOOL>} areSame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compare
     */
    Compare(range, areSame) {
        result := ComCall(4, this, "ptr", range, "ptr", areSame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} srcEndPoint 
     * @param {IUIAutomationTextRange} range 
     * @param {Integer} targetEndPoint 
     * @param {Pointer<Integer>} compValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compareendpoints
     */
    CompareEndpoints(srcEndPoint, range, targetEndPoint, compValue) {
        compValueMarshal := compValue is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, compValueMarshal, compValue, "HRESULT")
        return result
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
     * @param {Pointer<IUIAutomationTextRange>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findattribute
     */
    FindAttribute(attr, val, backward, found) {
        result := ComCall(7, this, "int", attr, "ptr", val, "int", backward, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @param {BOOL} backward 
     * @param {BOOL} ignoreCase 
     * @param {Pointer<IUIAutomationTextRange>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findtext
     */
    FindText(text, backward, ignoreCase, found) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} attr 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getattributevalue
     */
    GetAttributeValue(attr, value) {
        result := ComCall(9, this, "int", attr, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} boundingRects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getboundingrectangles
     */
    GetBoundingRectangles(boundingRects) {
        result := ComCall(10, this, "ptr*", boundingRects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} enclosingElement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getenclosingelement
     */
    GetEnclosingElement(enclosingElement) {
        result := ComCall(11, this, "ptr*", enclosingElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} maxLength 
     * @param {Pointer<BSTR>} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-gettext
     */
    GetText(maxLength, text) {
        result := ComCall(12, this, "int", maxLength, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @param {Pointer<Integer>} moved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-move
     */
    Move(unit, count, moved) {
        movedMarshal := moved is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "int", unit, "int", count, movedMarshal, moved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count 
     * @param {Pointer<Integer>} moved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit, count, moved) {
        movedMarshal := moved is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, movedMarshal, moved, "HRESULT")
        return result
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
     * @param {Pointer<IUIAutomationElementArray>} children 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getchildren
     */
    GetChildren(children) {
        result := ComCall(20, this, "ptr*", children, "HRESULT")
        return result
    }
}

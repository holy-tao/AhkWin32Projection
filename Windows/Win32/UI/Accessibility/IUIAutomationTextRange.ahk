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
     * Retrieves a new IUIAutomationTextRange identical to the original and inheriting all properties of the original.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the new text range.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &clonedRange := 0, "HRESULT")
        return IUIAutomationTextRange(clonedRange)
    }

    /**
     * Retrieves a value that specifies whether this text range has the same endpoints as another text range.
     * @param {IUIAutomationTextRange} range Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>*</b>
     * 
     * A pointer to  the text range to compare with this one.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the text ranges have the same endpoints, or <b>FALSE</b> if they do not.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compare
     */
    Compare(range) {
        result := ComCall(4, this, "ptr", range, "int*", &areSame := 0, "HRESULT")
        return areSame
    }

    /**
     * Retrieves a value that specifies whether the start or end endpoint of this text range is the same as the start or end endpoint of another text range.
     * @param {Integer} srcEndPoint 
     * @param {IUIAutomationTextRange} range Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>*</b>
     * 
     * A pointer to the text range to compare.
     * @param {Integer} targetEndPoint 
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives a negative value if the caller's endpoint occurs earlier in the text than the target endpoint; 0 if the caller's endpoint is at the same location as the target endpoint; or a positive value if the caller's endpoint occurs later in the text than the target endpoint.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compareendpoints
     */
    CompareEndpoints(srcEndPoint, range, targetEndPoint) {
        result := ComCall(5, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "int*", &compValue := 0, "HRESULT")
        return compValue
    }

    /**
     * Normalizes the text range by the specified text unit. The range is expanded if it is smaller than the specified unit, or shortened if it is longer than the specified unit.
     * @param {Integer} textUnit 
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-expandtoenclosingunit
     */
    ExpandToEnclosingUnit(textUnit) {
        result := ComCall(6, this, "int", textUnit, "HRESULT")
        return result
    }

    /**
     * Retrieves a text range subset that has the specified text attribute value.
     * @param {Integer} attr Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The identifier of the text attribute for the text range subset being retrieved. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @param {VARIANT} val Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a></b>
     * 
     * The value of the attribute. This value must match the type specified for the attribute.
     * @param {BOOL} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the last occurring text range should be returned instead of the first; otherwise <b>FALSE</b>.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the text range having a matching attribute and attribute value; otherwise <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findattribute
     */
    FindAttribute(attr, val, backward) {
        result := ComCall(7, this, "int", attr, "ptr", val, "int", backward, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationTextRange(found)
    }

    /**
     * Retrieves a text range subset that contains the specified text.
     * @param {BSTR} text Type: <b>BSTR</b>
     * 
     * The text to find.
     * @param {BOOL} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the last occurring text range should be returned instead of the first; otherwise <b>FALSE</b>.
     * @param {BOOL} ignoreCase Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if case should be ignored; otherwise <b>FALSE</b>.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the text range, or <b>NULL</b> if no match is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findtext
     */
    FindText(text, backward, ignoreCase) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationTextRange(found)
    }

    /**
     * Retrieves the value of the specified text attribute across the entire text range.
     * @param {Integer} attr Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The identifier of the text attribute. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the specified attribute.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getattributevalue
     */
    GetAttributeValue(attr) {
        value := VARIANT()
        result := ComCall(9, this, "int", attr, "ptr", value, "HRESULT")
        return value
    }

    /**
     * Retrieves a collection of bounding rectangles for each fully or partially visible line of text in a text range.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to an array of bounding rectangles for each fully or partially visible line of text in a text range. An empty array is returned for a degenerate (empty) text range or for a text range that is  completely off-screen, scrolled out of view, or obscured by an overlapping window.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getboundingrectangles
     */
    GetBoundingRectangles() {
        result := ComCall(10, this, "ptr*", &boundingRects := 0, "HRESULT")
        return boundingRects
    }

    /**
     * Returns the innermost UI Automation element that encloses the text range.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the enclosing element, which is typically the text provider that supplies the text range. However, if the text provider supports child elements such as tables or hyperlinks, the enclosing element could be a descendant of the text provider.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getenclosingelement
     */
    GetEnclosingElement() {
        result := ComCall(11, this, "ptr*", &enclosingElement := 0, "HRESULT")
        return IUIAutomationElement(enclosingElement)
    }

    /**
     * Returns the plain text of the text range.
     * @param {Integer} maxLength Type: <b>int</b>
     * 
     * The maximum length of the string to return, or -1 if no limit is required.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives a pointer to the string, possibly truncated at the specified <i>maxLength</i>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-gettext
     */
    GetText(maxLength) {
        text := BSTR()
        result := ComCall(12, this, "int", maxLength, "ptr", text, "HRESULT")
        return text
    }

    /**
     * Moves the text range forward or backward by the specified number of text units .
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of text units to move. A positive value moves the text range forward. A negative value moves the text range backward. Zero has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the number of text units actually moved. This can be less than the number requested if either of the new text range endpoints is greater than or less than the endpoints retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-itextprovider-get_documentrange">IUIAutomationTextPattern::DocumentRange</a> method. This value can be negative if navigation is happening in the backward direction.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-move
     */
    Move(unit, count) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", &moved := 0, "HRESULT")
        return moved
    }

    /**
     * Moves one endpoint of the text range the specified number of text units within the document range.
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of units to move. A positive count moves the endpoint forward. A negative count moves backward. A count of 0 has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the count of units actually moved. This value can be less than the number requested if moving the endpoint runs into the beginning or end of the document.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit, count) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", &moved := 0, "HRESULT")
        return moved
    }

    /**
     * Moves one endpoint of the current text range to the specified endpoint of a second text range.
     * @param {Integer} srcEndPoint 
     * @param {IUIAutomationTextRange} range Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>*</b>
     * 
     * A second text range from the same text provider as the current text range.
     * @param {Integer} targetEndPoint 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-moveendpointbyrange
     */
    MoveEndpointByRange(srcEndPoint, range, targetEndPoint) {
        result := ComCall(15, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "HRESULT")
        return result
    }

    /**
     * Selects the span of text that corresponds to this text range, and removes any previous selection.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-select
     */
    Select() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Adds the text range to the collection of selected text ranges in a control that supports multiple, disjoint spans of selected text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-addtoselection
     */
    AddToSelection() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Removes the text range from an existing collection of selected text in a text container that supports multiple, disjoint selections.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Causes the text control to scroll until the text range is visible in the viewport.
     * @param {BOOL} alignToTop Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the text control should be scrolled so that the text range is flush with the top of the viewport; <b>FALSE</b> if it should be flush with the bottom of the viewport.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-scrollintoview
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(19, this, "int", alignToTop, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of all embedded objects that fall within the text range.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of all child objects that fall within the range. Children that overlap with the range but are not entirely enclosed by it are also included in the collection. An empty collection is returned if there are no child objects.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getchildren
     */
    GetChildren() {
        result := ComCall(20, this, "ptr*", &children := 0, "HRESULT")
        return IUIAutomationElementArray(children)
    }
}

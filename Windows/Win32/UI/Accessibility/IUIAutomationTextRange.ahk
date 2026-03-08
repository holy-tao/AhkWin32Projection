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
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange
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
     * @remarks
     * The new range can be manipulated independently of the original.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the new text range.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &clonedRange := 0, "HRESULT")
        return IUIAutomationTextRange(clonedRange)
    }

    /**
     * Retrieves a value that specifies whether this text range has the same endpoints as another text range. (IUIAutomationTextRange.Compare)
     * @remarks
     * This method compares the endpoints of the two text ranges, not the text in the ranges. The ranges are identical if they share the same endpoints. If two text ranges have different endpoints, they are not identical even if the text in both ranges is exactly the same.
     * @param {IUIAutomationTextRange} range Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>*</b>
     * 
     * A pointer to  the text range to compare with this one.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the text ranges have the same endpoints, or <b>FALSE</b> if they do not.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compare
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-compareendpoints
     */
    CompareEndpoints(srcEndPoint, range, targetEndPoint) {
        result := ComCall(5, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "int*", &compValue := 0, "HRESULT")
        return compValue
    }

    /**
     * Normalizes the text range by the specified text unit. The range is expanded if it is smaller than the specified unit, or shortened if it is longer than the specified unit. (IUIAutomationTextRange.ExpandToEnclosingUnit)
     * @remarks
     * > ### Parameters
     * >
     * > `unit` [in]
     * >
     * > Type: **[TextUnit](../uiautomationcore/ne-uiautomationcore-textunit.md)**
     * >
     * > The text unit, such as line or paragraph.
     * 
     * Client applications such as screen readers use this method  to retrieve  the full word, sentence, or paragraph that exists at the insertion point or caret position.
     * 
     * Despite its name, the ExpandToEnclosingUnit method does not necessarily expand a text range. Instead, it "normalizes" a text range by moving the endpoints so that the range encompasses the specified text unit. The range is expanded if it is smaller than the specified unit, or shortened if it is longer than the specified unit. If the range is already an exact quantity of the specified units, it remains unchanged. The following diagram shows how ExpandToEnclosingUnit normalizes a text range by moving the endpoints of the range.
     * 
     * ![Diagram showing endpoints before and after ExpandToEnclosingUnit](./images/ExpandToEnclosingUnit.jpg)
     * 
     * *Diagram showing endpoints before and after ExpandToEnclosingUnit*
     * 
     * ExpandToEnclosingUnit defaults to the next largest text unit supported if the specified text unit is not supported by the control.
     * 
     * The order, from smallest unit to largest, is as follows:
     * 
     * - Character
     * - Format
     * - Word
     * - Line
     * - Paragraph
     * - Page
     * - Document
     * 
     * ExpandToEnclosingUnit respects both visible and hidden text.
     * @param {Integer} textUnit 
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-expandtoenclosingunit
     */
    ExpandToEnclosingUnit(textUnit) {
        result := ComCall(6, this, "int", textUnit, "HRESULT")
        return result
    }

    /**
     * Retrieves a text range subset that has the specified text attribute value.
     * @remarks
     * The <b>FindAttribute</b> method retrieves matching text regardless of whether the text is hidden or visible. Use <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_IsHiddenAttributeId</a> to check text visibility.
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findattribute
     */
    FindAttribute(attr, val, backward) {
        result := ComCall(7, this, "int", attr, "ptr", val, "int", backward, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationTextRange(found)
    }

    /**
     * Retrieves a text range subset that contains the specified text.
     * @remarks
     * There is no differentiation between hidden and visible text.
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-findtext
     */
    FindText(text, backward, ignoreCase) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationTextRange(found)
    }

    /**
     * Retrieves the value of the specified text attribute across the entire text range.
     * @remarks
     * The type of value retrieved by this method depends on the <i>attr</i> parameter. 
     * For example, calling <b>GetAttributeValue</b> with the <i>attr</i> parameter set to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_FontNameAttributeId</a> returns a string that represents the font name of the text range,  while calling <b>GetAttributeValue</b> with <i>attr</i> set to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_IsItalicAttributeId</a> would return a boolean.
     * 
     * 
     * 
     * 
     * 
     * If the attribute specified by <i>attr</i> is not supported, the <i>value</i> parameter receives a value that is equivalent to the  <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservednotsupportedvalue">IUIAutomation::ReservedNotSupportedValue</a> property. 
     * 
     * A text range can include more than one value for a particular attribute. For example, if a text range includes more than one font, the FontName attribute will have multiple values. An attribute with more than one value is called a  <i>mixed attribute</i>.  You can determine if a particular attribute is    a mixed attribute by comparing the value retrieved from <b>GetAttributeValue</b> with the  <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservedmixedattributevalue">UIAutomation::ReservedMixedAttributeValue</a> property.
     * 
     * The <b>GetAttributeValue</b> method retrieves the attribute value regardless of whether the text is hidden or visible.
     *             Use UIA_ IsHiddenAttributeId to check text visibility.
     * @param {Integer} attr Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The identifier of the text attribute. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the specified attribute.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getattributevalue
     */
    GetAttributeValue(attr) {
        value := VARIANT()
        result := ComCall(9, this, "int", attr, "ptr", value, "HRESULT")
        return value
    }

    /**
     * Retrieves a collection of bounding rectangles for each fully or partially visible line of text in a text range. (IUIAutomationTextRange.GetBoundingRectangles)
     * @remarks
     * For information about how the bounding rectangles are stored in the SAFEARRAY, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithsafearrays">Best Practices for Using Safe Arrays</a>.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to an array of bounding rectangles for each fully or partially visible line of text in a text range. An empty array is returned for a degenerate (empty) text range or for a text range that is  completely off-screen, scrolled out of view, or obscured by an overlapping window.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getboundingrectangles
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getenclosingelement
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-gettext
     */
    GetText(maxLength) {
        text := BSTR()
        result := ComCall(12, this, "int", maxLength, "ptr", text, "HRESULT")
        return text
    }

    /**
     * Moves the text range forward or backward by the specified number of text units .
     * @remarks
     * <b>IUIAutomationTextRange::Move</b> moves the text range to span a different part of the text; it does not alter the text in any way.
     * 
     *             
     *             
     * 
     * For a non-degenerate (non-empty) text range, <b>IUIAutomationTextRange::Move</b> normalizes and moves the range by performing the following steps.
     *             
     * 
     * <ol>
     * <li>The text range is collapsed to a degenerate (empty) range at the starting endpoint.</li>
     * <li>If necessary, the resulting text range is moved backward in the document to the beginning of the requested text unit boundary.</li>
     * <li>The text range is moved forward or backward in the document by the requested number of text unit boundaries.</li>
     * <li>The text range is expanded from the degenerate state by moving the ending endpoint forward by one requested text unit boundary. </li>
     * </ol>
     * If any of the preceding steps fail, the text range is left unchanged.  If the text range cannot be moved as far as the requested number of text units, but can be moved by a smaller number of text units, the text range is moved by the smaller number of text units and <i>moved</i> is set to the number of text units moved.
     * 
     * For a degenerate text range, <b>IUIAutomationTextRange::Move</b> simply moves the text insertion point by the specified number of text units. 
     * 
     * When moving a text range, <b>IUIAutomationTextRange::Move</b> ignores the boundaries of any embedded objects in the text.
     * 
     * <b>IUIAutomationTextRange::Move</b> respects both hidden and visible text. 
     *             
     * 
     * If a text-based control does not support the text unit specified by the <i>unit</i> parameter, <b>IUIAutomationTextRange::Move</b> substitutes the next larger supported text unit. 
     *         
     * The size of the text units, from smallest unit to largest, is as follows.
     * 
     * <ul>
     * <li>Character
     *         </li>
     * <li>Format
     *         </li>
     * <li>Word
     *         </li>
     * <li>Line
     *         </li>
     * <li>Paragraph
     *         </li>
     * <li>Page
     *         </li>
     * <li>Document
     *         </li>
     * </ul>
     * <h3><a id="Range_behavior_when_unit_is_TextUnit__Format"></a><a id="range_behavior_when_unit_is_textunit__format"></a><a id="RANGE_BEHAVIOR_WHEN_UNIT_IS_TEXTUNIT__FORMAT"></a>Range behavior when <i>unit</i> is <c>TextUnit::Format</c></h3>
     * <c>TextUnit::Format</c> as a <i>unit</i> value positions the boundary of a text range to expand or move the range based on shared text attributes (format) of the text within the range. However, using the format text unit will not move or expand a text range across the boundary of an embedded object, such as an image or hyperlink. For more info, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-uiautomationtextunits">UI Automation Text Units</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-ui-automation-textpattern-overview">UI Automation Support for Textual Content</a>.
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of text units to move. A positive value moves the text range forward. A negative value moves the text range backward. Zero has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the number of text units actually moved. This can be less than the number requested if either of the new text range endpoints is greater than or less than the endpoints retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-itextprovider-get_documentrange">IUIAutomationTextPattern::DocumentRange</a> method. This value can be negative if navigation is happening in the backward direction.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-move
     */
    Move(unit, count) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", &moved := 0, "HRESULT")
        return moved
    }

    /**
     * Moves one endpoint of the text range the specified number of text units within the document range.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textpatternrangeendpoint">endpoint</a> is moved forward or backward, as specified, to the next available unit boundary. If the original <b>endpoint</b> was at the boundary of the specified text unit, the <b>endpoint</b> is moved to the next available text unit boundary, as shown in the following illustration.
     * 
     * <img alt="Illustration showing endpoints of a text range moving" src="./images/moveendpointbyunit.gif"/>
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textpatternrangeendpoint">endpoint</a> being moved crosses the other <b>endpoint</b> of the same text range, the other <b>endpoint</b> is also moved, resulting in a degenerate range and ensuring the correct ordering of the <b>endpoint</b> (that is, that the start is always less than or equal to the end).
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyunit">MoveEndpointByUnit</a> deprecates up to the next supported text unit if the given text unit is not supported by the control. 
     *         
     * 
     * The order, from smallest unit to largest, is listed here.
     *         
     * 
     * <ul>
     * <li><i>Character</i></li>
     * <li><i>Format</i></li>
     * <li><i>Word</i></li>
     * <li><i>Line</i></li>
     * <li><i>Paragraph</i></li>
     * <li><i>Page</i></li>
     * <li><i>Document</i></li>
     * </ul>
     * <h3><a id="Range_behavior_when_unit_is_TextUnit__Format"></a><a id="range_behavior_when_unit_is_textunit__format"></a><a id="RANGE_BEHAVIOR_WHEN_UNIT_IS_TEXTUNIT__FORMAT"></a>Range behavior when <i>unit</i> is <c>TextUnit::Format</c></h3>
     * <c>TextUnit::Format</c> as a <i>unit</i> value positions the boundary of a text range to expand or move the range based on shared text attributes (format) of the text within the range. However, using the format text unit will not move or expand a text range across the boundary of an embedded object, such as an image or hyperlink. For more info, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-uiautomationtextunits">UI Automation Text Units</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-ui-automation-textpattern-overview">UI Automation Support for Textual Content</a>.
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of units to move. A positive count moves the endpoint forward. A negative count moves backward. A count of 0 has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the count of units actually moved. This value can be less than the number requested if moving the endpoint runs into the beginning or end of the document.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit, count) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", &moved := 0, "HRESULT")
        return moved
    }

    /**
     * Moves one endpoint of the current text range to the specified endpoint of a second text range. (IUIAutomationTextRange.MoveEndpointByRange)
     * @remarks
     * If the endpoint being moved crosses the other endpoint of the same text range, that other endpoint is moved also, resulting in a degenerate (empty) range and ensuring the correct ordering of the endpoints (that is, the start is always less than or equal to the end).
     * @param {Integer} srcEndPoint 
     * @param {IUIAutomationTextRange} range Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>*</b>
     * 
     * A second text range from the same text provider as the current text range.
     * @param {Integer} targetEndPoint 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-moveendpointbyrange
     */
    MoveEndpointByRange(srcEndPoint, range, targetEndPoint) {
        result := ComCall(15, this, "int", srcEndPoint, "ptr", range, "int", targetEndPoint, "HRESULT")
        return result
    }

    /**
     * Selects the span of text that corresponds to this text range, and removes any previous selection. (IUIAutomationTextRange.Select)
     * @remarks
     * If the <b>Select</b> method is called on a text range object that represents a degenerate (empty) text range, the text insertion point moves to the starting endpoint of the text range.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-select
     */
    Select() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Adds the text range to the collection of selected text ranges in a control that supports multiple, disjoint spans of selected text. (IUIAutomationTextRange.AddToSelection)
     * @remarks
     * The text insertion point moves to the newly selected text. If <b>AddToSelection</b> is called on a text range object that represents a degenerate (empty) text range, the text insertion point moves to the starting endpoint of the text range.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-addtoselection
     */
    AddToSelection() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Removes the text range from an existing collection of selected text in a text container that supports multiple, disjoint selections.
     * @remarks
     * The text insertion point moves to the area of the removed highlight. Providing a degenerate text range also moves the insertion point.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Causes the text control to scroll until the text range is visible in the viewport.
     * @remarks
     * The method respects both hidden and visible text. If the text range is hidden, the text control will scroll only if the hidden text has an anchor in the viewport. 
     * 
     *  A Microsoft UI Automation client can check text visibility by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getattributevalue">IUIAutomationTextRange::GetAttributeValue</a> with the <i>attr</i> parameter set to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_IsHiddenAttributeId</a>.
     * @param {BOOL} alignToTop Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the text control should be scrolled so that the text range is flush with the top of the viewport; <b>FALSE</b> if it should be flush with the bottom of the viewport.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-scrollintoview
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(19, this, "int", alignToTop, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of all embedded objects that fall within the text range. (IUIAutomationTextRange.GetChildren)
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of all child objects that fall within the range. Children that overlap with the range but are not entirely enclosed by it are also included in the collection. An empty collection is returned if there are no child objects.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getchildren
     */
    GetChildren() {
        result := ComCall(20, this, "ptr*", &children := 0, "HRESULT")
        return IUIAutomationElementArray(children)
    }
}

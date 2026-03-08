#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a span of continuous text in a text container that implements ITextProvider or ITextProvider2.
 * @remarks
 * A range can represent an insertion point, a portion of text, or all of the text in a container.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextRangeProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRangeProvider
     * @type {Guid}
     */
    static IID => Guid("{5347ad7b-c355-46f8-aff5-909033582f63}")

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
     * Returns a new ITextRangeProvider identical to the original ITextRangeProvider and inheriting all properties of the original.
     * @remarks
     * The new range can be manipulated independently from the original.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Receives a pointer to 
     *                 the copy of the text range. 
     *                 A null reference is never returned.
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Retrieves a value that specifies whether this text range has the same endpoints as another text range. (ITextRangeProvider.Compare)
     * @remarks
     * This method compares the endpoints of the two text ranges, not the text in the ranges. The ranges are identical if they share the same endpoints. If two text ranges have different endpoints, they are not identical even if the text in both ranges is exactly the same.
     * @param {ITextRangeProvider} range Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
     * 
     * The text range to compare with this one.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the text ranges have the same endpoints, or <b>FALSE</b> if they do not.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-compare
     */
    Compare(range) {
        result := ComCall(4, this, "ptr", range, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Returns a value that specifies whether two text ranges have identical endpoints.
     * @remarks
     * Returns a negative value if the caller's endpoint occurs earlier in the text than the target endpoint. 
     * 
     * 
     * Returns zero if the caller's endpoint is at the same location as the target endpoint. 
     * 
     * 
     * Returns a positive value if the caller's endpoint occurs later in the text than the target endpoint.
     * @param {Integer} endpoint 
     * @param {ITextRangeProvider} targetRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
     * 
     * The text range to be compared.
     * @param {Integer} targetEndpoint 
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives a value that indicates whether the two text ranges have identical endpoints.
     * 				 This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-compareendpoints
     */
    CompareEndpoints(endpoint, targetRange, targetEndpoint) {
        result := ComCall(5, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Normalizes the text range by the specified text unit. The range is expanded if it is smaller than the specified unit, or shortened if it is longer than the specified unit. (ITextRangeProvider.ExpandToEnclosingUnit)
     * @remarks
     * Client applications such as screen readers use this method  to retrieve  the full word, sentence, or paragraph that exists at the insertion point or caret position.
     * 
     * Despite its name, the <b>ITextRangeProvider::ExpandToEnclosingUnit</b> method does not necessarily expand a text range. Instead, it "normalizes" a text range by moving the endpoints so that the range encompasses the specified text unit. The range is expanded if it is smaller than the specified unit, or shortened if it is longer than the specified unit. If the range is already an exact quantity of the specified units, it remains unchanged. It is critical that the <b>ExpandToEnclosingUnit</b> method always normalizes text ranges in a consistent manner; otherwise, other aspects of text range manipulation by text unit would be unpredictable. The following diagram shows how <b>ExpandToEnclosingUnit</b> normalizes a text range by moving the endpoints of the range. 
     *             
     * 
     * <img alt="Diagram showing endpoint positions before and after a call to ExpandToEnclosingUnit" src="./images/ExpandToEnclosingUnit.jpg"/>
     * <b>ExpandToEnclosingUnit</b> defaults to the next largest text unit 
     *         supported if the specified text unit is not supported by the control. 
     *         
     *         The order, from smallest unit to largest, is as follows:
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
     * <b>ExpandToEnclosingUnit</b> respects both visible and hidden text. 
     *         
     * 
     * <h3><a id="Range_behavior_when_unit_is_TextUnit__Format"></a><a id="range_behavior_when_unit_is_textunit__format"></a><a id="RANGE_BEHAVIOR_WHEN_UNIT_IS_TEXTUNIT__FORMAT"></a>Range behavior when <i>unit</i> is <c>TextUnit::Format</c></h3>
     * <c>TextUnit::Format</c> as a <i>unit</i> value positions the boundary of a text range to expand or move the range based on shared text attributes (format) of the text within the range. However, using the format text unit should not move or expand a text range across the boundary of an embedded object, such as an image or hyperlink. For more info, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-uiautomationtextunits">UI Automation Text Units</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtextandtextrange">Text and TextRange Control Patterns</a>.
     * @param {Integer} unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
     * 
     * The type of text units, such as character, word, paragraph, and so on.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-expandtoenclosingunit
     */
    ExpandToEnclosingUnit(unit) {
        result := ComCall(6, this, "int", unit, "HRESULT")
        return result
    }

    /**
     * Returns a text range subset that has the specified text attribute value.
     * @remarks
     * The <b>FindAttribute</b> method retrieves matching text regardless of whether the text is hidden or visible. Clients can use <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_IsHiddenAttributeId</a> to check text visibility.
     * @param {Integer} attributeId Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The identifier of the text attribute. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @param {VARIANT} val Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The attribute value to search for. This value must match the type specified for the attribute.
     * @param {BOOL} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the last occurring text range should be returned instead of the first; otherwise <b>FALSE</b>.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Receives a pointer to the text range having a matching attribute and attribute value; otherwise <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-findattribute
     */
    FindAttribute(attributeId, val, backward) {
        result := ComCall(7, this, "int", attributeId, "ptr", val, "int", backward, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Returns a text range subset that contains the specified text.
     * @remarks
     * There is no differentiation between hidden and visible text.
     * @param {BSTR} text Type: <b>BSTR</b>
     * 
     * The text string to search for.
     * @param {BOOL} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the last occurring text range should be returned instead of the first; otherwise <b>FALSE</b>.
     * @param {BOOL} ignoreCase Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if case should be ignored; otherwise <b>FALSE</b>.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Receives a pointer to the text range
     * 				matching the specified text; otherwise <b>NULL</b>. 
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-findtext
     */
    FindText(text, backward, ignoreCase) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Retrieves the value of the specified text attribute across the text range.
     * @remarks
     * The <b>GetAttributeValue</b> method should retrieve the attribute value regardless of whether the text is hidden or visible.
     * @param {Integer} attributeId Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The identifier of the text attribute. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
     * 
     * Receives one of the following. 
     * 
     * <ul>
     * <li>The address of an object representing the value of the specified attribute. The data type of the value varies depending on the specified attribute. For example, if <i>attributeId</i> is <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_FontNameAttributeId</a>,  <b>GetAttributeValue</b> returns a string that represents the font name of the text range,  but if <i>attributeId</i> is <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_IsItalicAttributeId</a>,  <b>GetAttributeValue</b> returns a boolean.
     * 
     * 
     * 
     * </li>
     * <li>The address of the value retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservedmixedattributevalue">UiaGetReservedMixedAttributeValue</a> function, if the value of the specified attribute varies over the text range.</li>
     * <li>The address of the value retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservednotsupportedvalue">UiaGetReservedNotSupportedValue</a> function, if the specified attribute is not supported by the provider or the control. </li>
     * </ul>
     * This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getattributevalue
     */
    GetAttributeValue(attributeId) {
        pRetVal := VARIANT()
        result := ComCall(9, this, "int", attributeId, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves a collection of bounding rectangles for each fully or partially visible line of text in a text range. (ITextRangeProvider.GetBoundingRectangles)
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to one of the following.
     *                 
     * 
     * <ul>
     * <li>An array of bounding rectangles 
     *                 for each full or partial line of text in a text range.
     *                 </li>
     * <li>An empty array for a degenerate range.
     *                 </li>
     * <li>An empty array for a text range that has screen coordinates placing it completely 
     *                 off-screen, scrolled out of view, or obscured by an overlapping window.
     *                 </li>
     * </ul>
     * This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getboundingrectangles
     */
    GetBoundingRectangles() {
        result := ComCall(10, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Returns the innermost element that encloses the text range.
     * @returns {IRawElementProviderSimple} Type: **[IRawElementProviderSimple](nn-uiautomationcore-irawelementprovidersimple.md)\*\***
     * 
     * The UI Automation provider of the innermost element that encloses the specified [ITextRangeProvider](nn-uiautomationcore-itextrangeprovider.md).
     * 
     * > [!NOTE]
     * > The enclosing element can span more than just the specified [ITextRangeProvider](nn-uiautomationcore-itextrangeprovider.md).
     * 
     * If no enclosing element is found, the [ITextProvider](nn-uiautomationcore-itextprovider.md) parent of the [ITextRangeProvider](nn-uiautomationcore-itextrangeprovider.md) is returned.
     * 
     * This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getenclosingelement
     */
    GetEnclosingElement() {
        result := ComCall(11, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    /**
     * Retrieves the plain text of the range.
     * @remarks
     * <b>ITextRangeProvider::GetText</b> retrieves both hidden and visible text.
     * 
     * If <i>maxLength</i> is greater 
     *             than the length of the text span of the caller, the string returned will be the 
     * 			plain text of the text range.
     * 
     * <b>ITextRangeProvider::GetText</b> will not be affected by the order of endpoints in the text flow; 
     * 			it will always return the text between the start and end endpoints of the text range in the logical text flow order.
     * @param {Integer} maxLength Type: <b>int</b>
     * 
     * The maximum length of the string to return. Use -1 if no limit is required.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives the plain text of the text range, 
     * 				possibly truncated at the specified maximum length. This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-gettext
     */
    GetText(maxLength) {
        pRetVal := BSTR()
        result := ComCall(12, this, "int", maxLength, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Moves the text range forward or backward by the specified number of text units.
     * @remarks
     * <b>ITextRangeProvider::Move</b> should only move the text range to span a different part of the text, it should not alter the text in any way.
     * 
     *             
     *             
     * 
     * For a non-degenerate (non-empty) text range, <b>ITextRangeProvider::Move</b> should normalize and move the text range by performing the following steps.
     *             
     * 
     * <ol>
     * <li>Collapse the text range to a degenerate (empty) range at the starting endpoint.</li>
     * <li>If necessary, move the resulting text range backward in the document to the beginning of the requested unit boundary.</li>
     * <li>Move the text range forward or backward in the document by the requested number of text unit boundaries.</li>
     * <li>Expand the text range from the degenerate state by moving the ending endpoint forward by one requested text unit boundary. </li>
     * </ol>
     * If any of the preceding steps fail, the text range should be left unchanged.  If the text range cannot be moved as far as the requested number of text units, but can be moved by a smaller number of text units, the text range should be moved by the smaller number of text units and <i>pRetVal</i> should be set to the number of text units moved successfully.
     * 
     * For a degenerate text range, <b>ITextRangeProvider::Move</b> should simply move the text insertion point by the specified number of text units. 
     * 
     * When moving a text range, the provider should ignore the boundaries of any embedded objects in the text.
     * 
     * <b>ITextRangeProvider::Move</b> should respect both hidden and visible text. 
     *             
     * 
     * If a text-based control does not support the text unit specified by the <i>unit</i> parameter, the provider should substitute the next larger supported text unit. 
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
     * <c>TextUnit::Format</c> as a <i>unit</i> value positions the boundary of a text range to expand or move the range based on shared text attributes (format) of the text within the range. However, using the format text unit should not move or expand a text range across the boundary of an embedded object, such as an image or hyperlink. For more info, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-uiautomationtextunits">UI Automation Text Units</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtextandtextrange">Text and TextRange Control Patterns</a>.
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of text units to move. A positive value moves the text range forward. 
     * 
     * A negative value moves the text range backward. Zero has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * The number of text units actually moved. This can be less than the number requested if either of the new text range endpoints is greater than or less than the endpoints retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-itextprovider-get_documentrange">ITextProvider::DocumentRange</a> method. This value can be negative if navigation is happening in the backward direction.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-move
     */
    Move(unit, count) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Moves one endpoint of the text range the specified number of TextUnit units within the document range.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textpatternrangeendpoint">endpoint</a> is moved forward or backward, as specified, to the next available unit boundary. If the original <b>endpoint</b> was at the boundary of the specified text unit, the <b>endpoint</b> is moved to the next available text unit boundary, as shown in the following illustration.
     * 
     * <img alt="Illustration showing endpoints of a text range moving" src="./images/MoveEndpointByUnit.gif"/>
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textpatternrangeendpoint">endpoint</a> being moved crosses the other <b>endpoint</b> of the same text range, the other <b>endpoint</b> is also moved, resulting in a degenerate range and ensuring the correct ordering of the <b>endpoint</b> (that is, that the start is always less than or equal to the end).
     * 
     * <b>ITextRangeProvider::MoveEndpointByUnit</b> deprecates up to the next supported text unit if the given text unit is not supported by the control. 
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
     * <c>TextUnit::Format</c> as a <i>unit</i> value positions the boundary of a text range to expand or move the range based on shared text attributes (format) of the text within the range. However, using the format text unit should not move or expand a text range across the boundary of an embedded object, such as an image or hyperlink. For more info, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-uiautomationtextunits">UI Automation Text Units</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtextandtextrange">Text and TextRange Control Patterns</a>.
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of units to move. A positive value moves the endpoint forward. 
     *                 A negative value moves backward. A value of 0 has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the number of units actually moved, which can be less than the number requested if moving the endpoint runs into the beginning or end of the document.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit, count) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Moves one endpoint of the current text range to the specified endpoint of a second text range. (ITextRangeProvider.MoveEndpointByRange)
     * @remarks
     * If the endpoint being moved crosses the other endpoint of the same text range, that other endpoint is moved also, resulting in a degenerate (empty) range and ensuring the correct ordering of the endpoints (that is, the start is always less than or equal to the end).
     * @param {Integer} endpoint 
     * @param {ITextRangeProvider} targetRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
     * 
     * A second text range from the same text provider as the current text range.
     * @param {Integer} targetEndpoint 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyrange
     */
    MoveEndpointByRange(endpoint, targetRange, targetEndpoint) {
        result := ComCall(15, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "HRESULT")
        return result
    }

    /**
     * Selects the span of text that corresponds to this text range, and removes any previous selection. (ITextRangeProvider.Select)
     * @remarks
     * Providing a degenerate text range will move the text insertion point.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-select
     */
    Select() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Adds the text range to the collection of selected text ranges in a control that supports multiple, disjoint spans of selected text. (ITextRangeProvider.AddToSelection)
     * @remarks
     * The text insertion point moves to the area of the new selection.
     *             
     * 
     * If this method is called on a degenerate text range, the text insertion point moves to the location of the text range but no text is selected.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-addtoselection
     */
    AddToSelection() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Removes the text range from the collection of selected text ranges in a control that supports multiple, disjoint spans of selected text.
     * @remarks
     * The text insertion point moves to the area of the removed selection.
     *             
     * 
     * If this method is called on a degenerate text range, the text insertion point moves to the location of the text range but no text is selected.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Causes the text control to scroll vertically until the text range is visible in the viewport.
     * @remarks
     * <b>ITextRangeProvider::ScrollIntoView</b> respects both hidden and visible text. 
     * 
     * If the text range is hidden, the text control will scroll only if the hidden text has an anchor in the viewport.
     * @param {BOOL} alignToTop Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * TRUE if the text control should be scrolled so the text range is flush with the top of the viewport; 
     * 				FALSE if it should be flush with the bottom of the viewport.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-scrollintoview
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(19, this, "int", alignToTop, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of all embedded objects that fall within the text range. (ITextRangeProvider.GetChildren)
     * @remarks
     * Each element retrieved with [ITextRangeProvider::GetChildren]() has a valid text range that can be retrieved through [RangeFromChild](nf-uiautomationcore-itextprovider-rangefromchild.md). This includes any elements in the UI Automation tree between the [ITextProvider](nn-uiautomationcore-itextprovider.md) and the child element.
     * @returns {Pointer<SAFEARRAY>} Type: **[SAFEARRAY](../oaidl/ns-oaidl-safearray.md)\*\***
     * 
     * An array of pointers to the <a href="https://docs.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces for all child elements that are enclosed by the text range (sorted by the Start endpoint of their ranges).
     * 
     * If the text range does not include any child elements, an empty collection is returned.
     * 
     * This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getchildren
     */
    GetChildren() {
        result := ComCall(20, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}

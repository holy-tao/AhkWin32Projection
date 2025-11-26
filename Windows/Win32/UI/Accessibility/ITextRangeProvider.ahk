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
 * 
 * A range can represent an insertion point, a portion of text, or all of the text in a container.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextrangeprovider
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
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Receives a pointer to 
     *                 the copy of the text range. 
     *                 A null reference is never returned.
     * 				This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Retrieves a value that specifies whether this text range has the same endpoints as another text range.
     * @param {ITextRangeProvider} range Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
     * 
     * The text range to compare with this one.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the text ranges have the same endpoints, or <b>FALSE</b> if they do not.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-compare
     */
    Compare(range) {
        result := ComCall(4, this, "ptr", range, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Returns a value that specifies whether two text ranges have identical endpoints.
     * @param {Integer} endpoint 
     * @param {ITextRangeProvider} targetRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
     * 
     * The text range to be compared.
     * @param {Integer} targetEndpoint 
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives a value that indicates whether the two text ranges have identical endpoints.
     * 				 This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-compareendpoints
     */
    CompareEndpoints(endpoint, targetRange, targetEndpoint) {
        result := ComCall(5, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Normalizes the text range by the specified text unit. The range is expanded if it is smaller than the specified unit, or shortened if it is longer than the specified unit.
     * @param {Integer} unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
     * 
     * The type of text units, such as character, word, paragraph, and so on.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-expandtoenclosingunit
     */
    ExpandToEnclosingUnit(unit) {
        result := ComCall(6, this, "int", unit, "HRESULT")
        return result
    }

    /**
     * Returns a text range subset that has the specified text attribute value.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-findattribute
     */
    FindAttribute(attributeId, val, backward) {
        result := ComCall(7, this, "int", attributeId, "ptr", val, "int", backward, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Returns a text range subset that contains the specified text.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-findtext
     */
    FindText(text, backward, ignoreCase) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(8, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Retrieves the value of the specified text attribute across the text range.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-getattributevalue
     */
    GetAttributeValue(attributeId) {
        pRetVal := VARIANT()
        result := ComCall(9, this, "int", attributeId, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves a collection of bounding rectangles for each fully or partially visible line of text in a text range.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-getboundingrectangles
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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-getenclosingelement
     */
    GetEnclosingElement() {
        result := ComCall(11, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    /**
     * Retrieves the plain text of the range.
     * @param {Integer} maxLength Type: <b>int</b>
     * 
     * The maximum length of the string to return. Use -1 if no limit is required.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives the plain text of the text range, 
     * 				possibly truncated at the specified maximum length. This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-gettext
     */
    GetText(maxLength) {
        pRetVal := BSTR()
        result := ComCall(12, this, "int", maxLength, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Moves the text range forward or backward by the specified number of text units.
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of text units to move. A positive value moves the text range forward. 
     * 
     * A negative value moves the text range backward. Zero has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * The number of text units actually moved. This can be less than the number requested if either of the new text range endpoints is greater than or less than the endpoints retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-itextprovider-get_documentrange">ITextProvider::DocumentRange</a> method. This value can be negative if navigation is happening in the backward direction.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-move
     */
    Move(unit, count) {
        result := ComCall(13, this, "int", unit, "int", count, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Moves one endpoint of the text range the specified number of TextUnit units within the document range.
     * @param {Integer} endpoint 
     * @param {Integer} unit 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of units to move. A positive value moves the endpoint forward. 
     *                 A negative value moves backward. A value of 0 has no effect.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the number of units actually moved, which can be less than the number requested if moving the endpoint runs into the beginning or end of the document.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit, count) {
        result := ComCall(14, this, "int", endpoint, "int", unit, "int", count, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Moves one endpoint of the current text range to the specified endpoint of a second text range.
     * @param {Integer} endpoint 
     * @param {ITextRangeProvider} targetRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
     * 
     * A second text range from the same text provider as the current text range.
     * @param {Integer} targetEndpoint 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyrange
     */
    MoveEndpointByRange(endpoint, targetRange, targetEndpoint) {
        result := ComCall(15, this, "int", endpoint, "ptr", targetRange, "int", targetEndpoint, "HRESULT")
        return result
    }

    /**
     * Selects the span of text that corresponds to this text range, and removes any previous selection.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-select
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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-addtoselection
     */
    AddToSelection() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Removes the text range from the collection of selected text ranges in a control that supports multiple, disjoint spans of selected text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Causes the text control to scroll vertically until the text range is visible in the viewport.
     * @param {BOOL} alignToTop Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * TRUE if the text control should be scrolled so the text range is flush with the top of the viewport; 
     * 				FALSE if it should be flush with the bottom of the viewport.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-scrollintoview
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(19, this, "int", alignToTop, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of all embedded objects that fall within the text range.
     * @returns {Pointer<SAFEARRAY>} Type: **[SAFEARRAY](../oaidl/ns-oaidl-safearray.md)\*\***
     * 
     * An array of pointers to the <a href="https://docs.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces for all child elements that are enclosed by the text range (sorted by the Start endpoint of their ranges).
     * 
     * If the text range does not include any child elements, an empty collection is returned.
     * 
     * This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itextrangeprovider-getchildren
     */
    GetChildren() {
        result := ComCall(20, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support Microsoft UI Automation client access to a span of continuous text in a text container that implements [ITextProvider](itextprovider.md).
 * @remarks
 * For more info on this pattern, see [Text and TextRange Control Patterns](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * 
 * [ITextProvider](itextprovider.md), [ITextProvider2](itextprovider2.md) and ITextRangeProvider aren't implemented by any existing Windows Runtime automation peers using this definition of the interface. The text models supported by Windows Runtime text controls such as [TextBox](../windows.ui.xaml.controls/textbox.md) and [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) do implement some of these patterns, but do so at a native level that doesn't appear in the Windows Runtime definitions of the API surface. For more info, see the peer classes for the various Windows Runtime text controls.
 * 
 * The ITextRangeProvider pattern doesn't have a Windows Runtime property identifier class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextrangeprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITextRangeProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRangeProvider
     * @type {Guid}
     */
    static IID => Guid("{0274688d-06e9-4f66-9446-28a5be98fbd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Compare", "CompareEndpoints", "ExpandToEnclosingUnit", "FindAttribute", "FindText", "GetAttributeValue", "GetBoundingRectangles", "GetEnclosingElement", "GetText", "Move", "MoveEndpointByUnit", "MoveEndpointByRange", "Select", "AddToSelection", "RemoveFromSelection", "ScrollIntoView", "GetChildren"]

    /**
     * Returns a new ITextRangeProvider identical to the original ITextRangeProvider and inheriting all properties of the original.
     * @remarks
     * The new range can be manipulated independently from the original.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }

    /**
     * Retrieves a value that specifies whether this text range has the same endpoints as another text range. (ITextRangeProvider.Compare)
     * @remarks
     * This method compares the endpoints of the two text ranges, not the text in the ranges. The ranges are identical if they share the same endpoints. If two text ranges have different endpoints, they are not identical even if the text in both ranges is exactly the same.
     * @param {ITextRangeProvider} textRangeProvider 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-compare
     */
    Compare(textRangeProvider) {
        result := ComCall(7, this, "ptr", textRangeProvider, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {ITextRangeProvider} textRangeProvider 
     * @param {Integer} targetEndpoint 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-compareendpoints
     */
    CompareEndpoints(endpoint, textRangeProvider, targetEndpoint) {
        result := ComCall(8, this, "int", endpoint, "ptr", textRangeProvider, "int", targetEndpoint, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Expands the text range to the specified text unit.
     * @param {Integer} unit_ The text measure unit.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextrangeprovider.expandtoenclosingunit
     */
    ExpandToEnclosingUnit(unit_) {
        result := ComCall(9, this, "int", unit_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a text range subset that has the specified text attribute value.
     * @remarks
     * The <b>FindAttribute</b> method retrieves matching text regardless of whether the text is hidden or visible. Clients can use <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">UIA_IsHiddenAttributeId</a> to check text visibility.
     * @param {Integer} attributeId_ Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The identifier of the text attribute. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @param {IInspectable} value 
     * @param {Boolean} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the last occurring text range should be returned instead of the first; otherwise <b>FALSE</b>.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-findattribute
     */
    FindAttribute(attributeId_, value, backward) {
        result := ComCall(10, this, "int", attributeId_, "ptr", value, "int", backward, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }

    /**
     * Returns a text range subset that contains the specified text.
     * @remarks
     * There is no differentiation between hidden and visible text.
     * @param {HSTRING} text Type: <b>BSTR</b>
     * 
     * The text string to search for.
     * @param {Boolean} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the last occurring text range should be returned instead of the first; otherwise <b>FALSE</b>.
     * @param {Boolean} ignoreCase Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if case should be ignored; otherwise <b>FALSE</b>.
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-findtext
     */
    FindText(text, backward, ignoreCase) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(11, this, "ptr", text, "int", backward, "int", ignoreCase, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRangeProvider(result_)
    }

    /**
     * Retrieves the value of the specified text attribute across the text range.
     * @remarks
     * The <b>GetAttributeValue</b> method should retrieve the attribute value regardless of whether the text is hidden or visible.
     * @param {Integer} attributeId_ Type: <b>TEXTATTRIBUTEID</b>
     * 
     * The identifier of the text attribute. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getattributevalue
     */
    GetAttributeValue(attributeId_) {
        result := ComCall(12, this, "int", attributeId_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * Retrieves a collection of bounding rectangles for each fully or partially visible line of text in a text range.
     * @param {Pointer<Double>} returnValue An array of bounding rectangles for each full or partial line of text in a text range. An empty array for a degenerate range. An empty array for a text range that has screen coordinates placing it completely off-screen, scrolled out of view, or obscured by an overlapping window. 
     * <!--These are doubles not rects, so something is amiss or could be clarified, but this exactly how it is for .NET.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextrangeprovider.getboundingrectangles
     */
    GetBoundingRectangles(returnValue) {
        result := ComCall(13, this, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the innermost element that encloses the text range.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getenclosingelement
     */
    GetEnclosingElement() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(result_)
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
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-gettext
     */
    GetText(maxLength) {
        result_ := HSTRING()
        result := ComCall(15, this, "int", maxLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {Integer} unit_ 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of text units to move. A positive value moves the text range forward. 
     * 
     * A negative value moves the text range backward. Zero has no effect.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-move
     */
    Move(unit_, count) {
        result := ComCall(16, this, "int", unit_, "int", count, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {Integer} unit_ 
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of units to move. A positive value moves the endpoint forward. 
     *                 A negative value moves backward. A value of 0 has no effect.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-moveendpointbyunit
     */
    MoveEndpointByUnit(endpoint, unit_, count) {
        result := ComCall(17, this, "int", endpoint, "int", unit_, "int", count, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Moves one endpoint of a text range to the specified endpoint of a second text range.
     * @param {Integer} endpoint The endpoint to move.
     * @param {ITextRangeProvider} textRangeProvider Another range from the same text provider.
     * @param {Integer} targetEndpoint An endpoint on the other range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextrangeprovider.moveendpointbyrange
     */
    MoveEndpointByRange(endpoint, textRangeProvider, targetEndpoint) {
        result := ComCall(18, this, "int", endpoint, "ptr", textRangeProvider, "int", targetEndpoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Selects the span of text that corresponds to this text range, and removes any previous selection. (ITextRangeProvider.Select)
     * @remarks
     * Providing a degenerate text range will move the text insertion point.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-select
     */
    Select() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-addtoselection
     */
    AddToSelection() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-removefromselection
     */
    RemoveFromSelection() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Causes the text control to scroll vertically until the text range is visible in the viewport.
     * @param {Boolean} alignToTop **true** if the text control should be scrolled so that the text range is flush with the top of the viewport; **false** if the text range is flush with the bottom of the viewport.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextrangeprovider.scrollintoview
     */
    ScrollIntoView(alignToTop) {
        result := ComCall(22, this, "int", alignToTop, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of all embedded objects that fall within the text range. (ITextRangeProvider.GetChildren)
     * @remarks
     * Each element retrieved with [ITextRangeProvider::GetChildren]() has a valid text range that can be retrieved through [RangeFromChild](nf-uiautomationcore-itextprovider-rangefromchild.md). This includes any elements in the UI Automation tree between the [ITextProvider](nn-uiautomationcore-itextprovider.md) and the child element.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider-getchildren
     */
    GetChildren(result_) {
        result := ComCall(23, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

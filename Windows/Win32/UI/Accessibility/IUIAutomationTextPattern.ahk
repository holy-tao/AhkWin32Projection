#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange.ahk
#Include .\IUIAutomationTextRangeArray.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that contains text.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextPattern
     * @type {Guid}
     */
    static IID => Guid("{32eba289-3583-42c9-9c59-3b6d9a1e9b6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RangeFromPoint", "RangeFromChild", "GetSelection", "GetVisibleRanges", "get_DocumentRange", "get_SupportedTextSelection"]

    /**
     * @type {IUIAutomationTextRange} 
     */
    DocumentRange {
        get => this.get_DocumentRange()
    }

    /**
     * @type {Integer} 
     */
    SupportedTextSelection {
        get => this.get_SupportedTextSelection()
    }

    /**
     * Retrieves the degenerate (empty) text range nearest to the specified screen coordinates. (IUIAutomationTextPattern.RangeFromPoint)
     * @remarks
     * A text range that wraps a child object is returned if the screen coordinates are within the coordinates of an image, hyperlink, Microsoft Excel spreadsheet, or other embedded object.
     * 
     * Because hidden text is not ignored, this method retrieves a degenerate range from the visible text closest to the specified coordinates.
     * 
     * The implementation of <b>RangeFromPoint</b> in Windows Internet Explorer 9 does not return the expected result. Instead, clients should:
     * 
     * <ol>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getvisibleranges">GetVisibleRanges</a> method to retrieve an array of visible text ranges.</li>
     * <li>For each text range in the array, call <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getboundingrectangles">IUIAutomationTextRange::GetBoundingRectangles</a> to retrieve the bounding rectangles.</li>
     * <li>Check the bounding rectangles to find the text range that occupies the particular screen coordinates. </li>
     * </ol>
     * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A structure that contains the location, in screen coordinates.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the degenerate text range nearest the specified location.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefrompoint
     */
    RangeFromPoint(pt) {
        result := ComCall(3, this, "ptr", pt, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * Retrieves a text range enclosing a child element such as an image, hyperlink, Microsoft Excel spreadsheet, or other embedded object.
     * @remarks
     * If there is no text in the range that encloses the child element, a degenerate (empty) range is returned.
     * 
     * The <i>child</i> parameter is either a child of the element associated with a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a> or from the array of children of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>.
     * @param {IUIAutomationElement} child Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the child element to be enclosed in the text range.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to a text range that encloses the child element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefromchild
     */
    RangeFromChild(child) {
        result := ComCall(4, this, "ptr", child, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * Retrieves a collection of text ranges that represents the currently selected text in a text-based control. (IUIAutomationTextPattern.GetSelection)
     * @remarks
     * If the control supports the selection of multiple, non-contiguous spans of text, the <i>ranges</i> collection receives one text range for each selected span. 
     * 
     * If the control contains only a single span of selected text, the <i>ranges</i> collection receives a single text range. 
     * 
     * If the control contains a text insertion point but no text is selected, the <i>ranges</i> collection receives a degenerate (empty) text range at the position of the text insertion point.
     * 
     * If the control does  not contain a text insertion point or does not support text selection, <i>ranges</i> is set to <b>NULL</b>.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_supportedtextselection">IUIAutomationTextPattern::SupportedTextSelection</a> property to test whether a control supports text selection.
     * @returns {IUIAutomationTextRangeArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray">IUIAutomationTextRangeArray</a>**</b>
     * 
     * Receives a pointer to the collection of text ranges.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getselection
     */
    GetSelection() {
        result := ComCall(5, this, "ptr*", &ranges := 0, "HRESULT")
        return IUIAutomationTextRangeArray(ranges)
    }

    /**
     * Retrieves an array of disjoint text ranges from a text-based control where each text range represents a contiguous span of visible text. (IUIAutomationTextPattern.GetVisibleRanges)
     * @remarks
     * If the visible text consists of one contiguous span of text, the <i>ranges</i> array will contain a single text range that represents all of the visible text. 
     * 
     * If the visible text consists of multiple, disjoint spans of text, the <i>ranges</i> array will contain one text range for each visible span, beginning with the first visible span, and ending with the last visible span. Disjoint spans of visible text can occur when the content of a text-based control is partially obscured 
     *             by an overlapping window or other object, or when a text-based  control with multiple pages or columns 
     *             has content that is partially scrolled out of view.
     *             
     * 
     * <b>IUIAutomationTextPattern::GetVisibleRanges</b> retrieves  a degenerate (empty) text range if no text is visible, if all text is scrolled out of view, or if the text-based control contains no text.
     * @returns {IUIAutomationTextRangeArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray">IUIAutomationTextRangeArray</a>**</b>
     * 
     * Receives a pointer to the collection of visible text ranges within the text-based control.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getvisibleranges
     */
    GetVisibleRanges() {
        result := ComCall(6, this, "ptr*", &ranges := 0, "HRESULT")
        return IUIAutomationTextRangeArray(ranges)
    }

    /**
     * Retrieves a text range that encloses the main text of a document. (IUIAutomationTextPattern.get_DocumentRange)
     * @remarks
     * Some auxiliary text such as headers, footnotes, or annotations might not be included.
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_documentrange
     */
    get_DocumentRange() {
        result := ComCall(7, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * Retrieves a value that specifies the type of text selection that is supported by the control. (IUIAutomationTextPattern.get_SupportedTextSelection)
     * @remarks
     * > ### Parameters
     * >
     * > `supportedTextSelection` [out]
     * >
     * > Type: **[SupportedTextSelection](../uiautomationcore/ne-uiautomationcore-supportedtextselection.md)\***
     * >
     * > When this function returns, contains a pointer to the [SupportedTextSelection](../uiautomationcore/ne-uiautomationcore-supportedtextselection.md) object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_supportedtextselection
     */
    get_SupportedTextSelection() {
        result := ComCall(8, this, "int*", &supportedTextSelection := 0, "HRESULT")
        return supportedTextSelection
    }
}

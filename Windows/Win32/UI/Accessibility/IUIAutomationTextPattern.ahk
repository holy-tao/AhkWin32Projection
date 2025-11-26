#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange.ahk
#Include .\IUIAutomationTextRangeArray.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that contains text.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern
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
     * Retrieves the degenerate (empty) text range nearest to the specified screen coordinates.
     * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * A structure that contains the location, in screen coordinates.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the degenerate text range nearest the specified location.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefrompoint
     */
    RangeFromPoint(pt) {
        result := ComCall(3, this, "ptr", pt, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * Retrieves a text range enclosing a child element such as an image, hyperlink, Microsoft Excel spreadsheet, or other embedded object.
     * @param {IUIAutomationElement} child Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the child element to be enclosed in the text range.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to a text range that encloses the child element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefromchild
     */
    RangeFromChild(child) {
        result := ComCall(4, this, "ptr", child, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * Retrieves a collection of text ranges that represents the currently selected text in a text-based control.
     * @returns {IUIAutomationTextRangeArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray">IUIAutomationTextRangeArray</a>**</b>
     * 
     * Receives a pointer to the collection of text ranges.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getselection
     */
    GetSelection() {
        result := ComCall(5, this, "ptr*", &ranges := 0, "HRESULT")
        return IUIAutomationTextRangeArray(ranges)
    }

    /**
     * Retrieves an array of disjoint text ranges from a text-based control where each text range represents a contiguous span of visible text.
     * @returns {IUIAutomationTextRangeArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray">IUIAutomationTextRangeArray</a>**</b>
     * 
     * Receives a pointer to the collection of visible text ranges within the text-based control.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getvisibleranges
     */
    GetVisibleRanges() {
        result := ComCall(6, this, "ptr*", &ranges := 0, "HRESULT")
        return IUIAutomationTextRangeArray(ranges)
    }

    /**
     * Retrieves a text range that encloses the main text of a document.
     * @remarks
     * 
     * Some auxiliary text such as headers, footnotes, or annotations might not be included.
     * 
     * 
     * @returns {IUIAutomationTextRange} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_documentrange
     */
    get_DocumentRange() {
        result := ComCall(7, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * Retrieves a value that specifies the type of text selection that is supported by the control.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_supportedtextselection
     */
    get_SupportedTextSelection() {
        result := ComCall(8, this, "int*", &supportedTextSelection := 0, "HRESULT")
        return supportedTextSelection
    }
}

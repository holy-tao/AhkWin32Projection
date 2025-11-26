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
     * 
     * @param {POINT} pt 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefrompoint
     */
    RangeFromPoint(pt) {
        result := ComCall(3, this, "ptr", pt, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * 
     * @param {IUIAutomationElement} child 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefromchild
     */
    RangeFromChild(child) {
        result := ComCall(4, this, "ptr", child, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * 
     * @returns {IUIAutomationTextRangeArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getselection
     */
    GetSelection() {
        result := ComCall(5, this, "ptr*", &ranges := 0, "HRESULT")
        return IUIAutomationTextRangeArray(ranges)
    }

    /**
     * 
     * @returns {IUIAutomationTextRangeArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getvisibleranges
     */
    GetVisibleRanges() {
        result := ComCall(6, this, "ptr*", &ranges := 0, "HRESULT")
        return IUIAutomationTextRangeArray(ranges)
    }

    /**
     * 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_documentrange
     */
    get_DocumentRange() {
        result := ComCall(7, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_supportedtextselection
     */
    get_SupportedTextSelection() {
        result := ComCall(8, this, "int*", &supportedTextSelection := 0, "HRESULT")
        return supportedTextSelection
    }
}

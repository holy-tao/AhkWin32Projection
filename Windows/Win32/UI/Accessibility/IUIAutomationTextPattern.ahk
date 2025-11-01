#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {POINT} pt 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefrompoint
     */
    RangeFromPoint(pt, range) {
        result := ComCall(3, this, "ptr", pt, "ptr*", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} child 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefromchild
     */
    RangeFromChild(child, range) {
        result := ComCall(4, this, "ptr", child, "ptr*", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRangeArray>} ranges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getselection
     */
    GetSelection(ranges) {
        result := ComCall(5, this, "ptr*", ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRangeArray>} ranges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-getvisibleranges
     */
    GetVisibleRanges(ranges) {
        result := ComCall(6, this, "ptr*", ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_documentrange
     */
    get_DocumentRange(range) {
        result := ComCall(7, this, "ptr*", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} supportedTextSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-get_supportedtextselection
     */
    get_SupportedTextSelection(supportedTextSelection) {
        supportedTextSelectionMarshal := supportedTextSelection is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, supportedTextSelectionMarshal, supportedTextSelection, "HRESULT")
        return result
    }
}

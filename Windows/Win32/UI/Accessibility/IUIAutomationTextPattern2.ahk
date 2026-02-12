#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange.ahk
#Include .\IUIAutomationTextPattern.ahk

/**
 * Extends the IUIAutomationTextPattern interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextPattern2 extends IUIAutomationTextPattern{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextPattern2
     * @type {Guid}
     */
    static IID => Guid("{506a921a-fcc9-409f-b23b-37eb74106872}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RangeFromAnnotation", "GetCaretRange"]

    /**
     * Retrieves a text range containing the text that is the target of the annotation associated with the specified annotation element.
     * @param {IUIAutomationElement} annotation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * The annotation element for which to retrieve the target text. This element is a sibling of the element that implements <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern2">IUIAutomationTextPattern2</a> for the document.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a text range that contains the target text of the annotation.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern2-rangefromannotation
     */
    RangeFromAnnotation(annotation) {
        result := ComCall(9, this, "ptr", annotation, "ptr*", &range := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAutomationTextRange(range)
    }

    /**
     * Retrieves a zero-length text range at the location of the caret that belongs to the text-based control.
     * @remarks
     * If the <i>isActive</i> parameter is <b>FALSE</b>, the caret that belongs to the text-based control might not be at the same location as the system caret.
     * 
     * This method retrieves a text range that a client can use to find the bounding rectangle of the caret belonging to the text-based control, or to find the text near the caret.
     * @param {Pointer<BOOL>} isActive Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if the text-based control that contains the caret has keyboard focus, otherwise <b>FALSE</b>.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a text range that represents the current location of the caret that belongs to the text-based control.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern2-getcaretrange
     */
    GetCaretRange(isActive) {
        isActiveMarshal := isActive is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, isActiveMarshal, isActive, "ptr*", &range := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAutomationTextRange(range)
    }
}

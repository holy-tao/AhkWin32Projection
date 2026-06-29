#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationTextPattern.ahk" { IUIAutomationTextPattern }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUIAutomationTextRange.ahk" { IUIAutomationTextRange }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Extends the IUIAutomationTextPattern interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTextPattern2 extends IUIAutomationTextPattern {
    /**
     * The interface identifier for IUIAutomationTextPattern2
     * @type {Guid}
     */
    static IID := Guid("{506a921a-fcc9-409f-b23b-37eb74106872}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTextPattern2 interfaces
    */
    struct Vtbl extends IUIAutomationTextPattern.Vtbl {
        RangeFromAnnotation : IntPtr
        GetCaretRange       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTextPattern2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a text range containing the text that is the target of the annotation associated with the specified annotation element.
     * @param {IUIAutomationElement} annotation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * The annotation element for which to retrieve the target text. This element is a sibling of the element that implements <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern2">IUIAutomationTextPattern2</a> for the document.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a text range that contains the target text of the annotation.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern2-rangefromannotation
     */
    RangeFromAnnotation(annotation) {
        result := ComCall(9, this, "ptr", annotation, "ptr*", &range := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern2-getcaretrange
     */
    GetCaretRange(isActive) {
        isActiveMarshal := isActive is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, isActiveMarshal, isActive, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    Query(iid) {
        if (IUIAutomationTextPattern2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RangeFromAnnotation := CallbackCreate(GetMethod(implObj, "RangeFromAnnotation"), flags, 3)
        this.vtbl.GetCaretRange := CallbackCreate(GetMethod(implObj, "GetCaretRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RangeFromAnnotation)
        CallbackFree(this.vtbl.GetCaretRange)
    }
}

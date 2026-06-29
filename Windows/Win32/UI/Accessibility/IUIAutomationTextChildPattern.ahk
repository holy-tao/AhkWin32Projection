#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationTextRange.ahk" { IUIAutomationTextRange }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Provides access a text-based control (or an object embedded in text) that is a child or descendant of another text-based control.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextchildpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTextChildPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTextChildPattern
     * @type {Guid}
     */
    static IID := Guid("{6552b038-ae05-40c8-abfd-aa08352aab86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTextChildPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_TextContainer : IntPtr
        get_TextRange     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTextChildPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUIAutomationElement} 
     */
    TextContainer {
        get => this.get_TextContainer()
    }

    /**
     * @type {IUIAutomationTextRange} 
     */
    TextRange {
        get => this.get_TextRange()
    }

    /**
     * Retrieves this element's nearest ancestor element that supports the Text control pattern.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextchildpattern-get_textcontainer
     */
    get_TextContainer() {
        result := ComCall(3, this, "ptr*", &container := 0, "HRESULT")
        return IUIAutomationElement(container)
    }

    /**
     * Retrieves a text range that encloses this child element. (IUIAutomationTextChildPattern.get_TextRange)
     * @remarks
     * This property is equivalent to  specifying this child element in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern-rangefromchild">IUIAutomationTextPattern::RangeFromChild</a> method.
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextchildpattern-get_textrange
     */
    get_TextRange() {
        result := ComCall(4, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    Query(iid) {
        if (IUIAutomationTextChildPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TextContainer := CallbackCreate(GetMethod(implObj, "get_TextContainer"), flags, 2)
        this.vtbl.get_TextRange := CallbackCreate(GetMethod(implObj, "get_TextRange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TextContainer)
        CallbackFree(this.vtbl.get_TextRange)
    }
}

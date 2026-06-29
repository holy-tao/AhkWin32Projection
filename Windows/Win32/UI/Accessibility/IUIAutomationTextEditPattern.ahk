#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationTextPattern.ahk" { IUIAutomationTextPattern }
#Import ".\IUIAutomationTextRange.ahk" { IUIAutomationTextRange }

/**
 * Provides access to a control that modifies text, for example a control that performs auto-correction or enables input composition through an Input Method Editor (IME).
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtexteditpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTextEditPattern extends IUIAutomationTextPattern {
    /**
     * The interface identifier for IUIAutomationTextEditPattern
     * @type {Guid}
     */
    static IID := Guid("{17e21576-996c-4870-99d9-bff323380c06}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTextEditPattern interfaces
    */
    struct Vtbl extends IUIAutomationTextPattern.Vtbl {
        GetActiveComposition : IntPtr
        GetConversionTarget  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTextEditPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the active composition. (IUIAutomationTextEditPattern.GetActiveComposition)
     * @remarks
     * Active composition is relevant to Input Method Editors (IMEs).
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Pointer to the range of the current conversion (none if there is no conversion).
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtexteditpattern-getactivecomposition
     */
    GetActiveComposition() {
        result := ComCall(9, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * Returns the current conversion target range. (IUIAutomationTextEditPattern.GetConversionTarget)
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Pointer to the conversion target range (none if there is no conversion).
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtexteditpattern-getconversiontarget
     */
    GetConversionTarget() {
        result := ComCall(10, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    Query(iid) {
        if (IUIAutomationTextEditPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetActiveComposition := CallbackCreate(GetMethod(implObj, "GetActiveComposition"), flags, 2)
        this.vtbl.GetConversionTarget := CallbackCreate(GetMethod(implObj, "GetConversionTarget"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetActiveComposition)
        CallbackFree(this.vtbl.GetConversionTarget)
    }
}

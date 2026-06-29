#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\TextEditChangeType.ahk" { TextEditChangeType }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes a method to handle events that occur when Microsoft UI Automation reports a text-changed event from text edit controls.
 * @remarks
 * This interface is implemented by the application to handle events that it has subscribed to by using <b>AddTextEditTextChangedEventHandler</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextedittextchangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTextEditTextChangedEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTextEditTextChangedEventHandler
     * @type {Guid}
     */
    static IID := Guid("{92faa680-e704-4156-931a-e32d5bb38f3f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTextEditTextChangedEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleTextEditTextChangedEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTextEditTextChangedEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles an event that is raised when a Microsoft UI Automation provider for a text-edit control reports a programmatic text change.
     * @remarks
     * This method is implemented by the application to handle events that it has subscribed to by using <b>AddTextEditTextChangedEventHandler</b>.
     * 
     * The event data contains different payloads for each text-edit change type:
     * 
     * <ul>
     * <li><b>TextEditChangeType_AutoCorrect</b>: Data is the new corrected string .</li>
     * <li><b>TextEditChangeType_Composition</b>: Data is the updated string in the composition (only the part that changed).</li>
     * <li><b>TextEditChangeType_CompositionFinalized</b>: Data is the finalized string of the completed composition (this may be empty if composition was canceled or deleted).</li>
     * </ul>
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element that raised the event.
     * @param {TextEditChangeType} _textEditChangeType 
     * @param {Pointer<SAFEARRAY>} eventStrings Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithsafearrays">SAFEARRAY</a>*</b>
     * 
     * Event data passed by the event.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextedittextchangedeventhandler-handletextedittextchangedevent
     */
    HandleTextEditTextChangedEvent(sender, _textEditChangeType, eventStrings) {
        result := ComCall(3, this, "ptr", sender, TextEditChangeType, _textEditChangeType, SAFEARRAY.Ptr, eventStrings, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationTextEditTextChangedEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleTextEditTextChangedEvent := CallbackCreate(GetMethod(implObj, "HandleTextEditTextChangedEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleTextEditTextChangedEvent)
    }
}

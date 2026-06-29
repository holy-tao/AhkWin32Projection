#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import ".\IUIAutomation2.ahk" { IUIAutomation2 }
#Import ".\IUIAutomationTextEditTextChangedEventHandler.ahk" { IUIAutomationTextEditTextChangedEventHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TreeScope.ahk" { TreeScope }
#Import ".\TextEditChangeType.ahk" { TextEditChangeType }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Extends the IUIAutomation2 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomation3
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomation3 extends IUIAutomation2 {
    /**
     * The interface identifier for IUIAutomation3
     * @type {Guid}
     */
    static IID := Guid("{73d768da-9b51-4b89-936e-c209290973e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomation3 interfaces
    */
    struct Vtbl extends IUIAutomation2.Vtbl {
        AddTextEditTextChangedEventHandler    : IntPtr
        RemoveTextEditTextChangedEventHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomation3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a method that handles programmatic text-edit events.Note  Before implementing an event handler, you should be familiar with the threading issues described in Understanding Threading Issues.
     * @remarks
     * A UI Automation client should not use multiple threads to add or remove event handlers. Unexpected behavior can result if one event handler is being added or removed while another is being added or removed in the same client process.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element associated with the event handler.
     * @param {TreeScope} scope 
     * @param {TextEditChangeType} _textEditChangeType 
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationTextEditTextChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextedittextchangedeventhandler">IUIAutomationTextEditTextChangedEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the programmatic text-edit event.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation3-addtextedittextchangedeventhandler
     */
    AddTextEditTextChangedEventHandler(element, scope, _textEditChangeType, cacheRequest, handler) {
        result := ComCall(64, this, "ptr", element, TreeScope, scope, TextEditChangeType, _textEditChangeType, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes a programmatic text-edit event handler.
     * @remarks
     * A Microsoft UI Automation client should not use multiple threads to add or remove event handlers. Unexpected behavior can result if one event handler is being added or removed while another is being added or removed in the same client process.
     * 
     * It is possible for an event to be delivered to an event handler after the handler has been unsubscribed, 
     * if the event is received simultaneously with the request to unsubscribe the event. The best practice 
     * is to follow the Component Object Model (COM) standard and avoid destroying the event handler object until its reference count 
     * has reached zero. Destroying an event handler immediately after unsubscribing for events may result in an 
     * access violation if an event is delivered late.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element from which to remove the handler.
     * @param {IUIAutomationTextEditTextChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextedittextchangedeventhandler">IUIAutomationTextEditTextChangedEventHandler</a>*</b>
     * 
     * A pointer to the  interface that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation3-addtextedittextchangedeventhandler">IUIAutomation3::AddTextEditTextChangedEventHandler</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation3-removetextedittextchangedeventhandler
     */
    RemoveTextEditTextChangedEventHandler(element, handler) {
        result := ComCall(65, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomation3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddTextEditTextChangedEventHandler := CallbackCreate(GetMethod(implObj, "AddTextEditTextChangedEventHandler"), flags, 6)
        this.vtbl.RemoveTextEditTextChangedEventHandler := CallbackCreate(GetMethod(implObj, "RemoveTextEditTextChangedEventHandler"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddTextEditTextChangedEventHandler)
        CallbackFree(this.vtbl.RemoveTextEditTextChangedEventHandler)
    }
}

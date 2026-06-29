#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Represents a collection of UI Automation elements.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElementArray extends IUnknown {
    /**
     * The interface identifier for IUIAutomationElementArray
     * @type {Guid}
     */
    static IID := Guid("{14314595-b4bc-4055-95f2-58f2e42c9855}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElementArray interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Length : IntPtr
        GetElement : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElementArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Retrieves the number of elements in the collection. (IUIAutomationElementArray.get_Length)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelementarray-get_length
     */
    get_Length() {
        result := ComCall(3, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Retrieves a Microsoft UI Automation element from the collection.
     * @param {Integer} index Type: <b>int</b>
     * 
     * The zero-based index of the element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelementarray-getelement
     */
    GetElement(index) {
        result := ComCall(4, this, "int", index, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    Query(iid) {
        if (IUIAutomationElementArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
        this.vtbl.GetElement := CallbackCreate(GetMethod(implObj, "GetElement"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Length)
        CallbackFree(this.vtbl.GetElement)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationTextRange.ahk" { IUIAutomationTextRange }

/**
 * Represents a collection of IUIAutomationTextRange objects.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTextRangeArray extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTextRangeArray
     * @type {Guid}
     */
    static IID := Guid("{ce4ae76a-e717-4c98-81ea-47371d028eb6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTextRangeArray interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Length : IntPtr
        GetElement : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTextRangeArray.Vtbl()
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
     * Retrieves the number of text ranges in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrangearray-get_length
     */
    get_Length() {
        result := ComCall(3, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * Retrieves a text range from the collection.
     * @param {Integer} index Type: <b>int</b>
     * 
     * The zero-based index of the item.
     * @returns {IUIAutomationTextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrange">IUIAutomationTextRange</a>**</b>
     * 
     * Receives a pointer to the text range.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrangearray-getelement
     */
    GetElement(index) {
        result := ComCall(4, this, "int", index, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationTextRange(element)
    }

    Query(iid) {
        if (IUIAutomationTextRangeArray.IID.Equals(iid)) {
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

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UIA_HEADINGLEVEL_ID.ahk" { UIA_HEADINGLEVEL_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElement7.ahk" { IUIAutomationElement7 }

/**
 * Extends the IUIAutomationElement7 interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement8
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement8 extends IUIAutomationElement7 {
    /**
     * The interface identifier for IUIAutomationElement8
     * @type {Guid}
     */
    static IID := Guid("{8c60217d-5411-4cde-bcc0-1ceda223830c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement8 interfaces
    */
    struct Vtbl extends IUIAutomationElement7.Vtbl {
        get_CurrentHeadingLevel : IntPtr
        get_CachedHeadingLevel  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UIA_HEADINGLEVEL_ID} 
     */
    CurrentHeadingLevel {
        get => this.get_CurrentHeadingLevel()
    }

    /**
     * @type {UIA_HEADINGLEVEL_ID} 
     */
    CachedHeadingLevel {
        get => this.get_CachedHeadingLevel()
    }

    /**
     * Gets the current heading level of the automation element.
     * @returns {UIA_HEADINGLEVEL_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement8-get_currentheadinglevel
     */
    get_CurrentHeadingLevel() {
        result := ComCall(115, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Gets the cached heading level of the automation element.
     * @returns {UIA_HEADINGLEVEL_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement8-get_cachedheadinglevel
     */
    get_CachedHeadingLevel() {
        result := ComCall(116, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationElement8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentHeadingLevel := CallbackCreate(GetMethod(implObj, "get_CurrentHeadingLevel"), flags, 2)
        this.vtbl.get_CachedHeadingLevel := CallbackCreate(GetMethod(implObj, "get_CachedHeadingLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentHeadingLevel)
        CallbackFree(this.vtbl.get_CachedHeadingLevel)
    }
}

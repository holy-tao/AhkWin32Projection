#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElement5.ahk" { IUIAutomationElement5 }

/**
 * Extends the IUIAutomationElement5 interface to provide access to current and cached full descriptions.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement6
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement6 extends IUIAutomationElement5 {
    /**
     * The interface identifier for IUIAutomationElement6
     * @type {Guid}
     */
    static IID := Guid("{4780d450-8bca-4977-afa5-a4a517f555e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement6 interfaces
    */
    struct Vtbl extends IUIAutomationElement5.Vtbl {
        get_CurrentFullDescription : IntPtr
        get_CachedFullDescription  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    CurrentFullDescription {
        get => this.get_CurrentFullDescription()
    }

    /**
     * @type {BSTR} 
     */
    CachedFullDescription {
        get => this.get_CachedFullDescription()
    }

    /**
     * Gets the current full description of the automation element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement6-get_currentfulldescription
     */
    get_CurrentFullDescription() {
        retVal := BSTR.Owned()
        result := ComCall(108, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Gets the cached full description of the automation element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement6-get_cachedfulldescription
     */
    get_CachedFullDescription() {
        retVal := BSTR.Owned()
        result := ComCall(109, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationElement6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentFullDescription := CallbackCreate(GetMethod(implObj, "get_CurrentFullDescription"), flags, 2)
        this.vtbl.get_CachedFullDescription := CallbackCreate(GetMethod(implObj, "get_CachedFullDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentFullDescription)
        CallbackFree(this.vtbl.get_CachedFullDescription)
    }
}

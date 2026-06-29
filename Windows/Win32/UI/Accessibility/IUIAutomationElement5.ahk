#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\UIA_LANDMARKTYPE_ID.ahk" { UIA_LANDMARKTYPE_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElement4.ahk" { IUIAutomationElement4 }

/**
 * Extends the IUIAutomationElement4 interface to provide access to current and cached landmark data.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement5
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement5 extends IUIAutomationElement4 {
    /**
     * The interface identifier for IUIAutomationElement5
     * @type {Guid}
     */
    static IID := Guid("{98141c1d-0d0e-4175-bbe2-6bff455842a7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement5 interfaces
    */
    struct Vtbl extends IUIAutomationElement4.Vtbl {
        get_CurrentLandmarkType          : IntPtr
        get_CurrentLocalizedLandmarkType : IntPtr
        get_CachedLandmarkType           : IntPtr
        get_CachedLocalizedLandmarkType  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UIA_LANDMARKTYPE_ID} 
     */
    CurrentLandmarkType {
        get => this.get_CurrentLandmarkType()
    }

    /**
     * @type {BSTR} 
     */
    CurrentLocalizedLandmarkType {
        get => this.get_CurrentLocalizedLandmarkType()
    }

    /**
     * @type {UIA_LANDMARKTYPE_ID} 
     */
    CachedLandmarkType {
        get => this.get_CachedLandmarkType()
    }

    /**
     * @type {BSTR} 
     */
    CachedLocalizedLandmarkType {
        get => this.get_CachedLocalizedLandmarkType()
    }

    /**
     * Gets the current landmark type ID for the automation element.
     * @returns {UIA_LANDMARKTYPE_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_currentlandmarktype
     */
    get_CurrentLandmarkType() {
        result := ComCall(104, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Gets a string containing the current localized landmark type for the automation element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_currentlocalizedlandmarktype
     */
    get_CurrentLocalizedLandmarkType() {
        retVal := BSTR.Owned()
        result := ComCall(105, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Gets the cached landmark type ID for the automation element.
     * @returns {UIA_LANDMARKTYPE_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_cachedlandmarktype
     */
    get_CachedLandmarkType() {
        result := ComCall(106, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Gets a string containing the cached localized landmark type for the automation element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement5-get_cachedlocalizedlandmarktype
     */
    get_CachedLocalizedLandmarkType() {
        retVal := BSTR.Owned()
        result := ComCall(107, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationElement5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentLandmarkType := CallbackCreate(GetMethod(implObj, "get_CurrentLandmarkType"), flags, 2)
        this.vtbl.get_CurrentLocalizedLandmarkType := CallbackCreate(GetMethod(implObj, "get_CurrentLocalizedLandmarkType"), flags, 2)
        this.vtbl.get_CachedLandmarkType := CallbackCreate(GetMethod(implObj, "get_CachedLandmarkType"), flags, 2)
        this.vtbl.get_CachedLocalizedLandmarkType := CallbackCreate(GetMethod(implObj, "get_CachedLocalizedLandmarkType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentLandmarkType)
        CallbackFree(this.vtbl.get_CurrentLocalizedLandmarkType)
        CallbackFree(this.vtbl.get_CachedLandmarkType)
        CallbackFree(this.vtbl.get_CachedLocalizedLandmarkType)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IWebWizardHost extends IDispatch {
    /**
     * The interface identifier for IWebWizardHost
     * @type {Guid}
     */
    static IID := Guid("{18bcc359-4990-4bfb-b951-3c83702be5f9}")

    /**
     * The class identifier for WebWizardHost
     * @type {Guid}
     */
    static CLSID := Guid("{c827f149-55c1-4d28-935e-57e47caed973}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebWizardHost interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        FinalBack        : IntPtr
        FinalNext        : IntPtr
        Cancel           : IntPtr
        put_Caption      : IntPtr
        get_Caption      : IntPtr
        put_Property     : IntPtr
        get_Property     : IntPtr
        SetWizardButtons : IntPtr
        SetHeaderText    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebWizardHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Caption {
        get => this.get_Caption()
        set => this.put_Caption(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FinalBack() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FinalNext() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCaption 
     * @returns {HRESULT} 
     */
    put_Caption(bstrCaption) {
        bstrCaption := bstrCaption is String ? BSTR.Alloc(bstrCaption).Value : bstrCaption

        result := ComCall(10, this, BSTR, bstrCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Caption() {
        pbstrCaption := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrCaption, "HRESULT")
        return pbstrCaption
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} pvProperty 
     * @returns {HRESULT} 
     */
    put_Property(bstrPropertyName, pvProperty) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(12, this, BSTR, bstrPropertyName, VARIANT.Ptr, pvProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {VARIANT} 
     */
    get_Property(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        pvProperty := VARIANT()
        result := ComCall(13, this, BSTR, bstrPropertyName, VARIANT.Ptr, pvProperty, "HRESULT")
        return pvProperty
    }

    /**
     * 
     * @param {VARIANT_BOOL} vfEnableBack 
     * @param {VARIANT_BOOL} vfEnableNext 
     * @param {VARIANT_BOOL} vfLastPage 
     * @returns {HRESULT} 
     */
    SetWizardButtons(vfEnableBack, vfEnableNext, vfLastPage) {
        result := ComCall(14, this, VARIANT_BOOL, vfEnableBack, VARIANT_BOOL, vfEnableNext, VARIANT_BOOL, vfLastPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHeaderTitle 
     * @param {BSTR} bstrHeaderSubtitle 
     * @returns {HRESULT} 
     */
    SetHeaderText(bstrHeaderTitle, bstrHeaderSubtitle) {
        bstrHeaderTitle := bstrHeaderTitle is String ? BSTR.Alloc(bstrHeaderTitle).Value : bstrHeaderTitle
        bstrHeaderSubtitle := bstrHeaderSubtitle is String ? BSTR.Alloc(bstrHeaderSubtitle).Value : bstrHeaderSubtitle

        result := ComCall(15, this, BSTR, bstrHeaderTitle, BSTR, bstrHeaderSubtitle, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebWizardHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FinalBack := CallbackCreate(GetMethod(implObj, "FinalBack"), flags, 1)
        this.vtbl.FinalNext := CallbackCreate(GetMethod(implObj, "FinalNext"), flags, 1)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.put_Caption := CallbackCreate(GetMethod(implObj, "put_Caption"), flags, 2)
        this.vtbl.get_Caption := CallbackCreate(GetMethod(implObj, "get_Caption"), flags, 2)
        this.vtbl.put_Property := CallbackCreate(GetMethod(implObj, "put_Property"), flags, 3)
        this.vtbl.get_Property := CallbackCreate(GetMethod(implObj, "get_Property"), flags, 3)
        this.vtbl.SetWizardButtons := CallbackCreate(GetMethod(implObj, "SetWizardButtons"), flags, 4)
        this.vtbl.SetHeaderText := CallbackCreate(GetMethod(implObj, "SetHeaderText"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FinalBack)
        CallbackFree(this.vtbl.FinalNext)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.put_Caption)
        CallbackFree(this.vtbl.get_Caption)
        CallbackFree(this.vtbl.put_Property)
        CallbackFree(this.vtbl.get_Property)
        CallbackFree(this.vtbl.SetWizardButtons)
        CallbackFree(this.vtbl.SetHeaderText)
    }
}

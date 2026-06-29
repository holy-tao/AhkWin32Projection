#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Enables the host container of a windowless rich edit control to override the control's Microsoft UI Automation accessibility properties.
 * @see https://learn.microsoft.com/windows/win32/api/textserv/nn-textserv-irichedituiaoverrides
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct IRicheditUiaOverrides extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRicheditUiaOverrides interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropertyOverrideValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRicheditUiaOverrides.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the host container's override value for the specified Microsoft UI Automation accessibility property of a windowless rich edit control.
     * @param {Integer} propertyId Type: <b>PROPERTYID </b>
     * 
     * The identifier of the property to retrieve.
     * @param {Pointer<VARIANT>} pRetValue Type: <b>VARIANT*</b>
     * 
     * The host container's override value for the <i>propertyId</i> property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-irichedituiaoverrides-getpropertyoverridevalue
     */
    GetPropertyOverrideValue(propertyId, pRetValue) {
        result := ComCall(3, this, "int", propertyId, VARIANT.Ptr, pRetValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRicheditUiaOverrides.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyOverrideValue := CallbackCreate(GetMethod(implObj, "GetPropertyOverrideValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyOverrideValue)
    }
}

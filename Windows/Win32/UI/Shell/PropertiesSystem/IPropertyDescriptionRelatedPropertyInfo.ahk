#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPropertyDescription.ahk" { IPropertyDescription }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides a method that retrieves an IPropertyDescription interface.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Do not implement this interface. There is only one implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionrelatedpropertyinfo">IPropertyDescriptionRelatedPropertyInfo</a> in the system; it is provided by the Shell. 
 * 
 * Only one property description exists for each property in the system.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertydescriptionrelatedpropertyinfo
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyDescriptionRelatedPropertyInfo extends IPropertyDescription {
    /**
     * The interface identifier for IPropertyDescriptionRelatedPropertyInfo
     * @type {Guid}
     */
    static IID := Guid("{507393f4-2a3d-4a60-b59e-d9c75716c2dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyDescriptionRelatedPropertyInfo interfaces
    */
    struct Vtbl extends IPropertyDescription.Vtbl {
        GetRelatedProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyDescriptionRelatedPropertyInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an IPropertyDescription object that represents the related property.
     * @remarks
     * We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {PWSTR} pszRelationshipName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the relationship of the property to get.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through the <i>ppv</i> parameter, typically IID_IPropertyDescription.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the interface pointer requested in the parameter. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionrelatedpropertyinfo-getrelatedproperty
     */
    GetRelatedProperty(pszRelationshipName, riid) {
        pszRelationshipName := pszRelationshipName is String ? StrPtr(pszRelationshipName) : pszRelationshipName

        result := ComCall(24, this, "ptr", pszRelationshipName, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IPropertyDescriptionRelatedPropertyInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRelatedProperty := CallbackCreate(GetMethod(implObj, "GetRelatedProperty"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRelatedProperty)
    }
}

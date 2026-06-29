#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPropertyDescription.ahk" { IPropertyDescription }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that enumerate and retrieve individual property description details. (IPropertyDescription2)
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface, from which it inherits.
 * 
 * To obtain this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionbyname">PSGetPropertyDescriptionByName</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescriptionlist-getat">IPropertyDescriptionList::GetAt</a>.
 * 
 * Only one property description exists for each property in the system.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Do not implement this interface. There is only one implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> in the system; it is provided by the Shell.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertydescription2
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyDescription2 extends IPropertyDescription {
    /**
     * The interface identifier for IPropertyDescription2
     * @type {Guid}
     */
    static IID := Guid("{57d2eded-5062-400e-b107-5dae79fe57a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyDescription2 interfaces
    */
    struct Vtbl extends IPropertyDescription.Vtbl {
        GetImageReferenceForValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyDescription2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the image reference associated with a property value.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> for which to get an image.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a buffer that receives, when this method returns successfully, a string of the form &lt;dll name&gt;,-&lt;resid&gt; that is suitable to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-pathparseiconlocationa">PathParseIconLocation</a>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription2-getimagereferenceforvalue
     */
    GetImageReferenceForValue(propvar) {
        result := ComCall(24, this, PROPVARIANT.Ptr, propvar, PWSTR.Ptr, &ppszImageRes := 0, "HRESULT")
        return ppszImageRes
    }

    Query(iid) {
        if (IPropertyDescription2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImageReferenceForValue := CallbackCreate(GetMethod(implObj, "GetImageReferenceForValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImageReferenceForValue)
    }
}

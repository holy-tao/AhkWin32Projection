#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPropertyEnumType.ahk" { IPropertyEnumType }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that extract data from enumeration information. IPropertyEnumType2 extends IPropertyEnumType.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertyenumtype">IPropertyEnumType</a> interface, from which it inherits.
 * 
 * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertyenumtype2
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyEnumType2 extends IPropertyEnumType {
    /**
     * The interface identifier for IPropertyEnumType2
     * @type {Guid}
     */
    static IID := Guid("{9b6e051c-5ddd-4321-9070-fe2acb55e794}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyEnumType2 interfaces
    */
    struct Vtbl extends IPropertyEnumType.Vtbl {
        GetImageReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyEnumType2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the image reference associated with a property enumeration.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a buffer that, when this method returns successfully, receives a string of the form &lt;dll name&gt;,-&lt;resid&gt; that is suitable to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-pathparseiconlocationa">PathParseIconLocation</a>.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype2-getimagereference
     */
    GetImageReference() {
        result := ComCall(8, this, PWSTR.Ptr, &ppszImageRes := 0, "HRESULT")
        return ppszImageRes
    }

    Query(iid) {
        if (IPropertyEnumType2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImageReference := CallbackCreate(GetMethod(implObj, "GetImageReference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImageReference)
    }
}

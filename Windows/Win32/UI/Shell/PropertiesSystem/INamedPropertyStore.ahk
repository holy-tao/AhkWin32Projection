#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that get and set named properties.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-inamedpropertystore
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct INamedPropertyStore extends IUnknown {
    /**
     * The interface identifier for INamedPropertyStore
     * @type {Guid}
     */
    static IID := Guid("{71604b0f-97b0-4764-8577-2f13e98a1422}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INamedPropertyStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNamedValue : IntPtr
        SetNamedValue : IntPtr
        GetNameCount  : IntPtr
        GetNameAt     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INamedPropertyStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the value of a named property from the named property store.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the property name, as a Unicode string, of the property in the named property store.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that holds the property's value.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-getnamedvalue
     */
    GetNamedValue(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppropvar := PROPVARIANT()
        result := ComCall(3, this, "ptr", pszName, PROPVARIANT.Ptr, ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Sets the value of a named property.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the property name, as a Unicode string, in the named property store.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the value to set for the property named in <i>pszName</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-setnamedvalue
     */
    SetNamedValue(pszName, propvar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, PROPVARIANT.Ptr, propvar, "HRESULT")
        return result
    }

    /**
     * Gets the number of property names in the property store.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to the count of names.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-getnamecount
     */
    GetNameCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the name of a property at a specified index in the property store.
     * @param {Integer} iProp Type: <b>DWORD</b>
     * 
     * The index of the property in the store.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * When this method returns, contains a pointer to the property's name. It is the calling application's responsibility to free this resource when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-getnameat
     */
    GetNameAt(iProp) {
        pbstrName := BSTR.Owned()
        result := ComCall(6, this, "uint", iProp, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (INamedPropertyStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNamedValue := CallbackCreate(GetMethod(implObj, "GetNamedValue"), flags, 3)
        this.vtbl.SetNamedValue := CallbackCreate(GetMethod(implObj, "SetNamedValue"), flags, 3)
        this.vtbl.GetNameCount := CallbackCreate(GetMethod(implObj, "GetNameCount"), flags, 2)
        this.vtbl.GetNameAt := CallbackCreate(GetMethod(implObj, "GetNameAt"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNamedValue)
        CallbackFree(this.vtbl.SetNamedValue)
        CallbackFree(this.vtbl.GetNameCount)
        CallbackFree(this.vtbl.GetNameAt)
    }
}

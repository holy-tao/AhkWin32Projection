#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGuideDataProperty interface represents the name, value, and language of a property associated with a service, program or schedule entry object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IGuideDataProperty)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdatif/nn-bdatif-iguidedataproperty
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IGuideDataProperty extends IUnknown {
    /**
     * The interface identifier for IGuideDataProperty
     * @type {Guid}
     */
    static IID := Guid("{88ec5e58-bb73-41d6-99ce-66c524b8b591}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGuideDataProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Name     : IntPtr
        get_Language : IntPtr
        get_Value    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGuideDataProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * The get_Name method retrieves the name of the property.
     * @returns {BSTR} Pointer to a variable that receives a string containing the property name, for example "Description.ID" or "Description.Title".
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataproperty-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The get_Language method retrieves the language associated with the property.
     * @returns {Integer} Pointer to a variable that receives the language identifier.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataproperty-get_language
     */
    get_Language() {
        result := ComCall(4, this, "int*", &idLang := 0, "HRESULT")
        return idLang
    }

    /**
     * The get_Value method retrieves the value associated with the property.
     * @remarks
     * If the name of the property is "Description.Name" then the value of the property is the actual name of the service or show.
     * @returns {VARIANT} Pointer to a variable that receives the value of the property as a <b>VARIANT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataproperty-get_value
     */
    get_Value() {
        pvar := VARIANT()
        result := ComCall(5, this, VARIANT.Ptr, pvar, "HRESULT")
        return pvar
    }

    Query(iid) {
        if (IGuideDataProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Language := CallbackCreate(GetMethod(implObj, "get_Language"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Language)
        CallbackFree(this.vtbl.get_Value)
    }
}

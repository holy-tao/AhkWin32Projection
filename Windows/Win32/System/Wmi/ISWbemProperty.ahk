#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\WbemCimtypeEnum.ahk" { WbemCimtypeEnum }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISWbemQualifierSet.ahk" { ISWbemQualifierSet }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemProperty extends IDispatch {
    /**
     * The interface identifier for ISWbemProperty
     * @type {Guid}
     */
    static IID := Guid("{1a388f98-d4ba-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemProperty
     * @type {Guid}
     */
    static CLSID := Guid("{04b83d5d-21ae-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Value       : IntPtr
        put_Value       : IntPtr
        get_Name        : IntPtr
        get_IsLocal     : IntPtr
        get_Origin      : IntPtr
        get_CIMType     : IntPtr
        get_Qualifiers_ : IntPtr
        get_IsArray     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsLocal {
        get => this.get_IsLocal()
    }

    /**
     * @type {BSTR} 
     */
    Origin {
        get => this.get_Origin()
    }

    /**
     * @type {WbemCimtypeEnum} 
     */
    CIMType {
        get => this.get_CIMType()
    }

    /**
     * @type {ISWbemQualifierSet} 
     */
    Qualifiers_ {
        get => this.get_Qualifiers_()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsArray {
        get => this.get_IsArray()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        varValue := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, varValue, "HRESULT")
        return varValue
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, VARIANT.Ptr, varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLocal() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &bIsLocal := 0, "HRESULT")
        return bIsLocal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Origin() {
        strOrigin := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, strOrigin, "HRESULT")
        return strOrigin
    }

    /**
     * 
     * @returns {WbemCimtypeEnum} 
     */
    get_CIMType() {
        result := ComCall(12, this, "int*", &iCimType := 0, "HRESULT")
        return iCimType
    }

    /**
     * 
     * @returns {ISWbemQualifierSet} 
     */
    get_Qualifiers_() {
        result := ComCall(13, this, "ptr*", &objWbemQualifierSet := 0, "HRESULT")
        return ISWbemQualifierSet(objWbemQualifierSet)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsArray() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &bIsArray := 0, "HRESULT")
        return bIsArray
    }

    Query(iid) {
        if (ISWbemProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_IsLocal := CallbackCreate(GetMethod(implObj, "get_IsLocal"), flags, 2)
        this.vtbl.get_Origin := CallbackCreate(GetMethod(implObj, "get_Origin"), flags, 2)
        this.vtbl.get_CIMType := CallbackCreate(GetMethod(implObj, "get_CIMType"), flags, 2)
        this.vtbl.get_Qualifiers_ := CallbackCreate(GetMethod(implObj, "get_Qualifiers_"), flags, 2)
        this.vtbl.get_IsArray := CallbackCreate(GetMethod(implObj, "get_IsArray"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_IsLocal)
        CallbackFree(this.vtbl.get_Origin)
        CallbackFree(this.vtbl.get_CIMType)
        CallbackFree(this.vtbl.get_Qualifiers_)
        CallbackFree(this.vtbl.get_IsArray)
    }
}

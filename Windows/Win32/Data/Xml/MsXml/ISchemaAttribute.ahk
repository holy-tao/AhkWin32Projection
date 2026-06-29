#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISchemaComplexType.ahk" { ISchemaComplexType }
#Import ".\SCHEMAUSE.ahk" { SCHEMAUSE }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import ".\ISchemaType.ahk" { ISchemaType }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaAttribute extends ISchemaItem {
    /**
     * The interface identifier for ISchemaAttribute
     * @type {Guid}
     */
    static IID := Guid("{50ea08b6-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaAttribute interfaces
    */
    struct Vtbl extends ISchemaItem.Vtbl {
        get_type         : IntPtr
        get_scope        : IntPtr
        get_defaultValue : IntPtr
        get_fixedValue   : IntPtr
        get_use          : IntPtr
        get_isReference  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaAttribute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISchemaType} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {ISchemaComplexType} 
     */
    scope {
        get => this.get_scope()
    }

    /**
     * @type {BSTR} 
     */
    defaultValue {
        get => this.get_defaultValue()
    }

    /**
     * @type {BSTR} 
     */
    fixedValue {
        get => this.get_fixedValue()
    }

    /**
     * @type {SCHEMAUSE} 
     */
    use {
        get => this.get_use()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isReference {
        get => this.get_isReference()
    }

    /**
     * 
     * @returns {ISchemaType} 
     */
    get_type() {
        result := ComCall(14, this, "ptr*", &type := 0, "HRESULT")
        return ISchemaType(type)
    }

    /**
     * 
     * @returns {ISchemaComplexType} 
     */
    get_scope() {
        result := ComCall(15, this, "ptr*", &scope := 0, "HRESULT")
        return ISchemaComplexType(scope)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultValue() {
        defaultValue := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, defaultValue, "HRESULT")
        return defaultValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fixedValue() {
        fixedValue := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, fixedValue, "HRESULT")
        return fixedValue
    }

    /**
     * 
     * @returns {SCHEMAUSE} 
     */
    get_use() {
        result := ComCall(18, this, "int*", &use := 0, "HRESULT")
        return use
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isReference() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &_reference := 0, "HRESULT")
        return _reference
    }

    Query(iid) {
        if (ISchemaAttribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_scope := CallbackCreate(GetMethod(implObj, "get_scope"), flags, 2)
        this.vtbl.get_defaultValue := CallbackCreate(GetMethod(implObj, "get_defaultValue"), flags, 2)
        this.vtbl.get_fixedValue := CallbackCreate(GetMethod(implObj, "get_fixedValue"), flags, 2)
        this.vtbl.get_use := CallbackCreate(GetMethod(implObj, "get_use"), flags, 2)
        this.vtbl.get_isReference := CallbackCreate(GetMethod(implObj, "get_isReference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_scope)
        CallbackFree(this.vtbl.get_defaultValue)
        CallbackFree(this.vtbl.get_fixedValue)
        CallbackFree(this.vtbl.get_use)
        CallbackFree(this.vtbl.get_isReference)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Defines an instance of a property.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmproperty
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmProperty extends IDispatch {
    /**
     * The interface identifier for IFsrmProperty
     * @type {Guid}
     */
    static IID := Guid("{4a73fee4-4102-4fcc-9ffb-38614f9ee768}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name          : IntPtr
        get_Value         : IntPtr
        get_Sources       : IntPtr
        get_PropertyFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmProperty.Vtbl()
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
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Sources {
        get => this.get_Sources()
    }

    /**
     * @type {Integer} 
     */
    PropertyFlags {
        get => this.get_PropertyFlags()
    }

    /**
     * The name of the property. (IFsrmProperty.get_Name)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The value of the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_value
     */
    get_Value() {
        value := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * The modules and rules that have set the value.
     * @remarks
     * The format of the source string is  "<i>module_name</i>,<i>rule_name</i>".
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_sources
     */
    get_Sources() {
        result := ComCall(9, this, "ptr*", &_sources := 0, "HRESULT")
        return _sources
    }

    /**
     * Flag values that provides additional information about a property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmproperty-get_propertyflags
     */
    get_PropertyFlags() {
        result := ComCall(10, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    Query(iid) {
        if (IFsrmProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.get_Sources := CallbackCreate(GetMethod(implObj, "get_Sources"), flags, 2)
        this.vtbl.get_PropertyFlags := CallbackCreate(GetMethod(implObj, "get_PropertyFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.get_Sources)
        CallbackFree(this.vtbl.get_PropertyFlags)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmPropertyConditionType.ahk" { FsrmPropertyConditionType }

/**
 * Defines a property condition that the file management job uses to determine if the file is expired.
 * @remarks
 * The property condition specifies the classification property in the file to test. When the file management job runs, it gets the value of the classification property and uses the comparison operator to compare the value of the specified classification property (see the [Value](./nf-fsrmreports-ifsrmpropertycondition-get_value.md) property). If this condition  and all the other specified conditions for the job are met, FSRM can expire the file or call the custom action if it is defined.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nn-fsrmreports-ifsrmpropertycondition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPropertyCondition extends IDispatch {
    /**
     * The interface identifier for IFsrmPropertyCondition
     * @type {Guid}
     */
    static IID := Guid("{326af66f-2ac0-4f68-bf8c-4759f054fa29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPropertyCondition interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name  : IntPtr
        put_Name  : IntPtr
        get_Type  : IntPtr
        put_Type  : IntPtr
        get_Value : IntPtr
        put_Value : IntPtr
        Delete    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPropertyCondition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {FsrmPropertyConditionType} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * The name of the classification property whose value you want to compare to the property condition's value. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmpropertycondition-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The name of the classification property whose value you want to compare to the property condition's value. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmpropertycondition-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * The comparison operator used to determine whether the property condition is met. (Get)
     * @returns {FsrmPropertyConditionType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmpropertycondition-get_type
     */
    get_Type() {
        result := ComCall(9, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * The comparison operator used to determine whether the property condition is met. (Put)
     * @param {FsrmPropertyConditionType} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmpropertycondition-put_type
     */
    put_Type(type) {
        result := ComCall(10, this, FsrmPropertyConditionType, type, "HRESULT")
        return result
    }

    /**
     * The property condition's value. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmpropertycondition-get_value
     */
    get_Value() {
        value := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * The property condition's value. (Put)
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmpropertycondition-put_value
     */
    put_Value(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Removes this property condition from the collection of property conditions specified for the file management job.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmpropertycondition-delete
     */
    Delete() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmPropertyCondition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.put_Type := CallbackCreate(GetMethod(implObj, "put_Type"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.put_Type)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.Delete)
    }
}

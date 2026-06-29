#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFsrmFileCondition.ahk" { IFsrmFileCondition }
#Import ".\FsrmPropertyValueType.ahk" { FsrmPropertyValueType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmPropertyConditionType.ahk" { FsrmPropertyConditionType }
#Import ".\FsrmFileSystemPropertyId.ahk" { FsrmFileSystemPropertyId }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Defines a file condition property.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nn-fsrmreports-ifsrmfileconditionproperty
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmFileConditionProperty extends IFsrmFileCondition {
    /**
     * The interface identifier for IFsrmFileConditionProperty
     * @type {Guid}
     */
    static IID := Guid("{81926775-b981-4479-988f-da171d627360}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmFileConditionProperty interfaces
    */
    struct Vtbl extends IFsrmFileCondition.Vtbl {
        get_PropertyName : IntPtr
        put_PropertyName : IntPtr
        get_PropertyId   : IntPtr
        put_PropertyId   : IntPtr
        get_Operator     : IntPtr
        put_Operator     : IntPtr
        get_ValueType    : IntPtr
        put_ValueType    : IntPtr
        get_Value        : IntPtr
        put_Value        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmFileConditionProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    PropertyName {
        get => this.get_PropertyName()
        set => this.put_PropertyName(value)
    }

    /**
     * @type {FsrmFileSystemPropertyId} 
     */
    PropertyId {
        get => this.get_PropertyId()
        set => this.put_PropertyId(value)
    }

    /**
     * @type {FsrmPropertyConditionType} 
     */
    Operator {
        get => this.get_Operator()
        set => this.put_Operator(value)
    }

    /**
     * @type {FsrmPropertyValueType} 
     */
    ValueType {
        get => this.get_ValueType()
        set => this.put_ValueType(value)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Specifies the name of the file condition property. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_propertyname
     */
    get_PropertyName() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Specifies the name of the file condition property. (Put)
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_propertyname
     */
    put_PropertyName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * Specifies the predefined file property, as enumerated by the FsrmFileSystemPropertyId enumeration. (Get)
     * @returns {FsrmFileSystemPropertyId} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_propertyid
     */
    get_PropertyId() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Specifies the predefined file property, as enumerated by the FsrmFileSystemPropertyId enumeration. (Put)
     * @param {FsrmFileSystemPropertyId} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_propertyid
     */
    put_PropertyId(newVal) {
        result := ComCall(12, this, FsrmFileSystemPropertyId, newVal, "HRESULT")
        return result
    }

    /**
     * Specifies the comparison operator, as enumerated by the FsrmPropertyConditionType enumeration. (Get)
     * @returns {FsrmPropertyConditionType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_operator
     */
    get_Operator() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Specifies the comparison operator, as enumerated by the FsrmPropertyConditionType enumeration. (Put)
     * @param {FsrmPropertyConditionType} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_operator
     */
    put_Operator(newVal) {
        result := ComCall(14, this, FsrmPropertyConditionType, newVal, "HRESULT")
        return result
    }

    /**
     * Specifies the type of the file condition property value, as enumerated by the FsrmPropertyValueType enumeration. (Get)
     * @returns {FsrmPropertyValueType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_valuetype
     */
    get_ValueType() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Specifies the type of the file condition property value, as enumerated by the FsrmPropertyValueType enumeration. (Put)
     * @param {FsrmPropertyValueType} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_valuetype
     */
    put_ValueType(newVal) {
        result := ComCall(16, this, FsrmPropertyValueType, newVal, "HRESULT")
        return result
    }

    /**
     * Specifies the file condition property value. (Get)
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_value
     */
    get_Value() {
        pVal := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Specifies the file condition property value. (Put)
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_value
     */
    put_Value(newVal) {
        result := ComCall(18, this, VARIANT, newVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmFileConditionProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PropertyName := CallbackCreate(GetMethod(implObj, "get_PropertyName"), flags, 2)
        this.vtbl.put_PropertyName := CallbackCreate(GetMethod(implObj, "put_PropertyName"), flags, 2)
        this.vtbl.get_PropertyId := CallbackCreate(GetMethod(implObj, "get_PropertyId"), flags, 2)
        this.vtbl.put_PropertyId := CallbackCreate(GetMethod(implObj, "put_PropertyId"), flags, 2)
        this.vtbl.get_Operator := CallbackCreate(GetMethod(implObj, "get_Operator"), flags, 2)
        this.vtbl.put_Operator := CallbackCreate(GetMethod(implObj, "put_Operator"), flags, 2)
        this.vtbl.get_ValueType := CallbackCreate(GetMethod(implObj, "get_ValueType"), flags, 2)
        this.vtbl.put_ValueType := CallbackCreate(GetMethod(implObj, "put_ValueType"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PropertyName)
        CallbackFree(this.vtbl.put_PropertyName)
        CallbackFree(this.vtbl.get_PropertyId)
        CallbackFree(this.vtbl.put_PropertyId)
        CallbackFree(this.vtbl.get_Operator)
        CallbackFree(this.vtbl.put_Operator)
        CallbackFree(this.vtbl.get_ValueType)
        CallbackFree(this.vtbl.put_ValueType)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
    }
}

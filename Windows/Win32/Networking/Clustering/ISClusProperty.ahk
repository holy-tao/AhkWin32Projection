#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISClusPropertyValues.ahk" { ISClusPropertyValues }
#Import ".\CLUSTER_PROPERTY_FORMAT.ahk" { CLUSTER_PROPERTY_FORMAT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CLUSTER_PROPERTY_TYPE.ahk" { CLUSTER_PROPERTY_TYPE }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusProperty extends IDispatch {
    /**
     * The interface identifier for ISClusProperty
     * @type {Guid}
     */
    static IID := Guid("{f2e606fe-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name        : IntPtr
        get_Length      : IntPtr
        get_ValueCount  : IntPtr
        get_Values      : IntPtr
        get_Value       : IntPtr
        put_Value       : IntPtr
        get_Type        : IntPtr
        put_Type        : IntPtr
        get_Format      : IntPtr
        put_Format      : IntPtr
        get_ReadOnly    : IntPtr
        get_Private     : IntPtr
        get_Common      : IntPtr
        get_Modified    : IntPtr
        UseDefaultValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusProperty.Vtbl()
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
    Length {
        get => this.get_Length()
    }

    /**
     * @type {Integer} 
     */
    ValueCount {
        get => this.get_ValueCount()
    }

    /**
     * @type {ISClusPropertyValues} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {CLUSTER_PROPERTY_TYPE} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {CLUSTER_PROPERTY_FORMAT} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * @type {VARIANT} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * @type {VARIANT} 
     */
    Private {
        get => this.get_Private()
    }

    /**
     * @type {VARIANT} 
     */
    Common {
        get => this.get_Common()
    }

    /**
     * @type {VARIANT} 
     */
    Modified {
        get => this.get_Modified()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(8, this, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ValueCount() {
        result := ComCall(9, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {ISClusPropertyValues} 
     */
    get_Values() {
        result := ComCall(10, this, "ptr*", &ppClusterPropertyValues := 0, "HRESULT")
        return ISClusPropertyValues(ppClusterPropertyValues)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        pvarValue := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(12, this, VARIANT, varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CLUSTER_PROPERTY_TYPE} 
     */
    get_Type() {
        result := ComCall(13, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {CLUSTER_PROPERTY_TYPE} Type 
     * @returns {HRESULT} 
     */
    put_Type(Type) {
        result := ComCall(14, this, CLUSTER_PROPERTY_TYPE, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CLUSTER_PROPERTY_FORMAT} 
     */
    get_Format() {
        result := ComCall(15, this, "int*", &pFormat := 0, "HRESULT")
        return pFormat
    }

    /**
     * 
     * @param {CLUSTER_PROPERTY_FORMAT} Format 
     * @returns {HRESULT} 
     */
    put_Format(Format) {
        result := ComCall(16, this, CLUSTER_PROPERTY_FORMAT, Format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ReadOnly() {
        pvarReadOnly := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, pvarReadOnly, "HRESULT")
        return pvarReadOnly
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Private() {
        pvarPrivate := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, pvarPrivate, "HRESULT")
        return pvarPrivate
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Common() {
        pvarCommon := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, pvarCommon, "HRESULT")
        return pvarCommon
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Modified() {
        pvarModified := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, pvarModified, "HRESULT")
        return pvarModified
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UseDefaultValue() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISClusProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
        this.vtbl.get_ValueCount := CallbackCreate(GetMethod(implObj, "get_ValueCount"), flags, 2)
        this.vtbl.get_Values := CallbackCreate(GetMethod(implObj, "get_Values"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.put_Type := CallbackCreate(GetMethod(implObj, "put_Type"), flags, 2)
        this.vtbl.get_Format := CallbackCreate(GetMethod(implObj, "get_Format"), flags, 2)
        this.vtbl.put_Format := CallbackCreate(GetMethod(implObj, "put_Format"), flags, 2)
        this.vtbl.get_ReadOnly := CallbackCreate(GetMethod(implObj, "get_ReadOnly"), flags, 2)
        this.vtbl.get_Private := CallbackCreate(GetMethod(implObj, "get_Private"), flags, 2)
        this.vtbl.get_Common := CallbackCreate(GetMethod(implObj, "get_Common"), flags, 2)
        this.vtbl.get_Modified := CallbackCreate(GetMethod(implObj, "get_Modified"), flags, 2)
        this.vtbl.UseDefaultValue := CallbackCreate(GetMethod(implObj, "UseDefaultValue"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Length)
        CallbackFree(this.vtbl.get_ValueCount)
        CallbackFree(this.vtbl.get_Values)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.put_Type)
        CallbackFree(this.vtbl.get_Format)
        CallbackFree(this.vtbl.put_Format)
        CallbackFree(this.vtbl.get_ReadOnly)
        CallbackFree(this.vtbl.get_Private)
        CallbackFree(this.vtbl.get_Common)
        CallbackFree(this.vtbl.get_Modified)
        CallbackFree(this.vtbl.UseDefaultValue)
    }
}

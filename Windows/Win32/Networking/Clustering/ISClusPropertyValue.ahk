#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CLUSTER_PROPERTY_FORMAT.ahk" { CLUSTER_PROPERTY_FORMAT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISClusPropertyValueData.ahk" { ISClusPropertyValueData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CLUSTER_PROPERTY_TYPE.ahk" { CLUSTER_PROPERTY_TYPE }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusPropertyValue extends IDispatch {
    /**
     * The interface identifier for ISClusPropertyValue
     * @type {Guid}
     */
    static IID := Guid("{f2e6071a-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusPropertyValue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Value     : IntPtr
        put_Value     : IntPtr
        get_Type      : IntPtr
        put_Type      : IntPtr
        get_Format    : IntPtr
        put_Format    : IntPtr
        get_Length    : IntPtr
        get_DataCount : IntPtr
        get_Data      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusPropertyValue.Vtbl()
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
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * @type {Integer} 
     */
    DataCount {
        get => this.get_DataCount()
    }

    /**
     * @type {ISClusPropertyValueData} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        pvarValue := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, VARIANT, varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CLUSTER_PROPERTY_TYPE} 
     */
    get_Type() {
        result := ComCall(9, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {CLUSTER_PROPERTY_TYPE} Type 
     * @returns {HRESULT} 
     */
    put_Type(Type) {
        result := ComCall(10, this, CLUSTER_PROPERTY_TYPE, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CLUSTER_PROPERTY_FORMAT} 
     */
    get_Format() {
        result := ComCall(11, this, "int*", &pFormat := 0, "HRESULT")
        return pFormat
    }

    /**
     * 
     * @param {CLUSTER_PROPERTY_FORMAT} Format 
     * @returns {HRESULT} 
     */
    put_Format(Format) {
        result := ComCall(12, this, CLUSTER_PROPERTY_FORMAT, Format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(13, this, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataCount() {
        result := ComCall(14, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {ISClusPropertyValueData} 
     */
    get_Data() {
        result := ComCall(15, this, "ptr*", &ppClusterPropertyValueData := 0, "HRESULT")
        return ISClusPropertyValueData(ppClusterPropertyValueData)
    }

    Query(iid) {
        if (ISClusPropertyValue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.put_Type := CallbackCreate(GetMethod(implObj, "put_Type"), flags, 2)
        this.vtbl.get_Format := CallbackCreate(GetMethod(implObj, "get_Format"), flags, 2)
        this.vtbl.put_Format := CallbackCreate(GetMethod(implObj, "put_Format"), flags, 2)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
        this.vtbl.get_DataCount := CallbackCreate(GetMethod(implObj, "get_DataCount"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.put_Type)
        CallbackFree(this.vtbl.get_Format)
        CallbackFree(this.vtbl.put_Format)
        CallbackFree(this.vtbl.get_Length)
        CallbackFree(this.vtbl.get_DataCount)
        CallbackFree(this.vtbl.get_Data)
    }
}

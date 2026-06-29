#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IX509PrivateKey.ahk" { IX509PrivateKey }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\X509HardwareKeyUsageFlags.ahk" { X509HardwareKeyUsageFlags }
#Import ".\X509KeyParametersExportType.ahk" { X509KeyParametersExportType }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509PrivateKey2 extends IX509PrivateKey {
    /**
     * The interface identifier for IX509PrivateKey2
     * @type {Guid}
     */
    static IID := Guid("{728ab362-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509PrivateKey2 interfaces
    */
    struct Vtbl extends IX509PrivateKey.Vtbl {
        get_HardwareKeyUsage         : IntPtr
        put_HardwareKeyUsage         : IntPtr
        get_AlternateStorageLocation : IntPtr
        put_AlternateStorageLocation : IntPtr
        get_AlgorithmName            : IntPtr
        put_AlgorithmName            : IntPtr
        get_AlgorithmParameters      : IntPtr
        put_AlgorithmParameters      : IntPtr
        get_ParametersExportType     : IntPtr
        put_ParametersExportType     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509PrivateKey2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {X509HardwareKeyUsageFlags} 
     */
    HardwareKeyUsage {
        get => this.get_HardwareKeyUsage()
        set => this.put_HardwareKeyUsage(value)
    }

    /**
     * @type {BSTR} 
     */
    AlternateStorageLocation {
        get => this.get_AlternateStorageLocation()
        set => this.put_AlternateStorageLocation(value)
    }

    /**
     * @type {BSTR} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
        set => this.put_AlgorithmName(value)
    }

    /**
     * @type {X509KeyParametersExportType} 
     */
    ParametersExportType {
        get => this.get_ParametersExportType()
        set => this.put_ParametersExportType(value)
    }

    /**
     * 
     * @returns {X509HardwareKeyUsageFlags} 
     */
    get_HardwareKeyUsage() {
        result := ComCall(65, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {X509HardwareKeyUsageFlags} Value 
     * @returns {HRESULT} 
     */
    put_HardwareKeyUsage(Value) {
        result := ComCall(66, this, X509HardwareKeyUsageFlags, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_AlternateStorageLocation() {
        pValue := BSTR.Owned()
        result := ComCall(67, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_AlternateStorageLocation(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(68, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_AlgorithmName() {
        pValue := BSTR.Owned()
        result := ComCall(69, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_AlgorithmName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(70, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    get_AlgorithmParameters(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(71, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_AlgorithmParameters(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(72, this, EncodingType, Encoding, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {X509KeyParametersExportType} 
     */
    get_ParametersExportType() {
        result := ComCall(73, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {X509KeyParametersExportType} Value 
     * @returns {HRESULT} 
     */
    put_ParametersExportType(Value) {
        result := ComCall(74, this, X509KeyParametersExportType, Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509PrivateKey2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HardwareKeyUsage := CallbackCreate(GetMethod(implObj, "get_HardwareKeyUsage"), flags, 2)
        this.vtbl.put_HardwareKeyUsage := CallbackCreate(GetMethod(implObj, "put_HardwareKeyUsage"), flags, 2)
        this.vtbl.get_AlternateStorageLocation := CallbackCreate(GetMethod(implObj, "get_AlternateStorageLocation"), flags, 2)
        this.vtbl.put_AlternateStorageLocation := CallbackCreate(GetMethod(implObj, "put_AlternateStorageLocation"), flags, 2)
        this.vtbl.get_AlgorithmName := CallbackCreate(GetMethod(implObj, "get_AlgorithmName"), flags, 2)
        this.vtbl.put_AlgorithmName := CallbackCreate(GetMethod(implObj, "put_AlgorithmName"), flags, 2)
        this.vtbl.get_AlgorithmParameters := CallbackCreate(GetMethod(implObj, "get_AlgorithmParameters"), flags, 3)
        this.vtbl.put_AlgorithmParameters := CallbackCreate(GetMethod(implObj, "put_AlgorithmParameters"), flags, 3)
        this.vtbl.get_ParametersExportType := CallbackCreate(GetMethod(implObj, "get_ParametersExportType"), flags, 2)
        this.vtbl.put_ParametersExportType := CallbackCreate(GetMethod(implObj, "put_ParametersExportType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HardwareKeyUsage)
        CallbackFree(this.vtbl.put_HardwareKeyUsage)
        CallbackFree(this.vtbl.get_AlternateStorageLocation)
        CallbackFree(this.vtbl.put_AlternateStorageLocation)
        CallbackFree(this.vtbl.get_AlgorithmName)
        CallbackFree(this.vtbl.put_AlgorithmName)
        CallbackFree(this.vtbl.get_AlgorithmParameters)
        CallbackFree(this.vtbl.put_AlgorithmParameters)
        CallbackFree(this.vtbl.get_ParametersExportType)
        CallbackFree(this.vtbl.put_ParametersExportType)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509PrivateKey.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PrivateKey2 extends IX509PrivateKey{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PrivateKey2
     * @type {Guid}
     */
    static IID => Guid("{728ab362-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HardwareKeyUsage", "put_HardwareKeyUsage", "get_AlternateStorageLocation", "put_AlternateStorageLocation", "get_AlgorithmName", "put_AlgorithmName", "get_AlgorithmParameters", "put_AlgorithmParameters", "get_ParametersExportType", "put_ParametersExportType"]

    /**
     * @type {Integer} 
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
     * @type {Integer} 
     */
    ParametersExportType {
        get => this.get_ParametersExportType()
        set => this.put_ParametersExportType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareKeyUsage() {
        result := ComCall(65, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    put_HardwareKeyUsage(Value) {
        result := ComCall(66, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_AlternateStorageLocation() {
        pValue := BSTR()
        result := ComCall(67, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_AlternateStorageLocation(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(68, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_AlgorithmName() {
        pValue := BSTR()
        result := ComCall(69, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_AlgorithmName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(70, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    get_AlgorithmParameters(Encoding) {
        pValue := BSTR()
        result := ComCall(71, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_AlgorithmParameters(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(72, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ParametersExportType() {
        result := ComCall(73, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    put_ParametersExportType(Value) {
        result := ComCall(74, this, "int", Value, "HRESULT")
        return result
    }
}

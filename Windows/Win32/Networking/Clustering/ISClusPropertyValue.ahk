#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISClusPropertyValueData.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusPropertyValue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusPropertyValue
     * @type {Guid}
     */
    static IID => Guid("{f2e6071a-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_Type", "put_Type", "get_Format", "put_Format", "get_Length", "get_DataCount", "get_Data"]

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {Integer} 
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
        result := ComCall(7, this, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(9, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    put_Type(Type) {
        result := ComCall(10, this, "int", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        result := ComCall(11, this, "int*", &pFormat := 0, "HRESULT")
        return pFormat
    }

    /**
     * 
     * @param {Integer} Format 
     * @returns {HRESULT} 
     */
    put_Format(Format) {
        result := ComCall(12, this, "int", Format, "HRESULT")
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
}

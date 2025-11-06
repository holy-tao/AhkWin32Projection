#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusPropertyValues.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusProperty
     * @type {Guid}
     */
    static IID => Guid("{f2e606fe-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Length", "get_ValueCount", "get_Values", "get_Value", "put_Value", "get_Type", "put_Type", "get_Format", "put_Format", "get_ReadOnly", "get_Private", "get_Common", "get_Modified", "UseDefaultValue"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
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
        result := ComCall(11, this, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(12, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(13, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    put_Type(Type) {
        result := ComCall(14, this, "int", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        result := ComCall(15, this, "int*", &pFormat := 0, "HRESULT")
        return pFormat
    }

    /**
     * 
     * @param {Integer} Format 
     * @returns {HRESULT} 
     */
    put_Format(Format) {
        result := ComCall(16, this, "int", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ReadOnly() {
        pvarReadOnly := VARIANT()
        result := ComCall(17, this, "ptr", pvarReadOnly, "HRESULT")
        return pvarReadOnly
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Private() {
        pvarPrivate := VARIANT()
        result := ComCall(18, this, "ptr", pvarPrivate, "HRESULT")
        return pvarPrivate
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Common() {
        pvarCommon := VARIANT()
        result := ComCall(19, this, "ptr", pvarCommon, "HRESULT")
        return pvarCommon
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Modified() {
        pvarModified := VARIANT()
        result := ComCall(20, this, "ptr", pvarModified, "HRESULT")
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
}

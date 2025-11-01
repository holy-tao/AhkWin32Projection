#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLength 
     * @returns {HRESULT} 
     */
    get_Length(pLength) {
        pLengthMarshal := pLength is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pLengthMarshal, pLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    get_ValueCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusPropertyValues>} ppClusterPropertyValues 
     * @returns {HRESULT} 
     */
    get_Values(ppClusterPropertyValues) {
        result := ComCall(10, this, "ptr*", ppClusterPropertyValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    get_Value(pvarValue) {
        result := ComCall(11, this, "ptr", pvarValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pTypeMarshal, pType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pFormat 
     * @returns {HRESULT} 
     */
    get_Format(pFormat) {
        pFormatMarshal := pFormat is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pFormatMarshal, pFormat, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarReadOnly 
     * @returns {HRESULT} 
     */
    get_ReadOnly(pvarReadOnly) {
        result := ComCall(17, this, "ptr", pvarReadOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrivate 
     * @returns {HRESULT} 
     */
    get_Private(pvarPrivate) {
        result := ComCall(18, this, "ptr", pvarPrivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarCommon 
     * @returns {HRESULT} 
     */
    get_Common(pvarCommon) {
        result := ComCall(19, this, "ptr", pvarCommon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarModified 
     * @returns {HRESULT} 
     */
    get_Modified(pvarModified) {
        result := ComCall(20, this, "ptr", pvarModified, "HRESULT")
        return result
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

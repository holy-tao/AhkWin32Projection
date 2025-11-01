#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    get_Value(pvarValue) {
        result := ComCall(7, this, "ptr", pvarValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pTypeMarshal, pType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pFormat 
     * @returns {HRESULT} 
     */
    get_Format(pFormat) {
        pFormatMarshal := pFormat is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pFormatMarshal, pFormat, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pLength 
     * @returns {HRESULT} 
     */
    get_Length(pLength) {
        pLengthMarshal := pLength is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pLengthMarshal, pLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    get_DataCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISClusPropertyValueData>} ppClusterPropertyValueData 
     * @returns {HRESULT} 
     */
    get_Data(ppClusterPropertyValueData) {
        result := ComCall(15, this, "ptr*", ppClusterPropertyValueData, "HRESULT")
        return result
    }
}

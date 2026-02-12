#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IBidiRequest extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBidiRequest
     * @type {Guid}
     */
    static IID => Guid("{8f348bd7-4b47-4755-8a9d-0f422df3dc89}")

    /**
     * The class identifier for BidiRequest
     * @type {Guid}
     */
    static CLSID => Guid("{b9162a23-45f9-47cc-80f5-fe0fe9b9e1a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSchema", "SetInputData", "GetResult", "GetOutputData", "GetEnumCount"]

    /**
     * 
     * @param {PWSTR} pszSchema 
     * @returns {HRESULT} 
     */
    SetSchema(pszSchema) {
        pszSchema := pszSchema is String ? StrPtr(pszSchema) : pszSchema

        result := ComCall(3, this, "ptr", pszSchema, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwType 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} uSize 
     * @returns {HRESULT} 
     */
    SetInputData(dwType, pData, uSize) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwType, pDataMarshal, pData, "uint", uSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a list of properties the recognizer can return for a result range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-getresultpropertylist
     */
    GetResult() {
        result := ComCall(5, this, "int*", &phr := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phr
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PWSTR>} ppszSchema 
     * @param {Pointer<Integer>} pdwType 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @param {Pointer<Integer>} uSize 
     * @returns {HRESULT} 
     */
    GetOutputData(dwIndex, ppszSchema, pdwType, ppData, uSize) {
        ppszSchemaMarshal := ppszSchema is VarRef ? "ptr*" : "ptr"
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        uSizeMarshal := uSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwIndex, ppszSchemaMarshal, ppszSchema, pdwTypeMarshal, pdwType, ppDataMarshal, ppData, uSizeMarshal, uSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEnumCount() {
        result := ComCall(7, this, "uint*", &pdwTotal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwTotal
    }
}

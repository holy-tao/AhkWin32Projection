#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * Used to store and retrieve query parameters to and from persistent storage.
 * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nn-cmnquery-ipersistquery
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IPersistQuery extends IPersist{
    /**
     * The interface identifier for IPersistQuery
     * @type {Guid}
     */
    static IID => Guid("{1a3114b8-a62e-11d0-a6c5-00a0c906af45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {PWSTR} pSection 
     * @param {PWSTR} pValueName 
     * @param {PWSTR} pValue 
     * @returns {HRESULT} 
     */
    WriteString(pSection, pValueName, pValue) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        pValue := pValue is String ? StrPtr(pValue) : pValue

        result := ComCall(4, this, "ptr", pSection, "ptr", pValueName, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pSection 
     * @param {PWSTR} pValueName 
     * @param {PWSTR} pBuffer 
     * @param {Integer} cchBuffer 
     * @returns {HRESULT} 
     */
    ReadString(pSection, pValueName, pBuffer, cchBuffer) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        pBuffer := pBuffer is String ? StrPtr(pBuffer) : pBuffer

        result := ComCall(5, this, "ptr", pSection, "ptr", pValueName, "ptr", pBuffer, "int", cchBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pSection 
     * @param {PWSTR} pValueName 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    WriteInt(pSection, pValueName, value) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        result := ComCall(6, this, "ptr", pSection, "ptr", pValueName, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pSection 
     * @param {PWSTR} pValueName 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    ReadInt(pSection, pValueName, pValue) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        result := ComCall(7, this, "ptr", pSection, "ptr", pValueName, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pSection 
     * @param {PWSTR} pValueName 
     * @param {Pointer<Void>} pStruct 
     * @param {Integer} cbStruct 
     * @returns {HRESULT} 
     */
    WriteStruct(pSection, pValueName, pStruct, cbStruct) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        result := ComCall(8, this, "ptr", pSection, "ptr", pValueName, "ptr", pStruct, "uint", cbStruct, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pSection 
     * @param {PWSTR} pValueName 
     * @param {Pointer<Void>} pStruct 
     * @param {Integer} cbStruct 
     * @returns {HRESULT} 
     */
    ReadStruct(pSection, pValueName, pStruct, cbStruct) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        result := ComCall(9, this, "ptr", pSection, "ptr", pValueName, "ptr", pStruct, "uint", cbStruct, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

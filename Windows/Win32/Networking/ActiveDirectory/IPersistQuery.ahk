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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteString", "ReadString", "WriteInt", "ReadInt", "WriteStruct", "ReadStruct", "Clear"]

    /**
     * Writes a string to the query store.
     * @param {PWSTR} pSection Pointer to a null-terminated Unicode string that represents the section name that the string should be written to.
     * @param {PWSTR} pValueName Pointer to a null-terminated Unicode string that represents the name of the string value.
     * @param {PWSTR} pValue Pointer to a null-terminated Unicode string that contains the string to be written.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard  <b>HRESULT</b> value otherwise. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-ipersistquery-writestring
     */
    WriteString(pSection, pValueName, pValue) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        pValue := pValue is String ? StrPtr(pValue) : pValue

        result := ComCall(4, this, "ptr", pSection, "ptr", pValueName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Reads a string from the query store.
     * @param {PWSTR} pSection Pointer to a null-terminated Unicode string that represents the section name that the string should be read from.
     * @param {PWSTR} pValueName Pointer to a null-terminated Unicode string that represents the name of the string value to be read.
     * @param {PWSTR} pBuffer Pointer to a character buffer that receives the string value. The <i>cchBuffer</i> parameter specifies the size of this buffer including the null terminator.
     * @param {Integer} cchBuffer Contains the size, in characters, of the <i>pBuffer</i> buffer including the null terminator.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard  <b>HRESULT</b> value otherwise. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-ipersistquery-readstring
     */
    ReadString(pSection, pValueName, pBuffer, cchBuffer) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName
        pBuffer := pBuffer is String ? StrPtr(pBuffer) : pBuffer

        result := ComCall(5, this, "ptr", pSection, "ptr", pValueName, "ptr", pBuffer, "int", cchBuffer, "HRESULT")
        return result
    }

    /**
     * Writes an integer value to the query store.
     * @param {PWSTR} pSection Pointer to a null-terminated Unicode string that represents the section name that the integer should be written to.
     * @param {PWSTR} pValueName Pointer to a null-terminated Unicode string that represents the name of the integer value.
     * @param {Integer} value Contains the integer value to be written to the query store.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard  <b>HRESULT</b> value otherwise. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-ipersistquery-writeint
     */
    WriteInt(pSection, pValueName, value) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        result := ComCall(6, this, "ptr", pSection, "ptr", pValueName, "int", value, "HRESULT")
        return result
    }

    /**
     * Reads an integer value from the query store.
     * @param {PWSTR} pSection A pointer to a null-terminated Unicode string that represents the section name that the integer should be read from.
     * @param {PWSTR} pValueName A pointer to a null-terminated Unicode string that represents the name of the integer value to be read.
     * @param {Pointer<Integer>} pValue Pointer to an integer variable that receives the integer value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard  <b>HRESULT</b> value otherwise. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-ipersistquery-readint
     */
    ReadInt(pSection, pValueName, pValue) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pSection, "ptr", pValueName, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Writes a structure to the query store.
     * @param {PWSTR} pSection Pointer to a null-terminated Unicode string that represents the section name that the structure should be written to.
     * @param {PWSTR} pValueName Pointer to a null-terminated Unicode string that represents the name of the structure.
     * @param {Pointer<Void>} pStruct Pointer to the structure to be written. The <i>cbStruct</i> parameter contains the number of bytes to be written.
     * @param {Integer} cbStruct Contains the size, in bytes, of the structure to be written.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard  <b>HRESULT</b> value otherwise. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-ipersistquery-writestruct
     */
    WriteStruct(pSection, pValueName, pStruct, cbStruct) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        pStructMarshal := pStruct is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", pSection, "ptr", pValueName, pStructMarshal, pStruct, "uint", cbStruct, "HRESULT")
        return result
    }

    /**
     * Reads a structure from the query store.
     * @param {PWSTR} pSection Pointer to a null-terminated Unicode string that represents the section name that the structure should be read from.
     * @param {PWSTR} pValueName Pointer to a null-terminated Unicode string that represents the name of the structure value to be read.
     * @param {Pointer<Void>} pStruct Pointer to a buffer that will receive the structure. The <i>cbStruct</i> parameter specifies the size of this buffer, in bytes.
     * @param {Integer} cbStruct Specifies the size, in bytes, of the  buffer represented by the <i>pStruct</i> parameter.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard  <b>HRESULT</b> value otherwise. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-ipersistquery-readstruct
     */
    ReadStruct(pSection, pValueName, pStruct, cbStruct) {
        pSection := pSection is String ? StrPtr(pSection) : pSection
        pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

        pStructMarshal := pStruct is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "ptr", pSection, "ptr", pValueName, pStructMarshal, pStruct, "uint", cbStruct, "HRESULT")
        return result
    }

    /**
     * Empties the contents of the query store.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or a standard  <b>HRESULT</b> value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-ipersistquery-clear
     */
    Clear() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}

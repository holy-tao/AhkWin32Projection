#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a generic way to store key/value pairs on an object.
 * @remarks
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfattributes
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAttributes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAttributes
     * @type {Guid}
     */
    static IID => Guid("{2cd2d921-c447-44a7-a13c-4adabfc247e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItem", "GetItemType", "CompareItem", "Compare", "GetUINT32", "GetUINT64", "GetDouble", "GetGUID", "GetStringLength", "GetString", "GetAllocatedString", "GetBlobSize", "GetBlob", "GetAllocatedBlob", "GetUnknown", "SetItem", "DeleteItem", "DeleteAllItems", "SetUINT32", "SetUINT64", "SetDouble", "SetGUID", "SetString", "SetBlob", "SetUnknown", "LockStore", "UnlockStore", "GetCount", "GetItemByIndex", "CopyAllItems"]

    /**
     * Retrieves the value associated with a key.
     * @param {Pointer<Guid>} guidKey A GUID that identifies which value to retrieve.
     * @param {Pointer<PROPVARIANT>} pValue A pointer to a <b>PROPVARIANT</b> that receives the value. The method fills the <b>PROPVARIANT</b> with a copy of the stored value, if the value is found. Call <b>PropVariantClear</b> to free the memory allocated by this method. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, the method searches for the key and returns S_OK if the key is found, but does not copy the value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ATTRIBUTENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified key was not found.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getitem
     */
    GetItem(guidKey, pValue) {
        result := ComCall(3, this, "ptr", guidKey, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the data type of the value associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to query.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_type">MF_ATTRIBUTE_TYPE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getitemtype
     */
    GetItemType(guidKey) {
        result := ComCall(4, this, "ptr", guidKey, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Queries whether a stored attribute value equals to a specified PROPVARIANT.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to query.
     * @param {Pointer<PROPVARIANT>} Value <b>PROPVARIANT</b> that contains the value to compare.
     * @returns {BOOL} Receives a Boolean value indicating whether the attribute matches the value given in <i>Value</i>. See Remarks. This parameter must not be <b>NULL</b>. If this parameter is <b>NULL</b>, an access violation occurs.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-compareitem
     */
    CompareItem(guidKey, Value) {
        result := ComCall(5, this, "ptr", guidKey, "ptr", Value, "int*", &pbResult := 0, "HRESULT")
        return pbResult
    }

    /**
     * Compares the attributes on this object with the attributes on another object.
     * @param {IMFAttributes} pTheirs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the object to compare with this object.
     * @param {Integer} MatchType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attributes_match_type">MF_ATTRIBUTES_MATCH_TYPE</a> enumeration, specifying the type of comparison to make.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the two sets of attributes match in the way specified by the <i>MatchType</i> parameter. Otherwise, the value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-compare
     */
    Compare(pTheirs, MatchType) {
        result := ComCall(6, this, "ptr", pTheirs, "int", MatchType, "int*", &pbResult := 0, "HRESULT")
        return pbResult
    }

    /**
     * Retrieves a UINT32 value associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_UINT32</b>.
     * @returns {Integer} Receives a <b>UINT32</b> value. If the key is found and the data type is <b>UINT32</b>, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getuint32
     */
    GetUINT32(guidKey) {
        result := ComCall(7, this, "ptr", guidKey, "uint*", &punValue := 0, "HRESULT")
        return punValue
    }

    /**
     * Retrieves a UINT64 value associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_UINT64</b>.
     * @returns {Integer} Receives a <b>UINT64</b> value. If the key is found and the data type is <b>UINT64</b>, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getuint64
     */
    GetUINT64(guidKey) {
        result := ComCall(8, this, "ptr", guidKey, "uint*", &punValue := 0, "HRESULT")
        return punValue
    }

    /**
     * Retrieves a double value associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_DOUBLE</b>.
     * @returns {Float} Receives a <b>double</b> value. If the key is found and the data type is <b>double</b>, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getdouble
     */
    GetDouble(guidKey) {
        result := ComCall(9, this, "ptr", guidKey, "double*", &pfValue := 0, "HRESULT")
        return pfValue
    }

    /**
     * Retrieves a GUID value associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_GUID</b>.
     * @returns {Guid} Receives a GUID value. If the key is found and the data type is GUID, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getguid
     */
    GetGUID(guidKey) {
        pguidValue := Guid()
        result := ComCall(10, this, "ptr", guidKey, "ptr", pguidValue, "HRESULT")
        return pguidValue
    }

    /**
     * Retrieves the length of a string value associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_STRING</b>.
     * @returns {Integer} If the key is found and the value is a string type, this parameter receives the number of characters in the string, not including the terminating <b>NULL</b> character. To get the string value, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getstring">IMFAttributes::GetString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getstringlength
     */
    GetStringLength(guidKey) {
        result := ComCall(11, this, "ptr", guidKey, "uint*", &pcchLength := 0, "HRESULT")
        return pcchLength
    }

    /**
     * Retrieves a wide-character string associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_STRING</b>.
     * @param {PWSTR} pwszValue Pointer to a wide-character array allocated by the caller. The array must be large enough to hold the string, including the terminating <b>NULL</b> character. If the key is found and the value is a string type, the method copies the string into this buffer. To find the length of the string, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getstringlength">IMFAttributes::GetStringLength</a>.
     * @param {Integer} cchBufSize The size of the <i>pwszValue</i> array, in characters. This value includes the terminating NULL character.
     * @param {Pointer<Integer>} pcchLength Receives the number of characters in the string, excluding the terminating <b>NULL</b> character. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of the string is too large to fit in a <b>UINT32</b> value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_SUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is not large enough to hold the string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ATTRIBUTENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified key was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value is not a string.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getstring
     */
    GetString(guidKey, pwszValue, cchBufSize, pcchLength) {
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", guidKey, "ptr", pwszValue, "uint", cchBufSize, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * Gets a wide-character string associated with a key. This method allocates the memory for the string.
     * @param {Pointer<Guid>} guidKey A GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_STRING</b>.
     * @param {Pointer<PWSTR>} ppwszValue If the key is found and the value is a string type, this parameter receives a copy of the string. The caller must free the memory for the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcchLength Receives the number of characters in the string, excluding the terminating <b>NULL</b> character. This parameter must not be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ATTRIBUTENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified key was not found.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value is not a string.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getallocatedstring
     */
    GetAllocatedString(guidKey, ppwszValue, pcchLength) {
        ppwszValueMarshal := ppwszValue is VarRef ? "ptr*" : "ptr"
        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", guidKey, ppwszValueMarshal, ppwszValue, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * Retrieves the length of a byte array associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_BLOB</b>.
     * @returns {Integer} If the key is found and the value is a byte array, this parameter receives the size of the array, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getblobsize
     */
    GetBlobSize(guidKey) {
        result := ComCall(14, this, "ptr", guidKey, "uint*", &pcbBlobSize := 0, "HRESULT")
        return pcbBlobSize
    }

    /**
     * Retrieves a byte array associated with a key. This method copies the array into a caller-allocated buffer.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_BLOB</b>.
     * @param {Integer} cbBufSize The size of the <i>pBuf</i> buffer, in bytes.
     * @param {Pointer<Integer>} pcbBlobSize Receives the size of the byte array. This parameter can be <b>NULL</b>.
     * @returns {Integer} Pointer to a buffer allocated by the caller. If the key is found and the value is a byte array, the method copies the array into this buffer. To find the required size of the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getblobsize">IMFAttributes::GetBlobSize</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getblob
     */
    GetBlob(guidKey, cbBufSize, pcbBlobSize) {
        pcbBlobSizeMarshal := pcbBlobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", guidKey, "char*", &pBuf := 0, "uint", cbBufSize, pcbBlobSizeMarshal, pcbBlobSize, "HRESULT")
        return pBuf
    }

    /**
     * Retrieves a byte array associated with a key. This method allocates the memory for the array.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_BLOB</b>.
     * @param {Pointer<Pointer<Integer>>} ppBuf If the key is found and the value is a byte array, this parameter receives a copy of the array. The caller must free the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbSize Receives the size of the array, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ATTRIBUTENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified key was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute value is not a byte array.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getallocatedblob
     */
    GetAllocatedBlob(guidKey, ppBuf, pcbSize) {
        ppBufMarshal := ppBuf is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", guidKey, ppBufMarshal, ppBuf, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface pointer associated with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_IUNKNOWN</b>.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the interface to retrieve.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getunknown
     */
    GetUnknown(guidKey, riid) {
        result := ComCall(17, this, "ptr", guidKey, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Adds an attribute value with a specified key.
     * @param {Pointer<Guid>} guidKey A GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {Pointer<PROPVARIANT>} Value A <b>PROPVARIANT</b> that contains the attribute value. The method copies the value. The <b>PROPVARIANT</b> type must be one of the types listed in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_type">MF_ATTRIBUTE_TYPE</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid attribute type.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setitem
     */
    SetItem(guidKey, Value) {
        result := ComCall(18, this, "ptr", guidKey, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Removes a key/value pair from the object's attribute list.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to delete.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-deleteitem
     */
    DeleteItem(guidKey) {
        result := ComCall(19, this, "ptr", guidKey, "HRESULT")
        return result
    }

    /**
     * Removes all key/value pairs from the object's attribute list.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-deleteallitems
     */
    DeleteAllItems() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * Associates a UINT32 value with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {Integer} unValue New value for this key.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setuint32
     */
    SetUINT32(guidKey, unValue) {
        result := ComCall(21, this, "ptr", guidKey, "uint", unValue, "HRESULT")
        return result
    }

    /**
     * Associates a UINT64 value with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {Integer} unValue New value for this key.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setuint64
     */
    SetUINT64(guidKey, unValue) {
        result := ComCall(22, this, "ptr", guidKey, "uint", unValue, "HRESULT")
        return result
    }

    /**
     * Associates a double value with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {Float} fValue New value for this key.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setdouble
     */
    SetDouble(guidKey, fValue) {
        result := ComCall(23, this, "ptr", guidKey, "double", fValue, "HRESULT")
        return result
    }

    /**
     * Associates a GUID value with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {Pointer<Guid>} guidValue New value for this key.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setguid
     */
    SetGUID(guidKey, guidValue) {
        result := ComCall(24, this, "ptr", guidKey, "ptr", guidValue, "HRESULT")
        return result
    }

    /**
     * Associates a wide-character string with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {PWSTR} wszValue Null-terminated wide-character string to associate with this key. The method stores a copy of the string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setstring
     */
    SetString(guidKey, wszValue) {
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        result := ComCall(25, this, "ptr", guidKey, "ptr", wszValue, "HRESULT")
        return result
    }

    /**
     * Associates a byte array with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {Pointer<Integer>} pBuf Pointer to a byte array to associate with this key. The method stores a copy of the array.
     * @param {Integer} cbBufSize Size of the array, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setblob
     */
    SetBlob(guidKey, pBuf, cbBufSize) {
        pBufMarshal := pBuf is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, "ptr", guidKey, pBufMarshal, pBuf, "uint", cbBufSize, "HRESULT")
        return result
    }

    /**
     * Associates an IUnknown pointer with a key.
     * @param {Pointer<Guid>} guidKey GUID that identifies the value to set. If this key already exists, the method overwrites the old value.
     * @param {IUnknown} pUnknown <b>IUnknown</b> pointer to be associated with this key.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-setunknown
     */
    SetUnknown(guidKey, pUnknown) {
        result := ComCall(27, this, "ptr", guidKey, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * Locks the attribute store so that no other thread can access it.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-lockstore
     */
    LockStore() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * Unlocks the attribute store after a call to the IMFAttributes::LockStore method. While the object is unlocked, multiple threads can access the object's attributes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-unlockstore
     */
    UnlockStore() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of attributes that are set on this object.
     * @returns {Integer} Receives the number of attributes. This parameter must not be <b>NULL</b>. If this parameter is <b>NULL</b>, an access violation occurs.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getcount
     */
    GetCount() {
        result := ComCall(30, this, "uint*", &pcItems := 0, "HRESULT")
        return pcItems
    }

    /**
     * Retrieves an attribute at the specified index.
     * @param {Integer} unIndex Index of the attribute to retrieve. To get the number of attributes, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getcount">IMFAttributes::GetCount</a>.
     * @param {Pointer<PROPVARIANT>} pValue Pointer to a <b>PROPVARIANT</b> that receives the value. This parameter can be <b>NULL</b>. If it is not <b>NULL</b>, the method fills the <b>PROPVARIANT</b> with a copy of the attribute value. Call <b>PropVariantClear</b> to free the memory allocated by this method.
     * @returns {Guid} Receives the GUID that identifies this attribute.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-getitembyindex
     */
    GetItemByIndex(unIndex, pValue) {
        pguidKey := Guid()
        result := ComCall(31, this, "uint", unIndex, "ptr", pguidKey, "ptr", pValue, "HRESULT")
        return pguidKey
    }

    /**
     * Copies all of the attributes from this object into another attribute store.
     * @param {IMFAttributes} pDest A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store that receives the copy.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-imfattributes-copyallitems
     */
    CopyAllItems(pDest) {
        result := ComCall(32, this, "ptr", pDest, "HRESULT")
        return result
    }
}

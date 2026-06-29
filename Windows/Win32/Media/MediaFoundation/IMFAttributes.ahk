#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_ATTRIBUTE_TYPE.ahk" { MF_ATTRIBUTE_TYPE }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_ATTRIBUTES_MATCH_TYPE.ahk" { MF_ATTRIBUTES_MATCH_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a generic way to store key/value pairs on an object.
 * @remarks
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfattributes
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFAttributes extends IUnknown {
    /**
     * The interface identifier for IMFAttributes
     * @type {Guid}
     */
    static IID := Guid("{2cd2d921-c447-44a7-a13c-4adabfc247e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFAttributes interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItem            : IntPtr
        GetItemType        : IntPtr
        CompareItem        : IntPtr
        Compare            : IntPtr
        GetUINT32          : IntPtr
        GetUINT64          : IntPtr
        GetDouble          : IntPtr
        GetGUID            : IntPtr
        GetStringLength    : IntPtr
        GetString          : IntPtr
        GetAllocatedString : IntPtr
        GetBlobSize        : IntPtr
        GetBlob            : IntPtr
        GetAllocatedBlob   : IntPtr
        GetUnknown         : IntPtr
        SetItem            : IntPtr
        DeleteItem         : IntPtr
        DeleteAllItems     : IntPtr
        SetUINT32          : IntPtr
        SetUINT64          : IntPtr
        SetDouble          : IntPtr
        SetGUID            : IntPtr
        SetString          : IntPtr
        SetBlob            : IntPtr
        SetUnknown         : IntPtr
        LockStore          : IntPtr
        UnlockStore        : IntPtr
        GetCount           : IntPtr
        GetItemByIndex     : IntPtr
        CopyAllItems       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFAttributes.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the value associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitem
     */
    GetItem(guidKey, pValue) {
        result := ComCall(3, this, Guid.Ptr, guidKey, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the data type of the value associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to query.
     * @returns {MF_ATTRIBUTE_TYPE} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_type">MF_ATTRIBUTE_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitemtype
     */
    GetItemType(guidKey) {
        result := ComCall(4, this, Guid.Ptr, guidKey, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Queries whether a stored attribute value equals to a specified PROPVARIANT.
     * @remarks
     * The method sets <i>pbResult</i> to <b>FALSE</b> for any of the following reasons:
     * 
     * <ul>
     * <li>
     * No attribute is found whose key matches the one given in <i>guidKey</i>.
     * 
     * </li>
     * <li>
     * The attribute's <b>PROPVARIANT</b> type does not match the type given in <i>Value</i>.
     * 
     * </li>
     * <li>
     * The attribute value does not match the value given in <i>Value</i>.
     * 
     * </li>
     * <li>
     * The method fails.
     * 
     * </li>
     * </ul>
     * Otherwise, the method sets <i>pbResult</i> to <b>TRUE</b>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to query.
     * @param {Pointer<PROPVARIANT>} Value <b>PROPVARIANT</b> that contains the value to compare.
     * @returns {BOOL} Receives a Boolean value indicating whether the attribute matches the value given in <i>Value</i>. See Remarks. This parameter must not be <b>NULL</b>. If this parameter is <b>NULL</b>, an access violation occurs.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-compareitem
     */
    CompareItem(guidKey, Value) {
        result := ComCall(5, this, Guid.Ptr, guidKey, PROPVARIANT.Ptr, Value, BOOL.Ptr, &pbResult := 0, "HRESULT")
        return pbResult
    }

    /**
     * Compares the attributes on this object with the attributes on another object.
     * @remarks
     * If <i>pThis</i> is the object whose <b>Compare</b> method is called, and <i>pTheirs</i> is the object passed in as the <i>pTheirs</i> parameter, the following comparisons are defined by <i>MatchType</i>.
     * 
     * <table>
     * <tr>
     * <th>Match type</th>
     * <th>Returns <b>TRUE</b> if and only if</th>
     * </tr>
     * <tr>
     * <td><b>MF_ATTRIBUTES_MATCH_OUR_ITEMS</b></td>
     * <td>For every attribute in <i>pThis</i>, an attribute with the same key and value exists in <i>pTheirs</i>.</td>
     * </tr>
     * <tr>
     * <td><b>MF_ATTRIBUTES_MATCH_THEIR_ITEMS</b></td>
     * <td>For every attribute in <i>pTheirs</i>, an attribute with the same key and value exists in <i>pThis</i>.</td>
     * </tr>
     * <tr>
     * <td><b>MF_ATTRIBUTES_MATCH_ALL_ITEMS</b></td>
     * <td>The key/value pairs are identical in both objects.</td>
     * </tr>
     * <tr>
     * <td><b>MF_ATTRIBUTES_MATCH_INTERSECTION</b></td>
     * <td>Take the intersection of the keys in <i>pThis</i> and the keys in <i>pTheirs</i>. The values associated with those keys are identical in both <i>pThis</i> and <i>pTheirs</i>.</td>
     * </tr>
     * <tr>
     * <td><b>MF_ATTRIBUTES_MATCH_SMALLER</b></td>
     * <td>Take the object with the smallest number of attributes. For every attribute in that object, an attribute with the same key and value exists in the other object.</td>
     * </tr>
     * </table>
     *  
     * 
     * The <i>pTheirs</i> and <i>pbResult</i> parameters must not be <b>NULL</b>. If either parameter is <b>NULL</b>, an access violation occurs.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFAttributes} pTheirs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the object to compare with this object.
     * @param {MF_ATTRIBUTES_MATCH_TYPE} MatchType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attributes_match_type">MF_ATTRIBUTES_MATCH_TYPE</a> enumeration, specifying the type of comparison to make.
     * @returns {BOOL} Receives a Boolean value. The value is <b>TRUE</b> if the two sets of attributes match in the way specified by the <i>MatchType</i> parameter. Otherwise, the value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-compare
     */
    Compare(pTheirs, MatchType) {
        result := ComCall(6, this, "ptr", pTheirs, MF_ATTRIBUTES_MATCH_TYPE, MatchType, BOOL.Ptr, &pbResult := 0, "HRESULT")
        return pbResult
    }

    /**
     * Retrieves a UINT32 value associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_UINT32</b>.
     * @returns {Integer} Receives a <b>UINT32</b> value. If the key is found and the data type is <b>UINT32</b>, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getuint32
     */
    GetUINT32(guidKey) {
        result := ComCall(7, this, Guid.Ptr, guidKey, "uint*", &punValue := 0, "HRESULT")
        return punValue
    }

    /**
     * Retrieves a UINT64 value associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_UINT64</b>.
     * @returns {Integer} Receives a <b>UINT64</b> value. If the key is found and the data type is <b>UINT64</b>, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getuint64
     */
    GetUINT64(guidKey) {
        result := ComCall(8, this, Guid.Ptr, guidKey, "uint*", &punValue := 0, "HRESULT")
        return punValue
    }

    /**
     * Retrieves a double value associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_DOUBLE</b>.
     * @returns {Float} Receives a <b>double</b> value. If the key is found and the data type is <b>double</b>, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getdouble
     */
    GetDouble(guidKey) {
        result := ComCall(9, this, Guid.Ptr, guidKey, "double*", &pfValue := 0, "HRESULT")
        return pfValue
    }

    /**
     * Retrieves a GUID value associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_GUID</b>.
     * @returns {Guid} Receives a GUID value. If the key is found and the data type is GUID, the method copies the value into this parameter. Otherwise, the original value of this parameter is not changed.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getguid
     */
    GetGUID(guidKey) {
        pguidValue := Guid()
        result := ComCall(10, this, Guid.Ptr, guidKey, Guid.Ptr, pguidValue, "HRESULT")
        return pguidValue
    }

    /**
     * Retrieves the length of a string value associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_STRING</b>.
     * @returns {Integer} If the key is found and the value is a string type, this parameter receives the number of characters in the string, not including the terminating <b>NULL</b> character. To get the string value, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getstring">IMFAttributes::GetString</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getstringlength
     */
    GetStringLength(guidKey) {
        result := ComCall(11, this, Guid.Ptr, guidKey, "uint*", &pcchLength := 0, "HRESULT")
        return pcchLength
    }

    /**
     * Retrieves a wide-character string associated with a key.
     * @remarks
     * You can also use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getallocatedstring">IMFAttributes::GetAllocatedString</a> method, which allocates the buffer to hold the string.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getstring
     */
    GetString(guidKey, pwszValue, cchBufSize, pcchLength) {
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, Guid.Ptr, guidKey, "ptr", pwszValue, "uint", cchBufSize, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * Gets a wide-character string associated with a key. This method allocates the memory for the string.
     * @remarks
     * To copy a string value into a caller-allocated buffer, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getstring">IMFAttributes::GetString</a> method.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  An earlier version of the documentation incorrectly stated that the <i>pcchLength</i> parameter can be <b>NULL</b>. Setting this parameter to <b>NULL</b> might succeed in some cases, but is not guaranteed. The caller must pass a non-<b>NULL</b> pointer for this parameter.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getallocatedstring
     */
    GetAllocatedString(guidKey, ppwszValue, pcchLength) {
        ppwszValueMarshal := ppwszValue is VarRef ? "ptr*" : "ptr"
        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, Guid.Ptr, guidKey, ppwszValueMarshal, ppwszValue, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * Retrieves the length of a byte array associated with a key.
     * @remarks
     * To get the byte array, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getblob">IMFAttributes::GetBlob</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_BLOB</b>.
     * @returns {Integer} If the key is found and the value is a byte array, this parameter receives the size of the array, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getblobsize
     */
    GetBlobSize(guidKey) {
        result := ComCall(14, this, Guid.Ptr, guidKey, "uint*", &pcbBlobSize := 0, "HRESULT")
        return pcbBlobSize
    }

    /**
     * Retrieves a byte array associated with a key. This method copies the array into a caller-allocated buffer.
     * @remarks
     * You can also use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getallocatedblob">IMFAttributes::GetAllocatedBlob</a> method, which allocates the buffer to hold the byte array.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_BLOB</b>.
     * @param {Integer} cbBufSize The size of the <i>pBuf</i> buffer, in bytes.
     * @param {Pointer<Integer>} pcbBlobSize Receives the size of the byte array. This parameter can be <b>NULL</b>.
     * @returns {Integer} Pointer to a buffer allocated by the caller. If the key is found and the value is a byte array, the method copies the array into this buffer. To find the required size of the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getblobsize">IMFAttributes::GetBlobSize</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getblob
     */
    GetBlob(guidKey, cbBufSize, pcbBlobSize) {
        pcbBlobSizeMarshal := pcbBlobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, Guid.Ptr, guidKey, "char*", &pBuf := 0, "uint", cbBufSize, pcbBlobSizeMarshal, pcbBlobSize, "HRESULT")
        return pBuf
    }

    /**
     * Retrieves a byte array associated with a key. This method allocates the memory for the array.
     * @remarks
     * To copy a byte array value into a caller-allocated buffer, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getblob">IMFAttributes::GetBlob</a> method.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getallocatedblob
     */
    GetAllocatedBlob(guidKey, ppBuf, pcbSize) {
        ppBufMarshal := ppBuf is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, Guid.Ptr, guidKey, ppBufMarshal, ppBuf, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface pointer associated with a key.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Guid>} guidKey GUID that identifies which value to retrieve. The attribute type must be <b>MF_ATTRIBUTE_IUNKNOWN</b>.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the interface to retrieve.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getunknown
     */
    GetUnknown(guidKey, riid) {
        result := ComCall(17, this, Guid.Ptr, guidKey, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Adds an attribute value with a specified key.
     * @remarks
     * This method checks whether the <b>PROPVARIANT</b> type is one of the attribute types defined in <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_type">MF_ATTRIBUTE_TYPE</a>, and fails if an unsupported type is used. However, this method does not check whether the <b>PROPVARIANT</b> is the correct type for the specified attribute GUID. (There is no programmatic way to associate attribute GUIDs with property types.) For a list of Media Foundation attributes and their data types, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-attributes">Media Foundation Attributes</a>.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setitem
     */
    SetItem(guidKey, Value) {
        result := ComCall(18, this, Guid.Ptr, guidKey, PROPVARIANT.Ptr, Value, "HRESULT")
        return result
    }

    /**
     * Removes a key/value pair from the object's attribute list.
     * @remarks
     * If the specified key does not exist, the method returns <b>S_OK</b>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-deleteitem
     */
    DeleteItem(guidKey) {
        result := ComCall(19, this, Guid.Ptr, guidKey, "HRESULT")
        return result
    }

    /**
     * Removes all key/value pairs from the object's attribute list.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-deleteallitems
     */
    DeleteAllItems() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * Associates a UINT32 value with a key.
     * @remarks
     * To retrieve the <b>UINT32</b> value, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getuint32">IMFAttributes::GetUINT32</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setuint32
     */
    SetUINT32(guidKey, unValue) {
        result := ComCall(21, this, Guid.Ptr, guidKey, "uint", unValue, "HRESULT")
        return result
    }

    /**
     * Associates a UINT64 value with a key.
     * @remarks
     * To retrieve the <b>UINT64</b> value, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getuint64">IMFAttributes::GetUINT64</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setuint64
     */
    SetUINT64(guidKey, unValue) {
        result := ComCall(22, this, Guid.Ptr, guidKey, "uint", unValue, "HRESULT")
        return result
    }

    /**
     * Associates a double value with a key.
     * @remarks
     * To retrieve the double value, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getdouble">IMFAttributes::GetDouble</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setdouble
     */
    SetDouble(guidKey, fValue) {
        result := ComCall(23, this, Guid.Ptr, guidKey, "double", fValue, "HRESULT")
        return result
    }

    /**
     * Associates a GUID value with a key.
     * @remarks
     * To retrieve the GUID value, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getguid">IMFAttributes::GetGUID</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setguid
     */
    SetGUID(guidKey, guidValue) {
        result := ComCall(24, this, Guid.Ptr, guidKey, Guid.Ptr, guidValue, "HRESULT")
        return result
    }

    /**
     * Associates a wide-character string with a key.
     * @remarks
     * To retrieve the string, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getstring">IMFAttributes::GetString</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getallocatedstring">IMFAttributes::GetAllocatedString</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setstring
     */
    SetString(guidKey, wszValue) {
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        result := ComCall(25, this, Guid.Ptr, guidKey, "ptr", wszValue, "HRESULT")
        return result
    }

    /**
     * Associates a byte array with a key.
     * @remarks
     * To retrieve the byte array, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getblob">IMFAttributes::GetBlob</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getallocatedblob">IMFAttributes::GetAllocatedBlob</a>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setblob
     */
    SetBlob(guidKey, pBuf, cbBufSize) {
        pBufMarshal := pBuf is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, Guid.Ptr, guidKey, pBufMarshal, pBuf, "uint", cbBufSize, "HRESULT")
        return result
    }

    /**
     * Associates an IUnknown pointer with a key.
     * @remarks
     * To retrieve the <b>IUnknown</b> pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getunknown">IMFAttributes::GetUnknown</a>.
     * 
     * It is not an error to call <b>SetUnknown</b> with <i>pUnknown</i> equal to <b>NULL</b>. However, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getunknown">GetUnknown</a> will return <b>MF_E_INVALIDTYPE</b>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setunknown
     */
    SetUnknown(guidKey, pUnknown) {
        result := ComCall(27, this, Guid.Ptr, guidKey, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * Locks the attribute store so that no other thread can access it.
     * @remarks
     * This method can cause a deadlock if a thread that calls <b>LockStore</b> waits on a thread that calls any other <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> methods on the same object.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-lockstore
     */
    LockStore() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * Unlocks the attribute store after a call to the IMFAttributes::LockStore method. While the object is unlocked, multiple threads can access the object's attributes.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-unlockstore
     */
    UnlockStore() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of attributes that are set on this object.
     * @remarks
     * To enumerate all of the attributes, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getitembyindex">IMFAttributes::GetItemByIndex</a> for each index value.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the number of attributes. This parameter must not be <b>NULL</b>. If this parameter is <b>NULL</b>, an access violation occurs.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getcount
     */
    GetCount() {
        result := ComCall(30, this, "uint*", &pcItems := 0, "HRESULT")
        return pcItems
    }

    /**
     * Retrieves an attribute at the specified index.
     * @remarks
     * To enumerate all of an object's attributes in a thread-safe way, do the following:
     * 
     * <ol>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-lockstore">IMFAttributes::LockStore</a> to prevent another thread from adding or deleting attributes.
     * 
     * </li>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getcount">IMFAttributes::GetCount</a> to find the number of attributes.
     * 
     * </li>
     * <li>
     * Call <b>GetItemByIndex</b> to get each attribute by index.
     * 
     * </li>
     * <li>
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-unlockstore">IMFAttributes::UnlockStore</a> to unlock the attribute store.
     * 
     * </li>
     * </ol>
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} unIndex Index of the attribute to retrieve. To get the number of attributes, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-getcount">IMFAttributes::GetCount</a>.
     * @param {Pointer<PROPVARIANT>} pValue Pointer to a <b>PROPVARIANT</b> that receives the value. This parameter can be <b>NULL</b>. If it is not <b>NULL</b>, the method fills the <b>PROPVARIANT</b> with a copy of the attribute value. Call <b>PropVariantClear</b> to free the memory allocated by this method.
     * @returns {Guid} Receives the GUID that identifies this attribute.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitembyindex
     */
    GetItemByIndex(unIndex, pValue) {
        pguidKey := Guid()
        result := ComCall(31, this, "uint", unIndex, Guid.Ptr, pguidKey, PROPVARIANT.Ptr, pValue, "HRESULT")
        return pguidKey
    }

    /**
     * Copies all of the attributes from this object into another attribute store.
     * @remarks
     * This method deletes all of the attributes originally stored in <i>pDest</i>.
     *       
     * 
     * <div class="alert"><b>Note</b>  <p class="note">When you call <b>CopyAllItems</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a>, which inherits this method, the sample time, duration, and flags are not copied to the destination sample. You must copy these values to the new sample manually.
     * 
     * </div>
     * <div> </div>
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFAttributes} pDest A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store that receives the copy.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-copyallitems
     */
    CopyAllItems(pDest) {
        result := ComCall(32, this, "ptr", pDest, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFAttributes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 3)
        this.vtbl.GetItemType := CallbackCreate(GetMethod(implObj, "GetItemType"), flags, 3)
        this.vtbl.CompareItem := CallbackCreate(GetMethod(implObj, "CompareItem"), flags, 4)
        this.vtbl.Compare := CallbackCreate(GetMethod(implObj, "Compare"), flags, 4)
        this.vtbl.GetUINT32 := CallbackCreate(GetMethod(implObj, "GetUINT32"), flags, 3)
        this.vtbl.GetUINT64 := CallbackCreate(GetMethod(implObj, "GetUINT64"), flags, 3)
        this.vtbl.GetDouble := CallbackCreate(GetMethod(implObj, "GetDouble"), flags, 3)
        this.vtbl.GetGUID := CallbackCreate(GetMethod(implObj, "GetGUID"), flags, 3)
        this.vtbl.GetStringLength := CallbackCreate(GetMethod(implObj, "GetStringLength"), flags, 3)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 5)
        this.vtbl.GetAllocatedString := CallbackCreate(GetMethod(implObj, "GetAllocatedString"), flags, 4)
        this.vtbl.GetBlobSize := CallbackCreate(GetMethod(implObj, "GetBlobSize"), flags, 3)
        this.vtbl.GetBlob := CallbackCreate(GetMethod(implObj, "GetBlob"), flags, 5)
        this.vtbl.GetAllocatedBlob := CallbackCreate(GetMethod(implObj, "GetAllocatedBlob"), flags, 4)
        this.vtbl.GetUnknown := CallbackCreate(GetMethod(implObj, "GetUnknown"), flags, 4)
        this.vtbl.SetItem := CallbackCreate(GetMethod(implObj, "SetItem"), flags, 3)
        this.vtbl.DeleteItem := CallbackCreate(GetMethod(implObj, "DeleteItem"), flags, 2)
        this.vtbl.DeleteAllItems := CallbackCreate(GetMethod(implObj, "DeleteAllItems"), flags, 1)
        this.vtbl.SetUINT32 := CallbackCreate(GetMethod(implObj, "SetUINT32"), flags, 3)
        this.vtbl.SetUINT64 := CallbackCreate(GetMethod(implObj, "SetUINT64"), flags, 3)
        this.vtbl.SetDouble := CallbackCreate(GetMethod(implObj, "SetDouble"), flags, 3)
        this.vtbl.SetGUID := CallbackCreate(GetMethod(implObj, "SetGUID"), flags, 3)
        this.vtbl.SetString := CallbackCreate(GetMethod(implObj, "SetString"), flags, 3)
        this.vtbl.SetBlob := CallbackCreate(GetMethod(implObj, "SetBlob"), flags, 4)
        this.vtbl.SetUnknown := CallbackCreate(GetMethod(implObj, "SetUnknown"), flags, 3)
        this.vtbl.LockStore := CallbackCreate(GetMethod(implObj, "LockStore"), flags, 1)
        this.vtbl.UnlockStore := CallbackCreate(GetMethod(implObj, "UnlockStore"), flags, 1)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetItemByIndex := CallbackCreate(GetMethod(implObj, "GetItemByIndex"), flags, 4)
        this.vtbl.CopyAllItems := CallbackCreate(GetMethod(implObj, "CopyAllItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.GetItemType)
        CallbackFree(this.vtbl.CompareItem)
        CallbackFree(this.vtbl.Compare)
        CallbackFree(this.vtbl.GetUINT32)
        CallbackFree(this.vtbl.GetUINT64)
        CallbackFree(this.vtbl.GetDouble)
        CallbackFree(this.vtbl.GetGUID)
        CallbackFree(this.vtbl.GetStringLength)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetAllocatedString)
        CallbackFree(this.vtbl.GetBlobSize)
        CallbackFree(this.vtbl.GetBlob)
        CallbackFree(this.vtbl.GetAllocatedBlob)
        CallbackFree(this.vtbl.GetUnknown)
        CallbackFree(this.vtbl.SetItem)
        CallbackFree(this.vtbl.DeleteItem)
        CallbackFree(this.vtbl.DeleteAllItems)
        CallbackFree(this.vtbl.SetUINT32)
        CallbackFree(this.vtbl.SetUINT64)
        CallbackFree(this.vtbl.SetDouble)
        CallbackFree(this.vtbl.SetGUID)
        CallbackFree(this.vtbl.SetString)
        CallbackFree(this.vtbl.SetBlob)
        CallbackFree(this.vtbl.SetUnknown)
        CallbackFree(this.vtbl.LockStore)
        CallbackFree(this.vtbl.UnlockStore)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetItemByIndex)
        CallbackFree(this.vtbl.CopyAllItems)
    }
}

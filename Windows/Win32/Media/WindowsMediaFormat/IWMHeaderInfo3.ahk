#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMHeaderInfo2.ahk

/**
 * The IWMHeaderInfo3 interface supports the following new metadata features:Attribute data in excess of 64 kilobytes.Multiple attributes with the same name.Attributes in multiple languages.Because the attributes created using this interface can have duplicate names, the methods of this interface use index values to identify attributes.The IWMHeaderInfo3 interface is implemented by the metadata editor object, the writer object, the reader object, and the synchronous reader object. To obtain a pointer to an instance, call the QueryInterface method of any other interface in the desired object.
 * @remarks
 * 
 * For information about using the writer for metadata editing, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/to-edit-metadata-with-the-writer">To Edit Metadata with the Writer</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmheaderinfo3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMHeaderInfo3 extends IWMHeaderInfo2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMHeaderInfo3
     * @type {Guid}
     */
    static IID => Guid("{15cc68e3-27cc-4ecd-b222-3f5d02d80bd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributeCountEx", "GetAttributeIndices", "GetAttributeByIndexEx", "ModifyAttribute", "AddAttribute", "DeleteAttribute", "AddCodecInfo"]

    /**
     * The GetAttributeCountEx method retrieves the total number of attributes associated with a specified stream number.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which to retrieve the attribute count. Pass zero to retrieve the count of attributes that apply to the file rather than a specific stream. Pass 0xFFFF to retrieve the total count of all attributes in the file, both stream-specific and file-level.
     * @returns {Integer} Pointer to a <b>WORD</b> containing the number of attributes that exist for the specified stream.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributecountex
     */
    GetAttributeCountEx(wStreamNum) {
        result := ComCall(17, this, "ushort", wStreamNum, "ushort*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * The GetAttributeIndices method retrieves a list of valid attribute indices within specified parameters.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which to retrieve attribute indices. Passing zero retrieves indices for file-level attributes. Passing 0xFFFF retrieves indices for all appropriate attributes, regardless of their association to streams.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string containing the attribute name for which you want to retrieve indices. Pass NULL to retrieve indices for attributes based on language. Attribute names are limited to 1024 wide characters.
     * @param {Pointer<Integer>} pwLangIndex Pointer to a <b>WORD</b> containing the language index of the language for which to retrieve attribute indices. Pass NULL to retrieve indices for attributes by name.
     * @param {Pointer<Integer>} pwCount On output, pointer to a <b>WORD</b> containing the number of elements in the <i>pwIndices</i> array.
     * @returns {Integer} Pointer to a <b>WORD</b> array containing the indices that meet the criteria described by the input parameters. Pass NULL to retrieve the size of the array, which will be returned in <i>pwCount</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributeindices
     */
    GetAttributeIndices(wStreamNum, pwszName, pwLangIndex, pwCount) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pwLangIndexMarshal := pwLangIndex is VarRef ? "ushort*" : "ptr"
        pwCountMarshal := pwCount is VarRef ? "ushort*" : "ptr"

        result := ComCall(18, this, "ushort", wStreamNum, "ptr", pwszName, pwLangIndexMarshal, pwLangIndex, "ushort*", &pwIndices := 0, pwCountMarshal, pwCount, "HRESULT")
        return pwIndices
    }

    /**
     * The GetAttributeByIndexEx method retrieves the value of an attribute specified by the attribute index.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number to which the attribute applies. Set to zero to retrieve a file-level attribute.
     * @param {Integer} wIndex <b>WORD</b> containing the index of the attribute to be retrieved.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the attribute name. Pass <b>NULL</b> to retrieve the size of the string, which will be returned in <i>pwNameLen</i>.
     * @param {Pointer<Integer>} pwNameLen Pointer to a <b>WORD</b> containing the size of <i>pwszName</i>, in wide characters. This size includes the terminating <b>null</b> character. Attribute names are limited to 1024 wide characters.
     * @param {Pointer<Integer>} pType Type of data used for the attribute. For more information about the types of data supported, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a>.
     * @param {Pointer<Integer>} pwLangIndex Pointer to a <b>WORD</b> containing the language index of the language associated with the attribute. This is the index of the language in the language list for the file.
     * @param {Pointer<Integer>} pValue Pointer to an array of bytes containing the attribute value. Pass <b>NULL</b> to retrieve the size of the attribute value, which will be returned in <i>pdwDataLength</i>.
     * @param {Pointer<Integer>} pdwDataLength Pointer to a <b>DWORD</b> containing the length, in bytes, of the attribute value pointed to by <i>pValue</i>.
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
     * <dt><b>NS_E_SDK_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified for the name or value is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>wStreamNum</i> is not a valid stream number, or there is no attribute at <i>wIndex</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-getattributebyindexex
     */
    GetAttributeByIndexEx(wStreamNum, wIndex, pwszName, pwNameLen, pType, pwLangIndex, pValue, pdwDataLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pwNameLenMarshal := pwNameLen is VarRef ? "ushort*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pwLangIndexMarshal := pwLangIndex is VarRef ? "ushort*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwDataLengthMarshal := pdwDataLength is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ushort", wStreamNum, "ushort", wIndex, "ptr", pwszName, pwNameLenMarshal, pwNameLen, pTypeMarshal, pType, pwLangIndexMarshal, pwLangIndex, pValueMarshal, pValue, pdwDataLengthMarshal, pdwDataLength, "HRESULT")
        return result
    }

    /**
     * The ModifyAttribute method modifies the settings of an existing attribute.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number to which the attribute applies. Pass zero for file-level attributes.
     * @param {Integer} wIndex <b>WORD</b> containing the index of the attribute to change.
     * @param {Integer} Type Type of data used for the new attribute value. For more information about the types of data supported, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a>.
     * @param {Integer} wLangIndex <b>WORD</b> containing the language index of the language to be associated with the new attribute. This is the index of the language in the language list for the file.
     * @param {Pointer<Integer>} pValue Pointer to an array of bytes containing the attribute value.
     * @param {Integer} dwLength <b>DWORD</b> containing the length of the attribute value, in bytes.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An illegal parameter combination, data type, or attribute name was used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented on a reader object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_ATTRIBUTE_READ_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute cannot be changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>wStreamNum</i> is not a valid stream number, or there is no attribute at <i>wIndex</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-modifyattribute
     */
    ModifyAttribute(wStreamNum, wIndex, Type, wLangIndex, pValue, dwLength) {
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "ushort", wStreamNum, "ushort", wIndex, "int", Type, "ushort", wLangIndex, pValueMarshal, pValue, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * The AddAttribute method adds a metadata attribute. To change the value of an existing attribute, use the IWMHeaderInfo3::ModifyAttribute method.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number of the stream to which the attribute applies. Setting this value to zero indicates an attribute that applies to the entire file.
     * @param {PWSTR} pszName Pointer to a wide-character null-terminated string containing the name of the attribute. Attribute names are limited to 1024 wide characters.
     * @param {Integer} Type Type of data used for the new attribute. For more information about the types of data supported, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a>.
     * @param {Integer} wLangIndex <b>WORD</b> containing the language index of the language to be associated with the new attribute. This is the index of the language in the language list for the file. Setting this value to zero indicates that the default language will be used. A default language is created and set according to the regional settings on the computer running your application.
     * @param {Pointer<Integer>} pValue Pointer to an array of bytes containing the attribute value.
     * @param {Integer} dwLength <b>DWORD</b> containing the length of the attribute value, in bytes.
     * @returns {Integer} Pointer to a <b>WORD</b>. On successful completion of the method, this value is set to the index assigned to the new attribute.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-addattribute
     */
    AddAttribute(wStreamNum, pszName, Type, wLangIndex, pValue, dwLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(21, this, "ushort", wStreamNum, "ptr", pszName, "ushort*", &pwIndex := 0, "int", Type, "ushort", wLangIndex, pValueMarshal, pValue, "uint", dwLength, "HRESULT")
        return pwIndex
    }

    /**
     * The DeleteAttribute method removes an attribute from the file header.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which the attribute applies. Setting this value to zero indicates a file-level attribute.
     * @param {Integer} wIndex <b>WORD</b> containing the index of the attribute to be deleted.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented on a reader object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>wStreamNum</i> is not a valid stream number, or there is not an attribute at <i>wIndex</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-deleteattribute
     */
    DeleteAttribute(wStreamNum, wIndex) {
        result := ComCall(22, this, "ushort", wStreamNum, "ushort", wIndex, "HRESULT")
        return result
    }

    /**
     * The AddCodecInfo method adds codec information to a file. When you copy a compressed stream from one file to another, use this method to include the information about the encoding codec in the file header.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string containing the name.
     * @param {PWSTR} pwszDescription Pointer to a wide-character null-terminated string containing the description.
     * @param {Integer} codecType A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_codec_info_type">WMT_CODEC_INFO_TYPE</a> enumeration specifying the codec type.
     * @param {Integer} cbCodecInfo The size of the codec information, in bytes.
     * @param {Pointer<Integer>} pbCodecInfo Pointer to an array of bytes that contains the codec information.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo3-addcodecinfo
     */
    AddCodecInfo(pwszName, pwszDescription, codecType, cbCodecInfo, pbCodecInfo) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        pbCodecInfoMarshal := pbCodecInfo is VarRef ? "char*" : "ptr"

        result := ComCall(23, this, "ptr", pwszName, "ptr", pwszDescription, "int", codecType, "ushort", cbCodecInfo, pbCodecInfoMarshal, pbCodecInfo, "HRESULT")
        return result
    }
}

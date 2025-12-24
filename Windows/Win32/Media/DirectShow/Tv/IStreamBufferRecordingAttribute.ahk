#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumStreamBufferRecordingAttrib.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferRecordingAttribute interface sets and retrieves attributes on a stream buffer recording.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferRecordingAttribute)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferrecordingattribute
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferRecordingAttribute extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferRecordingAttribute
     * @type {Guid}
     */
    static IID => Guid("{16ca4e03-fe69-4705-bd41-5b7dfc0c95f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttribute", "GetAttributeCount", "GetAttributeByName", "GetAttributeByIndex", "EnumAttributes"]

    /**
     * The SetAttribute method sets an attribute on the stream buffer file.
     * @param {Integer} ulReserved Reserved. Set this parameter to zero.
     * @param {PWSTR} pszAttributeName Wide-character string that contains the name of the attribute.
     * @param {Integer} StreamBufferAttributeType Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration that defines the data type of the attribute data.
     * @param {Pointer<Integer>} pbAttribute Pointer to a buffer that contains the attribute data.
     * @param {Integer} cbAttributeLength The size of the buffer specified in <i>pbAttribute</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferrecordingattribute-setattribute
     */
    SetAttribute(ulReserved, pszAttributeName, StreamBufferAttributeType, pbAttribute, cbAttributeLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulReserved, "ptr", pszAttributeName, "int", StreamBufferAttributeType, pbAttributeMarshal, pbAttribute, "ushort", cbAttributeLength, "HRESULT")
        return result
    }

    /**
     * The GetAttributeCount method returns the number of attributes that are currently defined for this stream buffer file.
     * @param {Integer} ulReserved Reserved. Set this parameter to zero.
     * @returns {Integer} Pointer to a variable that receives the number of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferrecordingattribute-getattributecount
     */
    GetAttributeCount(ulReserved) {
        result := ComCall(4, this, "uint", ulReserved, "ushort*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * The GetAttributeByName method retrieves an attribute, specified by name.
     * @param {PWSTR} pszAttributeName Wide-character string that contains the name of the attribute.
     * @param {Pointer<Integer>} pulReserved Reserved. Set this parameter to zero.
     * @param {Pointer<Integer>} pStreamBufferAttributeType Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration. This value indicates the data type that you should use to interpret the attribute, which is returned in the <i>pbAttribute</i> parameter.
     * @param {Pointer<Integer>} pbAttribute Pointer to a buffer that receives the attribute, as an array of bytes. Specify the size of the buffer in the <i>pcbLength</i> parameter. To find out the required size for the array, set <i>pbAttribute</i> to <b>NULL</b> and check the value that is returned in <i>pcbLength</i>.
     * @param {Pointer<Integer>} pcbLength On input, specifies the size of the buffer given in <i>pbAttribute</i>, in bytes. On output, contains the number of bytes that were copied to the buffer.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer given in <i>pbAttribute</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferrecordingattribute-getattributebyname
     */
    GetAttributeByName(pszAttributeName, pulReserved, pStreamBufferAttributeType, pbAttribute, pcbLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        pulReservedMarshal := pulReserved is VarRef ? "uint*" : "ptr"
        pStreamBufferAttributeTypeMarshal := pStreamBufferAttributeType is VarRef ? "int*" : "ptr"
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, "ptr", pszAttributeName, pulReservedMarshal, pulReserved, pStreamBufferAttributeTypeMarshal, pStreamBufferAttributeType, pbAttributeMarshal, pbAttribute, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The GetAttributeByIndex method retrieves an attribute, specified by index number.
     * @param {Integer} wIndex Zero-based index of the attribute to retrieve.
     * @param {Pointer<Integer>} pulReserved Reserved. Set this parameter to zero.
     * @param {PWSTR} pszAttributeName Pointer to a buffer that receives the name of the attribute, as a null-terminated wide-character string. Specify the size of the buffer in the <i>pcchNameLength</i> parameter. To find out the required size for the array, set <i>pszAttributeName</i> to <b>NULL</b> and check the value that is returned in <i>pcchNameLength</i>.
     * @param {Pointer<Integer>} pcchNameLength On input, specifies the size of the buffer given in <i>pszAttributeName</i>, in wide characters. On output, contains the number of characters that were copied to the buffer, including the null terminator. Remember that wide characters are two bytes each.
     * @param {Pointer<Integer>} pStreamBufferAttributeType Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration. This value indicates the data type that you should use to interpret the attribute, which is returned in the <i>pbAttribute</i> parameter.
     * @param {Pointer<Integer>} pbAttribute Pointer to a buffer that receives the attribute, as an array of bytes. Specify the size of the buffer in the <i>pcbLength</i> parameter. To find out the required size for the array, set <i>pbAttribute</i> to <b>NULL</b> and check the value that is returned in <i>pcbLength</i>.
     * @param {Pointer<Integer>} pcbLength On input, specifies the size of the buffer given in <i>pbAttribute</i>, in bytes. On output, contains the number of bytes that were copied to the buffer.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the buffers is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferrecordingattribute-getattributebyindex
     */
    GetAttributeByIndex(wIndex, pulReserved, pszAttributeName, pcchNameLength, pStreamBufferAttributeType, pbAttribute, pcbLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        pulReservedMarshal := pulReserved is VarRef ? "uint*" : "ptr"
        pcchNameLengthMarshal := pcchNameLength is VarRef ? "ushort*" : "ptr"
        pStreamBufferAttributeTypeMarshal := pStreamBufferAttributeType is VarRef ? "int*" : "ptr"
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ushort", wIndex, pulReservedMarshal, pulReserved, "ptr", pszAttributeName, pcchNameLengthMarshal, pcchNameLength, pStreamBufferAttributeTypeMarshal, pStreamBufferAttributeType, pbAttributeMarshal, pbAttribute, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The EnumAttributes method enumerates the existing attributes of the stream buffer file. This method returns an enumerator object, which the caller can then use to enumerate the attributes.
     * @returns {IEnumStreamBufferRecordingAttrib} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-ienumstreambufferrecordingattrib">IEnumStreamBufferRecordingAttrib</a> interface pointer.
     *           The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferrecordingattribute-enumattributes
     */
    EnumAttributes() {
        result := ComCall(7, this, "ptr*", &ppIEnumStreamBufferAttrib := 0, "HRESULT")
        return IEnumStreamBufferRecordingAttrib(ppIEnumStreamBufferAttrib)
    }
}

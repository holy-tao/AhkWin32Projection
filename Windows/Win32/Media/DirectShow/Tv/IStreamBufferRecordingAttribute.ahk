#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumStreamBufferRecordingAttrib.ahk" { IEnumStreamBufferRecordingAttrib }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\STREAMBUFFER_ATTR_DATATYPE.ahk" { STREAMBUFFER_ATTR_DATATYPE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IStreamBufferRecordingAttribute interface sets and retrieves attributes on a stream buffer recording.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferRecordingAttribute)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambufferrecordingattribute
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferRecordingAttribute extends IUnknown {
    /**
     * The interface identifier for IStreamBufferRecordingAttribute
     * @type {Guid}
     */
    static IID := Guid("{16ca4e03-fe69-4705-bd41-5b7dfc0c95f3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferRecordingAttribute interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAttribute        : IntPtr
        GetAttributeCount   : IntPtr
        GetAttributeByName  : IntPtr
        GetAttributeByIndex : IntPtr
        EnumAttributes      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferRecordingAttribute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetAttribute method sets an attribute on the stream buffer file.
     * @remarks
     * If an attribute with that name already exists, the method overwrites it with the new value.
     * 
     * The method fails if the recorder object is already recording.
     * @param {Integer} ulReserved Reserved. Set this parameter to zero.
     * @param {PWSTR} pszAttributeName Wide-character string that contains the name of the attribute.
     * @param {STREAMBUFFER_ATTR_DATATYPE} StreamBufferAttributeType Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration that defines the data type of the attribute data.
     * @param {Pointer<Integer>} pbAttribute Pointer to a buffer that contains the attribute data.
     * @param {Integer} cbAttributeLength The size of the buffer specified in <i>pbAttribute</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-setattribute
     */
    SetAttribute(ulReserved, pszAttributeName, StreamBufferAttributeType, pbAttribute, cbAttributeLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulReserved, "ptr", pszAttributeName, STREAMBUFFER_ATTR_DATATYPE, StreamBufferAttributeType, pbAttributeMarshal, pbAttribute, "ushort", cbAttributeLength, "HRESULT")
        return result
    }

    /**
     * The GetAttributeCount method returns the number of attributes that are currently defined for this stream buffer file.
     * @param {Integer} ulReserved Reserved. Set this parameter to zero.
     * @returns {Integer} Pointer to a variable that receives the number of attributes.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-getattributecount
     */
    GetAttributeCount(ulReserved) {
        result := ComCall(4, this, "uint", ulReserved, "ushort*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * The GetAttributeByName method retrieves an attribute, specified by name.
     * @param {PWSTR} pszAttributeName Wide-character string that contains the name of the attribute.
     * @param {Pointer<Integer>} pulReserved Reserved. Set this parameter to zero.
     * @param {Pointer<STREAMBUFFER_ATTR_DATATYPE>} pStreamBufferAttributeType Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration. This value indicates the data type that you should use to interpret the attribute, which is returned in the <i>pbAttribute</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-getattributebyname
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
     * @param {Pointer<STREAMBUFFER_ATTR_DATATYPE>} pStreamBufferAttributeType Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ne-sbe-streambuffer_attr_datatype">STREAMBUFFER_ATTR_DATATYPE</a> enumeration. This value indicates the data type that you should use to interpret the attribute, which is returned in the <i>pbAttribute</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-getattributebyindex
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-enumattributes
     */
    EnumAttributes() {
        result := ComCall(7, this, "ptr*", &ppIEnumStreamBufferAttrib := 0, "HRESULT")
        return IEnumStreamBufferRecordingAttrib(ppIEnumStreamBufferAttrib)
    }

    Query(iid) {
        if (IStreamBufferRecordingAttribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAttribute := CallbackCreate(GetMethod(implObj, "SetAttribute"), flags, 6)
        this.vtbl.GetAttributeCount := CallbackCreate(GetMethod(implObj, "GetAttributeCount"), flags, 3)
        this.vtbl.GetAttributeByName := CallbackCreate(GetMethod(implObj, "GetAttributeByName"), flags, 6)
        this.vtbl.GetAttributeByIndex := CallbackCreate(GetMethod(implObj, "GetAttributeByIndex"), flags, 8)
        this.vtbl.EnumAttributes := CallbackCreate(GetMethod(implObj, "EnumAttributes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAttribute)
        CallbackFree(this.vtbl.GetAttributeCount)
        CallbackFree(this.vtbl.GetAttributeByName)
        CallbackFree(this.vtbl.GetAttributeByIndex)
        CallbackFree(this.vtbl.EnumAttributes)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMT_ATTR_DATATYPE.ahk" { WMT_ATTR_DATATYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMIStreamProps interface provides access to the properties of an IStream object.To obtain a pointer to an IWMIStreamProps interface, call IStream::QueryInterface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmistreamprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMIStreamProps extends IUnknown {
    /**
     * The interface identifier for IWMIStreamProps
     * @type {Guid}
     */
    static IID := Guid("{6816dad3-2b4b-4c8e-8149-874c3483a753}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMIStreamProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMIStreamProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetProperty method retrieves a named property from the IStream.
     * @remarks
     * You should make two calls to <b>GetProperty</b> for each property you want to retrieve. On the first call, pass <b>NULL</b> as <i>pValue</i>. On return, the value pointed to by <i>pdwSize</i> will be set to the buffer size required to hold the property value. Then you can allocate the required amount of memory for the buffer and pass a pointer to it as <i>pValue</i> on the second call.
     * @param {PWSTR} pszName Pointer to a <b>null</b>-terminated string containing the name of the property to retrieve. You should use the global identifier to refer to properties so that any error will appear at compile time. The following table lists the available <b>IStream</b> properties.
     * 
     * <table>
     * <tr>
     * <th>Property name
     *                 </th>
     * <th>Global identifier
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>ReloadIndexOnSeek</b></td>
     * <td>g_wszReloadIndexOnSeek</td>
     * </tr>
     * <tr>
     * <td><b>StreamNumIndexObjects</b></td>
     * <td>g_wszStreamNumIndexObjects</td>
     * </tr>
     * <tr>
     * <td><b>FailSeekOnError</b></td>
     * <td>g_wszFailSeekOnError</td>
     * </tr>
     * <tr>
     * <td><b>PermitSeeksBeyondEndOfStream</b></td>
     * <td>g_wszPermitSeeksBeyondEndOfStream</td>
     * </tr>
     * <tr>
     * <td><b>UsePacketAtSeekPoint</b></td>
     * <td>g_wszUsePacketAtSeekPoint</td>
     * </tr>
     * <tr>
     * <td><b>SourceBufferTime</b></td>
     * <td>g_wszSourceBufferTime</td>
     * </tr>
     * <tr>
     * <td><b>SourceMaxBytesAtOnce</b></td>
     * <td>g_wszSourceMaxBytesAtOnce</td>
     * </tr>
     * </table>
     * @param {Pointer<WMT_ATTR_DATATYPE>} pType Pointer to a variable that will receive one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. This value indicates the type of data in the buffer at <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a byte buffer that will receive the property value. The type of data returned to the buffer is indicated by the value pointed to by <i>pType</i>.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> containing the size of the buffer at <i>pValue</i>. On return, this value will be set to the correct size of the property value.
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
     * <i>pType</i>, <i>pValue</i>, or <i>pdwSize</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * The buffer is not big enough to hold the requested value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszName</i> specifies an invalid property name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmistreamprops-getproperty
     */
    GetProperty(pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMIStreamProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperty)
    }
}

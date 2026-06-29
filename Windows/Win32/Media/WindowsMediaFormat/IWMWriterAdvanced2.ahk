#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWMWriterAdvanced.ahk" { IWMWriterAdvanced }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMT_ATTR_DATATYPE.ahk" { WMT_ATTR_DATATYPE }

/**
 * The IWMWriterAdvanced2 interface provides the ability to set and retrieve named settings for an input.IWMWriterAdvanced2 exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwriteradvanced2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterAdvanced2 extends IWMWriterAdvanced {
    /**
     * The interface identifier for IWMWriterAdvanced2
     * @type {Guid}
     */
    static IID := Guid("{962dc1ec-c046-4db8-9cc7-26ceae500817}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterAdvanced2 interfaces
    */
    struct Vtbl extends IWMWriterAdvanced.Vtbl {
        GetInputSetting : IntPtr
        SetInputSetting : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterAdvanced2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetInputSetting method retrieves a setting for a particular input by name.
     * @remarks
     * You should make two calls to <b>GetInputSetting</b> for each setting you want to retrieve. On the first call, pass <b>NULL</b> as <i>pValue</i>. On return, the value pointed to by <i>pcbLength</i> is set to the buffer size required to hold the setting value. Then you can allocate the required amount of memory for the buffer and pass a pointer to it as <i>pValue</i> on the second call.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the setting name. For a list of valid settings, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/input-settings">Input Settings</a>.
     * @param {Pointer<WMT_ATTR_DATATYPE>} pType Pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the setting. The type of date is determined by <i>pType</i>. Pass <b>NULL</b> to retrieve the size of array required.
     * @param {Pointer<Integer>} pcbLength On input, pointer to the length of <i>pValue</i>. On output, pointer to a count of the bytes in <i>pValue</i> filled in by this method.
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
     * <dt><b>NS_E_NOT_CONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input profile has not yet been set.
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
     * <i>dwInputNum</i> is larger than the number of existing inputs
     * 
     * OR
     * 
     * <i>pType</i>, <i>pcbLength</i>, or <i>pszName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-getinputsetting
     */
    GetInputSetting(dwInputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(14, this, "uint", dwInputNum, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The SetInputSetting method specifies a named setting for a particular input.
     * @remarks
     * The encoding settings set with this method are not persisted in the output file. If you want your custom player to have access to this information, you must save the values as custom metadata attributes in the file header.
     * 
     * Only g_wszDeinterlaceMode, g_wszInitialPatternForInverseTelecine, g_wszInterlacedCoding, and g_wszJPEGCompressionQuality can be set after <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a> has been called.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the setting name. For a list of valid settings, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/input-settings">Input Settings</a>.
     * @param {WMT_ATTR_DATATYPE} Type Pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the setting.
     * @param {Integer} cbLength Size of <i>pValue</i>, in bytes.
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
     * <dt><b>NS_E_NOT_CONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input profile has not yet been set.
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
     * <i>dwInputNum</i> is larger than the number of existing inputs
     * 
     * OR
     * 
     * <i>pValue</i> or <i>pszName</i> is <b>NULL</b>.
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
     * This setting cannot be changed while the writer is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-setinputsetting
     */
    SetInputSetting(dwInputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "uint", dwInputNum, "ptr", pszName, WMT_ATTR_DATATYPE, Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMWriterAdvanced2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputSetting := CallbackCreate(GetMethod(implObj, "GetInputSetting"), flags, 6)
        this.vtbl.SetInputSetting := CallbackCreate(GetMethod(implObj, "SetInputSetting"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputSetting)
        CallbackFree(this.vtbl.SetInputSetting)
    }
}

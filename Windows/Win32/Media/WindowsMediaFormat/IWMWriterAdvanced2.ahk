#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterAdvanced.ahk

/**
 * The IWMWriterAdvanced2 interface provides the ability to set and retrieve named settings for an input.IWMWriterAdvanced2 exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriteradvanced2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterAdvanced2 extends IWMWriterAdvanced{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterAdvanced2
     * @type {Guid}
     */
    static IID => Guid("{962dc1ec-c046-4db8-9cc7-26ceae500817}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputSetting", "SetInputSetting"]

    /**
     * The GetInputSetting method retrieves a setting for a particular input by name.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the setting name. For a list of valid settings, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/input-settings">Input Settings</a>.
     * @param {Pointer<Integer>} pType Pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-getinputsetting
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
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the setting name. For a list of valid settings, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/input-settings">Input Settings</a>.
     * @param {Integer} Type Pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-setinputsetting
     */
    SetInputSetting(dwInputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "uint", dwInputNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk

/**
 * The IWMOutputMediaProps interface is used to retrieve the properties of an output stream.An IWMOutputMediaProps object is created by a call to IWMReader::GetOutputFormat or IWMReader::GetOutputProps.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMOutputMediaProps extends IWMMediaProps{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMOutputMediaProps
     * @type {Guid}
     */
    static IID => Guid("{96406bd7-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamGroupName", "GetConnectionName"]

    /**
     * The GetStreamGroupName method is not implemented in this release, and returns the empty string.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchName On input, a pointer to a variable containing the length of the <i>pwszName</i> array in wide characters (2 bytes). On output, and if the method succeeds, the variable contains the length of the name, including the terminating <b>null</b> character.
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
     * The <i>pcchName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pwszName</i> parameter is not large enough.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmoutputmediaprops-getstreamgroupname
     */
    GetStreamGroupName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * The GetConnectionName method retrieves the name of the connection to be used for output.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchName On input, a pointer to a variable containing the length of the <i>pwszName</i> array in wide characters. On output, if the method succeeds, it specifies a pointer to the length of the connection name, including the terminating <b>null</b> character.
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
     * The <i>pwszName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pcchName</i> is not large enough for the requested name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmoutputmediaprops-getconnectionname
     */
    GetConnectionName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }
}

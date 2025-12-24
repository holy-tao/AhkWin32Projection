#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk

/**
 * The IWMInputMediaProps interface is used to retrieve the properties of digital media that will be passed to the writer.An input media properties object is created by a call to either the IWMWriter::GetInputProps or IWMWriter::GetInputFormat method.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwminputmediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMInputMediaProps extends IWMMediaProps{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMInputMediaProps
     * @type {Guid}
     */
    static IID => Guid("{96406bd5-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectionName", "GetGroupName"]

    /**
     * The GetConnectionName method retrieves the connection name specified in the profile.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the connection name. Pass <b>NULL</b> to retrieve the length required for the name.
     * @param {Pointer<Integer>} pcchName On input, a pointer to a variable containing the length of the <i>pwszName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the length of the name, including the terminating <b>null</b> character.
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
     * The <i>pwszName</i> parameter is not large enough.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwminputmediaprops-getconnectionname
     */
    GetConnectionName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * The GetGroupName method is not implemented, and returns an empty string.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name. Pass <b>NULL</b> to retrieve the length required for the name.
     * @param {Pointer<Integer>} pcchName On input, a pointer to a variable containing the length of the <i>pwszName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the length of the name, including the terminating <b>null</b> character.
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
     * The <i>pwszName</i> parameter is not large enough.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwminputmediaprops-getgroupname
     */
    GetGroupName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }
}

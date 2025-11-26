#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStreamConfig interface is the primary interface of a stream configuration object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamconfig
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMStreamConfig
     * @type {Guid}
     */
    static IID => Guid("{96406bdc-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamType", "GetStreamNumber", "SetStreamNumber", "GetStreamName", "SetStreamName", "GetConnectionName", "SetConnectionName", "GetBitrate", "SetBitrate", "GetBufferWindow", "SetBufferWindow"]

    /**
     * The GetStreamType method retrieves the major type of the stream (audio, video, or script).
     * @returns {Guid} Pointer to a GUID object specifying the major type of the stream.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getstreamtype
     */
    GetStreamType() {
        pguidStreamType := Guid()
        result := ComCall(3, this, "ptr", pguidStreamType, "HRESULT")
        return pguidStreamType
    }

    /**
     * The GetStreamNumber method retrieves the stream number.
     * @returns {Integer} Pointer to a <b>WORD</b> containing the stream number. Stream numbers must be in the range of 1 through 63.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getstreamnumber
     */
    GetStreamNumber() {
        result := ComCall(4, this, "ushort*", &pwStreamNum := 0, "HRESULT")
        return pwStreamNum
    }

    /**
     * The SetStreamNumber method specifies the stream number.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers must be in the range of 1 through 63.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setstreamnumber
     */
    SetStreamNumber(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * The GetStreamName method retrieves the stream name.
     * @param {PWSTR} pwszStreamName Pointer to a wide-character <b>null</b>-terminated string containing the stream name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchStreamName On input, a pointer to a variable containing the length of the <i>pwszStreamName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the actual length of the name, including the terminating <b>null</b> character.
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
     * The <i>pcchStreamName</i> parameter is <b>NULL</b>.
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
     * The name value contained in the <i>pcchStreamName</i> parameter is too large for the <i>pwszStreamName</i> array.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getstreamname
     */
    GetStreamName(pwszStreamName, pcchStreamName) {
        pwszStreamName := pwszStreamName is String ? StrPtr(pwszStreamName) : pwszStreamName

        pcchStreamNameMarshal := pcchStreamName is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ptr", pwszStreamName, pcchStreamNameMarshal, pcchStreamName, "HRESULT")
        return result
    }

    /**
     * The SetStreamName method assigns a name to the stream represented by the stream configuration object.
     * @param {PWSTR} pwszStreamName Pointer to a wide-character <b>null</b>-terminated string containing the stream name. Stream names are limited to 256 wide characters.
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
     * The <i>pwszStreamName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setstreamname
     */
    SetStreamName(pwszStreamName) {
        pwszStreamName := pwszStreamName is String ? StrPtr(pwszStreamName) : pwszStreamName

        result := ComCall(7, this, "ptr", pwszStreamName, "HRESULT")
        return result
    }

    /**
     * The GetConnectionName method retrieves the input name given to the stream.
     * @param {PWSTR} pwszInputName Pointer to a wide-character <b>null</b>-terminated string containing the input name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchInputName On input, a pointer to a variable containing the length of the <i>pwszInputName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the length of the name, including the terminating <b>null</b> character.
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
     * The <i>pcchInputName</i> parameter is <b>NULL</b>.
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
     * The name value contained in the <i>pcchInputName</i> parameter is too large for the <i>pwszInputName</i> array.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getconnectionname
     */
    GetConnectionName(pwszInputName, pcchInputName) {
        pwszInputName := pwszInputName is String ? StrPtr(pwszInputName) : pwszInputName

        pcchInputNameMarshal := pcchInputName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", pwszInputName, pcchInputNameMarshal, pcchInputName, "HRESULT")
        return result
    }

    /**
     * The SetConnectionName method specifies a name for an input. If the profile you are creating contains multiple bit rate mutual exclusion, each of the mutually exclusive streams must have the same connection name.
     * @param {PWSTR} pwszInputName Pointer to a wide-character <b>null</b>-terminated string containing the input name. Connection names are limited to 256 wide characters.
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
     * The <i>pwszInputName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setconnectionname
     */
    SetConnectionName(pwszInputName) {
        pwszInputName := pwszInputName is String ? StrPtr(pwszInputName) : pwszInputName

        result := ComCall(9, this, "ptr", pwszInputName, "HRESULT")
        return result
    }

    /**
     * The GetBitrate method retrieves the bit rate for the stream.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the bit rate, in bits per second.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getbitrate
     */
    GetBitrate() {
        result := ComCall(10, this, "uint*", &pdwBitrate := 0, "HRESULT")
        return pdwBitrate
    }

    /**
     * The SetBitrate method specifies the bit rate for the stream.
     * @param {Integer} pdwBitrate <b>DWORD</b> containing the bit rate, in bits per second.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setbitrate
     */
    SetBitrate(pdwBitrate) {
        result := ComCall(11, this, "uint", pdwBitrate, "HRESULT")
        return result
    }

    /**
     * The GetBufferWindow method retrieves the maximum latency between when a stream is received and when it begins to be displayed.
     * @returns {Integer} Pointer to a variable specifying the buffer window, in milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getbufferwindow
     */
    GetBufferWindow() {
        result := ComCall(12, this, "uint*", &pmsBufferWindow := 0, "HRESULT")
        return pmsBufferWindow
    }

    /**
     * The SetBufferWindow method specifies the maximum latency between when a stream is received and when it begins to be displayed.
     * @param {Integer} msBufferWindow Buffer window, in milliseconds.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setbufferwindow
     */
    SetBufferWindow(msBufferWindow) {
        result := ComCall(13, this, "uint", msBufferWindow, "HRESULT")
        return result
    }
}

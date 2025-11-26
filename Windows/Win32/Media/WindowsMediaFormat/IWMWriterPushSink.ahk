#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterSink.ahk

/**
 * The IWMWriterPushSink interface enables the application to send ASF files to a publishing point on a Windows Media server.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterpushsink
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterPushSink extends IWMWriterSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterPushSink
     * @type {Guid}
     */
    static IID => Guid("{dc10e6a5-072c-467d-bf57-6330a9dde12a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "EndSession"]

    /**
     * The Connect method connects to a publishing point on a Windows Media server.
     * @param {PWSTR} pwszURL Wide-character string that contains the URL of the publishing point on the Windows Media server. For example, if the URL is "http://MyServer/MyPublishingPoint", the push sink connects to the publishing point named MyPublishingPoint on the server named MyServer. The default port number is 80. If the server is using a different port, specify the port number in the URL. For example, "http://MyServer:8080/MyPublishingPoint" specifies port number 8080.
     * @param {PWSTR} pwszTemplateURL Optional wide-character string that contains the URL of an existing publishing point to use as a template. This parameter can be <b>NULL</b>.
     * @param {BOOL} fAutoDestroy Boolean value that specifies whether to remove the publishing point after the push sink disconnects from the server.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
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
     * Invalid argument; <i>pwszURL</i> cannot be <b>NULL</b>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Host name is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-connect
     */
    Connect(pwszURL, pwszTemplateURL, fAutoDestroy) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        pwszTemplateURL := pwszTemplateURL is String ? StrPtr(pwszTemplateURL) : pwszTemplateURL

        result := ComCall(8, this, "ptr", pwszURL, "ptr", pwszTemplateURL, "int", fAutoDestroy, "HRESULT")
        return result
    }

    /**
     * The Disconnect method disconnects the push sink from the server.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-disconnect
     */
    Disconnect() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The EndSession method ends the push distribution session. This method sends an end-of-stream message to the server, and then shuts down the data path on the server.
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
     * <dt><b>NS_E_CONNECTION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A connection failure occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no connection to the server. (Possibly this method was called before any connection was made.)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-endsession
     */
    EndSession() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}

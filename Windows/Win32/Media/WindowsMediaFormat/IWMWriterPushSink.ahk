#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMWriterSink.ahk" { IWMWriterSink }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IWMWriterPushSink interface enables the application to send ASF files to a publishing point on a Windows Media server.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwriterpushsink
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterPushSink extends IWMWriterSink {
    /**
     * The interface identifier for IWMWriterPushSink
     * @type {Guid}
     */
    static IID := Guid("{dc10e6a5-072c-467d-bf57-6330a9dde12a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterPushSink interfaces
    */
    struct Vtbl extends IWMWriterSink.Vtbl {
        Connect    : IntPtr
        Disconnect : IntPtr
        EndSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterPushSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Connect method connects to a publishing point on a Windows Media server.
     * @remarks
     * If the publishing point specified in <i>pwsURL</i> does not exist, the server creates a new publishing point. The caller must have write and create permissions on the server. The new publishing point has the same configuration as the publishing point specified in the <i>pwszTemplateURL</i> parameter. If <i>pwszTemplateURL</i> is <b>NULL</b>, the new publishing point has the same configuration as the server's default publishing point.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-connect
     */
    Connect(pwszURL, pwszTemplateURL, fAutoDestroy) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        pwszTemplateURL := pwszTemplateURL is String ? StrPtr(pwszTemplateURL) : pwszTemplateURL

        result := ComCall(8, this, "ptr", pwszURL, "ptr", pwszTemplateURL, BOOL, fAutoDestroy, "HRESULT")
        return result
    }

    /**
     * The Disconnect method disconnects the push sink from the server.
     * @remarks
     * The data path on the downstream server remains active for 5 minutes, after which it is cleaned up.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-disconnect
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpushsink-endsession
     */
    EndSession() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMWriterPushSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 4)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
        this.vtbl.EndSession := CallbackCreate(GetMethod(implObj, "EndSession"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
        CallbackFree(this.vtbl.EndSession)
    }
}

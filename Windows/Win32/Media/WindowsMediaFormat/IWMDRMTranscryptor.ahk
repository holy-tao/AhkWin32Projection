#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import ".\IWMStatusCallback.ahk" { IWMStatusCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMDRMTranscryptor interface transforms a DRM-protected ASF file into a secure data stream conforming to the Windows Media DRM 10 for Network Devices protocol.
 * @remarks
 * The DRM transcryptor is initialized after a policy request message is sent by a device. You can parse a license request and obtain the device certificate, the device serial number, and the requested action by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parselicenserequestmsg">IWMDRMMessageParser::ParseLicenseRequestMsg</a>.
 * 
 * The methods of the <b>IWMDRMTranscryptor</b> interface use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback method to inform the application of progress. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/using-the-callback-methods">Using the Callback Methods</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmdrmtranscryptor
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMDRMTranscryptor extends IUnknown {
    /**
     * The interface identifier for IWMDRMTranscryptor
     * @type {Guid}
     */
    static IID := Guid("{69059850-6e6f-4bb2-806f-71863ddfc471}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDRMTranscryptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        Seek       : IntPtr
        Read       : IntPtr
        Close      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDRMTranscryptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Initialize method loads a file into the DRM transcryptor. A file must be loaded before the transcryptor can process any data.
     * @remarks
     * This method is asynchronous. It returns immediately, but processing is not complete until a WMT_TRANSCRYPTOR_INIT message is sent to the <b>IWMStatusCallback::OnStatus</b> callback method. The <b>HRESULT</b> sent with the message contains the return value for the initialization.
     * @param {BSTR} bstrFileName Name of the file to load. This should be a DRM-encrypted ASF file.
     * @param {Pointer<Integer>} pbLicenseRequestMsg Address of the license request message in memory. This message is sent to your application by a device.
     * @param {Integer} cbLicenseRequestMsg The size of the license request message in bytes.
     * @param {IWMStatusCallback} pCallback Address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> implementation that will receive status messages from the transcryptor.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This is passed to the application in calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback. You can use this parameter to differentiate between messages from different objects when sharing a single status callback. This parameter can be <b>NULL</b>.
     * @returns {INSSBuffer} Address of a variable that receives the address of the license response message. Your application must send this message to the device before sending any encrypted data.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptor-initialize
     */
    Initialize(bstrFileName, pbLicenseRequestMsg, cbLicenseRequestMsg, pCallback, pvContext) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        pbLicenseRequestMsgMarshal := pbLicenseRequestMsg is VarRef ? "char*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, BSTR, bstrFileName, pbLicenseRequestMsgMarshal, pbLicenseRequestMsg, "uint", cbLicenseRequestMsg, "ptr*", &ppLicenseResponseMsg := 0, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppLicenseResponseMsg)
    }

    /**
     * The Seek method sets the DRM transcryptor to read from the specified point in the data stream of the loaded file. Subsequent Read calls generate data beginning at that point.
     * @remarks
     * This method is asynchronous. It returns immediately, but processing is not complete until a WMT_TRANSCRYPTOR_SEEKED message is sent to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback method.
     * 
     * If the seek operation fails, no message is sent.
     * 
     * The first successful call to <b>Seek</b> causes the transcryptor to read the ASF header for the content. All subsequent <b>Seek</b> calls change the reading location in the data section, but do not generate a header or an ASF Data Object (the ASF object that contains top-level information about the data section).
     * 
     * To convert the entire file, call <b>Seek</b> with a presentation time of 0.
     * @param {Integer} hnsTime Seek time in 100-nanosecond units.
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
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no file loaded in the transcryptor.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptor-seek
     */
    Seek(hnsTime) {
        result := ComCall(4, this, "uint", hnsTime, "HRESULT")
        return result
    }

    /**
     * The Read method reads data from the file loaded in the transcryptor and encrypts it for streaming to devices that support Windows Media DRM 10 for Network Devices.
     * @remarks
     * This method is asynchronous. It returns immediately, but processing is not complete until a WMT_TRANSCRYPTOR_READ message is sent to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback method. Neither the buffer referenced by <i>pbData</i> nor the buffer length referenced by <i>pcbData</i> are updated until the WMT_TRANSCRYPTOR_READ message is sent.
     * 
     * The <b>HRESULT</b> sent with the WMT_TRANSCRYPTOR_READ message contains the return value for the read operation. A special success code, NS_S_TRANSCRYPTOR_EOF, is sent to indicate that the data from this read operation includes the end of the file.
     * @param {Pointer<Integer>} pbData Address of a buffer that receives the data.
     * @param {Pointer<Integer>} pcbData Address of a variable containing the size of the data buffer pointed to by <i>pbData</i>. On input, set to the size of the buffer.On output, the value is changed to the number of bytes actually read.
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
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transcryptor is not ready for reading.
     * 
     * OR
     * 
     * Another read is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptor-read
     */
    Read(pbData, pcbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbDataMarshal, pbData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * The Close method unloads the file from the DRM transcryptor and releases all associated resources.
     * @remarks
     * This method is asynchronous. It returns immediately, but processing is not complete until a WMT_TRANSCRYPTOR_CLOSED message is sent to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback method.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptor-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDRMTranscryptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 7)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 2)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 3)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Seek)
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Close)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DRM_VAL16.ahk" { DRM_VAL16 }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMDRMMessageParser interface parses pertinent information from messages received from a device.An IWMDRMMessageParser interface exists for every device registration object.
 * @remarks
 * This interface deals with two types of messages: registration messages that come from new devices on the network, and license request messages that devices send to request actions. These messages are intended to accommodate the Windows Media DRM 10 for Network Devices protocol. A device can send other message types, which your application might need to intercept. Details vary by device and by protocol. For more information, refer to the appropriate specifications or standards for the device or protocol you want to support.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmdrmmessageparser
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMDRMMessageParser extends IUnknown {
    /**
     * The interface identifier for IWMDRMMessageParser
     * @type {Guid}
     */
    static IID := Guid("{a73a0072-25a0-4c99-b4a5-ede8101a6c39}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDRMMessageParser interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ParseRegistrationReqMsg : IntPtr
        ParseLicenseRequestMsg  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDRMMessageParser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ParseRegistrationReqMsg method extracts the device certificate and identifier from a registration message sent by a device.
     * @remarks
     * Registration request messages are sent by devices when they are connected to a network shared by the computer running your application. When your application receives the message, it must first parse the message by using this method to retrieve the device certificate and device identifier. The combination of device certificate and device identifier uniquely identifies the device.
     * 
     * After parsing the message with this method, you can search the device database to determine whether the device is already registered, or you can try to register the device. Both of these actions use the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmdeviceregistration">IWMDeviceRegistration</a> interface.
     * @param {Pointer<Integer>} pbRegistrationReqMsg Address of the registration message in memory. This is a message received by your application from a device.
     * @param {Integer} cbRegistrationReqMsg The size of registration message in bytes.
     * @param {Pointer<INSSBuffer>} ppDeviceCert Address of a variable that receives the address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of the buffer object that contains the device certificate.
     * @param {Pointer<DRM_VAL16>} pDeviceSerialNumber Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure that receives the device identifier.
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
     * The <i>pbRegistrationMsg</i> parameter is <b>NULL</b>, or the <i>cbRegistrationMsg</i> parameter is 0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parseregistrationreqmsg
     */
    ParseRegistrationReqMsg(pbRegistrationReqMsg, cbRegistrationReqMsg, ppDeviceCert, pDeviceSerialNumber) {
        pbRegistrationReqMsgMarshal := pbRegistrationReqMsg is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbRegistrationReqMsgMarshal, pbRegistrationReqMsg, "uint", cbRegistrationReqMsg, INSSBuffer.Ptr, ppDeviceCert, DRM_VAL16.Ptr, pDeviceSerialNumber, "HRESULT")
        return result
    }

    /**
     * The ParseLicenseRequestMsg method extracts the device identification and requested action from a policy request message.
     * @remarks
     * The license request message sent by the device determines the action that your application should take. After parsing a message with the "Play" action, you can begin processing the file with the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmdrmtranscryptor">IWMDRMTranscryptor</a> interface.
     * @param {Pointer<Integer>} pbLicenseRequestMsg Address of the license request message in memory. This is a message received by your application from a device.
     * @param {Integer} cbLicenseRequestMsg The size of license request message in bytes.
     * @param {Pointer<INSSBuffer>} ppDeviceCert Address of a variable that receives the address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of the buffer object that contains the device certificate.
     * @param {Pointer<DRM_VAL16>} pDeviceSerialNumber Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure that receives the device identifier.
     * @param {Pointer<BSTR>} pbstrAction Address of a variable that receives the string containing the requested action. The supported actions correspond to rights associates with DRM licenses. The only action string currently supported is "Play".
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
     * The <i>pbLicenseRequestMsg</i> parameter is <b>NULL</b>, or the <i>cbLicenseRequestMsg</i> parameter is 0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parselicenserequestmsg
     */
    ParseLicenseRequestMsg(pbLicenseRequestMsg, cbLicenseRequestMsg, ppDeviceCert, pDeviceSerialNumber, pbstrAction) {
        pbLicenseRequestMsgMarshal := pbLicenseRequestMsg is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbLicenseRequestMsgMarshal, pbLicenseRequestMsg, "uint", cbLicenseRequestMsg, INSSBuffer.Ptr, ppDeviceCert, DRM_VAL16.Ptr, pDeviceSerialNumber, BSTR.Ptr, pbstrAction, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDRMMessageParser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParseRegistrationReqMsg := CallbackCreate(GetMethod(implObj, "ParseRegistrationReqMsg"), flags, 5)
        this.vtbl.ParseLicenseRequestMsg := CallbackCreate(GetMethod(implObj, "ParseLicenseRequestMsg"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParseRegistrationReqMsg)
        CallbackFree(this.vtbl.ParseLicenseRequestMsg)
    }
}

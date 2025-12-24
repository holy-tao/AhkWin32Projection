#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMMessageParser interface parses pertinent information from messages received from a device.An IWMDRMMessageParser interface exists for every device registration object.
 * @remarks
 * 
 * This interface deals with two types of messages: registration messages that come from new devices on the network, and license request messages that devices send to request actions. These messages are intended to accommodate the Windows Media DRM 10 for Network Devices protocol. A device can send other message types, which your application might need to intercept. Details vary by device and by protocol. For more information, refer to the appropriate specifications or standards for the device or protocol you want to support.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmmessageparser
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMMessageParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMMessageParser
     * @type {Guid}
     */
    static IID => Guid("{a73a0072-25a0-4c99-b4a5-ede8101a6c39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseRegistrationReqMsg", "ParseLicenseRequestMsg"]

    /**
     * The ParseRegistrationReqMsg method extracts the device certificate and identifier from a registration message sent by a device.
     * @param {Pointer<Integer>} pbRegistrationReqMsg Address of the registration message in memory. This is a message received by your application from a device.
     * @param {Integer} cbRegistrationReqMsg The size of registration message in bytes.
     * @param {Pointer<INSSBuffer>} ppDeviceCert Address of a variable that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of the buffer object that contains the device certificate.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parseregistrationreqmsg
     */
    ParseRegistrationReqMsg(pbRegistrationReqMsg, cbRegistrationReqMsg, ppDeviceCert, pDeviceSerialNumber) {
        pbRegistrationReqMsgMarshal := pbRegistrationReqMsg is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbRegistrationReqMsgMarshal, pbRegistrationReqMsg, "uint", cbRegistrationReqMsg, "ptr*", ppDeviceCert, "ptr", pDeviceSerialNumber, "HRESULT")
        return result
    }

    /**
     * The ParseLicenseRequestMsg method extracts the device identification and requested action from a policy request message.
     * @param {Pointer<Integer>} pbLicenseRequestMsg Address of the license request message in memory. This is a message received by your application from a device.
     * @param {Integer} cbLicenseRequestMsg The size of license request message in bytes.
     * @param {Pointer<INSSBuffer>} ppDeviceCert Address of a variable that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of the buffer object that contains the device certificate.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parselicenserequestmsg
     */
    ParseLicenseRequestMsg(pbLicenseRequestMsg, cbLicenseRequestMsg, ppDeviceCert, pDeviceSerialNumber, pbstrAction) {
        pbLicenseRequestMsgMarshal := pbLicenseRequestMsg is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbLicenseRequestMsgMarshal, pbLicenseRequestMsg, "uint", cbLicenseRequestMsg, "ptr*", ppDeviceCert, "ptr", pDeviceSerialNumber, "ptr", pbstrAction, "HRESULT")
        return result
    }
}

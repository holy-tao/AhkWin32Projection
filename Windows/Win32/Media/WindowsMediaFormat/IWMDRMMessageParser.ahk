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
     * 
     * @param {Pointer<Integer>} pbRegistrationReqMsg 
     * @param {Integer} cbRegistrationReqMsg 
     * @param {Pointer<INSSBuffer>} ppDeviceCert 
     * @param {Pointer<DRM_VAL16>} pDeviceSerialNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parseregistrationreqmsg
     */
    ParseRegistrationReqMsg(pbRegistrationReqMsg, cbRegistrationReqMsg, ppDeviceCert, pDeviceSerialNumber) {
        result := ComCall(3, this, "char*", pbRegistrationReqMsg, "uint", cbRegistrationReqMsg, "ptr*", ppDeviceCert, "ptr", pDeviceSerialNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbLicenseRequestMsg 
     * @param {Integer} cbLicenseRequestMsg 
     * @param {Pointer<INSSBuffer>} ppDeviceCert 
     * @param {Pointer<DRM_VAL16>} pDeviceSerialNumber 
     * @param {Pointer<BSTR>} pbstrAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parselicenserequestmsg
     */
    ParseLicenseRequestMsg(pbLicenseRequestMsg, cbLicenseRequestMsg, ppDeviceCert, pDeviceSerialNumber, pbstrAction) {
        result := ComCall(4, this, "char*", pbLicenseRequestMsg, "uint", cbLicenseRequestMsg, "ptr*", ppDeviceCert, "ptr", pDeviceSerialNumber, "ptr", pbstrAction, "HRESULT")
        return result
    }
}

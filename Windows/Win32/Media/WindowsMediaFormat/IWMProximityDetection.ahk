#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMProximityDetection interface validates a playback device for receiving media data.
 * @remarks
 * 
  * The validation state is stored in the device registration database. You can check the validation state for a device by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid">IWMRegisteredDevice::IsValid</a>.
  * 
  * Validation expires after 48 hours.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmproximitydetection
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProximityDetection extends IUnknown{
    /**
     * The interface identifier for IWMProximityDetection
     * @type {Guid}
     */
    static IID => Guid("{6a9fd8ee-b651-4bf0-b849-7d4ece79a2b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbRegistrationMsg 
     * @param {Integer} cbRegistrationMsg 
     * @param {Pointer<Byte>} pbLocalAddress 
     * @param {Integer} cbLocalAddress 
     * @param {Integer} dwExtraPortsAllowed 
     * @param {Pointer<INSSBuffer>} ppRegistrationResponseMsg 
     * @param {Pointer<IWMStatusCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    StartDetection(pbRegistrationMsg, cbRegistrationMsg, pbLocalAddress, cbLocalAddress, dwExtraPortsAllowed, ppRegistrationResponseMsg, pCallback, pvContext) {
        result := ComCall(3, this, "char*", pbRegistrationMsg, "uint", cbRegistrationMsg, "char*", pbLocalAddress, "uint", cbLocalAddress, "uint", dwExtraPortsAllowed, "ptr", ppRegistrationResponseMsg, "ptr", pCallback, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartDetection"]

    /**
     * 
     * @param {Pointer<Integer>} pbRegistrationMsg 
     * @param {Integer} cbRegistrationMsg 
     * @param {Pointer<Integer>} pbLocalAddress 
     * @param {Integer} cbLocalAddress 
     * @param {Integer} dwExtraPortsAllowed 
     * @param {Pointer<INSSBuffer>} ppRegistrationResponseMsg 
     * @param {IWMStatusCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmproximitydetection-startdetection
     */
    StartDetection(pbRegistrationMsg, cbRegistrationMsg, pbLocalAddress, cbLocalAddress, dwExtraPortsAllowed, ppRegistrationResponseMsg, pCallback, pvContext) {
        result := ComCall(3, this, "char*", pbRegistrationMsg, "uint", cbRegistrationMsg, "char*", pbLocalAddress, "uint", cbLocalAddress, "uint", dwExtraPortsAllowed, "ptr*", ppRegistrationResponseMsg, "ptr", pCallback, "ptr", pvContext, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPSubscriptionService.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//subscriptionservices/nn-subscriptionservices-iwmpsubscriptionservice2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSubscriptionService2 extends IWMPSubscriptionService{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSubscriptionService2
     * @type {Guid}
     */
    static IID => Guid("{a94c120e-d600-4ec6-b05e-ec9d56d84de0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["stopBackgroundProcessing", "serviceEvent", "deviceAvailable", "prepareForSync"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-stopbackgroundprocessing
     */
    stopBackgroundProcessing() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} event 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-serviceevent
     */
    serviceEvent(event) {
        result := ComCall(8, this, "int", event, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceName 
     * @param {IWMPSubscriptionServiceCallback} pCB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-deviceavailable
     */
    deviceAvailable(bstrDeviceName, pCB) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(9, this, "ptr", bstrDeviceName, "ptr", pCB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFilename 
     * @param {BSTR} bstrDeviceName 
     * @param {IWMPSubscriptionServiceCallback} pCB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-prepareforsync
     */
    prepareForSync(bstrFilename, bstrDeviceName, pCB) {
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(10, this, "ptr", bstrFilename, "ptr", bstrDeviceName, "ptr", pCB, "HRESULT")
        return result
    }
}

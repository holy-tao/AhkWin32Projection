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
     * 
     * @returns {HRESULT} 
     */
    stopBackgroundProcessing() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} event 
     * @returns {HRESULT} 
     */
    serviceEvent(event) {
        result := ComCall(8, this, "int", event, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceName 
     * @param {Pointer<IWMPSubscriptionServiceCallback>} pCB 
     * @returns {HRESULT} 
     */
    deviceAvailable(bstrDeviceName, pCB) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(9, this, "ptr", bstrDeviceName, "ptr", pCB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFilename 
     * @param {BSTR} bstrDeviceName 
     * @param {Pointer<IWMPSubscriptionServiceCallback>} pCB 
     * @returns {HRESULT} 
     */
    prepareForSync(bstrFilename, bstrDeviceName, pCB) {
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(10, this, "ptr", bstrFilename, "ptr", bstrDeviceName, "ptr", pCB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

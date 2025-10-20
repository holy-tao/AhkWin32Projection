#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//subscriptionservices/nn-subscriptionservices-iwmpsubscriptionservicecallback
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSubscriptionServiceCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSubscriptionServiceCallback
     * @type {Guid}
     */
    static IID => Guid("{dd01d127-2dc2-4c3a-876e-63312079f9b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["onComplete"]

    /**
     * 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservicecallback-oncomplete
     */
    onComplete(hrResult) {
        result := ComCall(3, this, "int", hrResult, "HRESULT")
        return result
    }
}

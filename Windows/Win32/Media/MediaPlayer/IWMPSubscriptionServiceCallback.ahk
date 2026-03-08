#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nn-subscriptionservices-iwmpsubscriptionservicecallback
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
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The onComplete method notifies Windows Media Player when a background process is completed.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-prepareforsync">IWMPSubscriptionService2::prepareForSync</a> and <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-deviceavailable">IWMPSubscriptionService2::deviceAvailable</a> supply a pointer to an <b>IWMPSubscriptionServiceCallback</b> interface. When responding to calls from Windows Media Player to these methods, you must pass any time-consuming tasks to a separate worker thread and return immediately. When the worker thread has completed its task, it must call <b>IWMPSubscriptionServiceCallback::onComplete</b>.
     * 
     * In your <b>prepareForSync</b> and <b>deviceAvailable</b> methods, use the following procedure to provide your worker thread with a pointer to an <b>IWMPSubscriptionServiceCallback</b> interface.
     * 
     * <ol>
     * <li>Pass the pointer supplied in the <i>pCB</i> parameter to <b>CoMarshalInterThreadInterfaceInStream</b>, which returns an <b>IStream</b> pointer.</li>
     * <li>Pass the <b>IStream</b> pointer to your worker thread.</li>
     * <li>In your worker thread, call <b>CoGetInterfaceAndReleaseStream</b>, which returns an interface pointer that you can use to call <b>onComplete</b>.</li>
     * </ol>
     * @param {HRESULT} hrResult <b>HRESULT</b> success or error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservicecallback-oncomplete
     */
    onComplete(hrResult) {
        result := ComCall(3, this, "int", hrResult, "HRESULT")
        return result
    }
}

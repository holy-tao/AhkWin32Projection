#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITTAPIEventNotification interface is an outgoing interface that allows an application to control the processing of event information.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittapieventnotification
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPIEventNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTAPIEventNotification
     * @type {Guid}
     */
    static IID => Guid("{eddb9426-3b91-11d1-8f30-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Event"]

    /**
     * The Event method is called by TAPI to determine the response to an asynchronous event notification.
     * @param {Integer} TapiEvent <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_event">TAPI_EVENT</a> indicator of the event.
     * @param {IDispatch} pEvent Pointer to an <b>IDispatch</b> interface of the object associated with this event.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pEvent</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapieventnotification-event
     */
    Event(TapiEvent, pEvent) {
        result := ComCall(3, this, "int", TapiEvent, "ptr", pEvent, "HRESULT")
        return result
    }
}

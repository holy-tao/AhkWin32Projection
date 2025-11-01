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
     * 
     * @param {Integer} TapiEvent 
     * @param {IDispatch} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapieventnotification-event
     */
    Event(TapiEvent, pEvent) {
        result := ComCall(3, this, "int", TapiEvent, "ptr", pEvent, "HRESULT")
        return result
    }
}

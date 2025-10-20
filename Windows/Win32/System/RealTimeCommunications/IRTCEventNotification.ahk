#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCEventNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCEventNotification
     * @type {Guid}
     */
    static IID => Guid("{13fa24c7-5748-4b21-91f5-7397609ce747}")

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
     * @param {Integer} RTCEvent 
     * @param {IDispatch} pEvent 
     * @returns {HRESULT} 
     */
    Event(RTCEvent, pEvent) {
        result := ComCall(3, this, "int", RTCEvent, "ptr", pEvent, "HRESULT")
        return result
    }
}

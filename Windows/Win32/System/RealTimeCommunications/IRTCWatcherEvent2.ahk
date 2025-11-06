#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCWatcherEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCWatcherEvent2 extends IRTCWatcherEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCWatcherEvent2
     * @type {Guid}
     */
    static IID => Guid("{e52891e8-188c-49af-b005-98ed13f83f9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_StatusCode"]

    /**
     * 
     * @returns {Integer} 
     */
    get_EventType() {
        result := ComCall(8, this, "int*", &pEventType := 0, "HRESULT")
        return pEventType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }
}

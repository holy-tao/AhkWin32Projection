#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCWatcherEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCWatcherEvent2 extends IRTCWatcherEvent{
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
     * 
     * @param {Pointer<Int32>} pEventType 
     * @returns {HRESULT} 
     */
    get_EventType(pEventType) {
        result := ComCall(8, this, "int*", pEventType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        result := ComCall(9, this, "int*", plStatusCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

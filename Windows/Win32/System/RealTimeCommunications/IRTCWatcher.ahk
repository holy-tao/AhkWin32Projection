#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCPresenceContact.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCWatcher extends IRTCPresenceContact{
    /**
     * The interface identifier for IRTCWatcher
     * @type {Guid}
     */
    static IID => Guid("{c7cedad8-346b-4d1b-ac02-a2088df9be4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<Int32>} penState 
     * @returns {HRESULT} 
     */
    get_State(penState) {
        result := ComCall(11, this, "int*", penState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enState 
     * @returns {HRESULT} 
     */
    put_State(enState) {
        result := ComCall(12, this, "int", enState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

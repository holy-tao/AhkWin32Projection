#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RTC_WATCHER_STATE.ahk
#Include .\IRTCPresenceContact.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class IRTCWatcher extends IRTCPresenceContact {

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State", "put_State"]

    /**
     * @type {RTC_WATCHER_STATE} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * 
     * @returns {RTC_WATCHER_STATE} 
     */
    get_State() {
        result := ComCall(11, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    /**
     * 
     * @param {RTC_WATCHER_STATE} enState 
     * @returns {HRESULT} 
     */
    put_State(enState) {
        result := ComCall(12, this, "int", enState, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IRTCClient.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class IRTCClientEvent extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClientEvent
     * @type {Guid}
     */
    static IID => Guid("{2b493b7a-3cba-4170-9c8b-76a9dacdd644}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_Client"]

    /**
     * @type {RTC_CLIENT_EVENT_TYPE} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {IRTCClient} 
     */
    Client {
        get => this.get_Client()
    }

    /**
     * 
     * @returns {RTC_CLIENT_EVENT_TYPE} 
     */
    get_EventType() {
        result := ComCall(7, this, "int*", &penEventType := 0, "HRESULT")
        return penEventType
    }

    /**
     * 
     * @returns {IRTCClient} 
     */
    get_Client() {
        result := ComCall(8, this, "ptr*", &ppClient := 0, "HRESULT")
        return IRTCClient(ppClient)
    }
}

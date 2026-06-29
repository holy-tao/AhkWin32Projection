#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_PUSH_TRANSPORT_SETTING extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Guid}
     */
    TransportSettingId {
        get {
            if(!this.HasProp("__TransportSettingId"))
                this.__TransportSettingId := Guid(0, this)
            return this.__TransportSettingId
        }
    }

    /**
     * @type {Guid}
     */
    BrokerEventId {
        get {
            if(!this.HasProp("__BrokerEventId"))
                this.__BrokerEventId := Guid(16, this)
            return this.__BrokerEventId
        }
    }
}

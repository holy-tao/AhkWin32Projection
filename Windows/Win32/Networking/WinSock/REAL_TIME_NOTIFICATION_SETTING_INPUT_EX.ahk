#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSPORT_SETTING_ID.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class REAL_TIME_NOTIFICATION_SETTING_INPUT_EX extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {TRANSPORT_SETTING_ID}
     */
    TransportSettingId {
        get {
            if(!this.HasProp("__TransportSettingId"))
                this.__TransportSettingId := TRANSPORT_SETTING_ID(0, this)
            return this.__TransportSettingId
        }
    }

    /**
     * @type {Guid}
     */
    BrokerEventGuid {
        get {
            if(!this.HasProp("__BrokerEventGuid"))
                this.__BrokerEventGuid := Guid(16, this)
            return this.__BrokerEventGuid
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Unmark {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }
}

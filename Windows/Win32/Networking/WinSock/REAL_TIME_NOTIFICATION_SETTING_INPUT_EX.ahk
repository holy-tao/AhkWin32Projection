#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSPORT_SETTING_ID.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class REAL_TIME_NOTIFICATION_SETTING_INPUT_EX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {TRANSPORT_SETTING_ID}
     */
    TransportSettingId{
        get {
            if(!this.HasProp("__TransportSettingId"))
                this.__TransportSettingId := TRANSPORT_SETTING_ID(0, this)
            return this.__TransportSettingId
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    BrokerEventGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    Unmark {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}

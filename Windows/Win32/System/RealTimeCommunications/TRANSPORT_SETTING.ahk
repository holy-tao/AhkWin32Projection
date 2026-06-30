#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\TRANSPORT_SETTING_ID.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class TRANSPORT_SETTING extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {TRANSPORT_SETTING_ID}
     */
    SettingId {
        get {
            if(!this.HasProp("__SettingId"))
                this.__SettingId := TRANSPORT_SETTING_ID(0, this)
            return this.__SettingId
        }
    }

    /**
     * @type {Pointer<Integer>}
     */
    Length {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Value {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

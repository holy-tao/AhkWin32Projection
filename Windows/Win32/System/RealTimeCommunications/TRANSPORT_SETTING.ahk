#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\TRANSPORT_SETTING_ID.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class TRANSPORT_SETTING extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {TRANSPORT_SETTING_ID}
     */
    SettingId{
        get {
            if(!this.HasProp("__SettingId"))
                this.__SettingId := TRANSPORT_SETTING_ID(0, this)
            return this.__SettingId
        }
    }

    /**
     * @type {Pointer<UInt32>}
     */
    Length {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Byte>}
     */
    Value {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Sent with a power setting event and contains data about the specific change.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-powerbroadcast_setting
 * @namespace Windows.Win32.System.Power
 */
class POWERBROADCAST_SETTING extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * Indicates the power setting for which this notification is being delivered. For more 
     *     info, see <a href="https://docs.microsoft.com/windows/desktop/Power/power-setting-guids">Power Setting GUIDs</a>.
     * @type {Guid}
     */
    PowerSetting {
        get {
            if(!this.HasProp("__PowerSetting"))
                this.__PowerSetting := Guid(0, this)
            return this.__PowerSetting
        }
    }

    /**
     * The size in bytes of the data in the  <i>Data</i> member.
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The new value of the power setting. The type and possible values for this member depend on <i>PowerSettng.</i>
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}

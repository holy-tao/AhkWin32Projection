#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sent with a power setting event and contains data about the specific change.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-powerbroadcast_setting
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWERBROADCAST_SETTING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the power setting for which this notification is being delivered. For more 
     *     info, see <a href="https://docs.microsoft.com/windows/desktop/Power/power-setting-guids">Power Setting GUIDs</a>.
     * @type {Pointer<Guid>}
     */
    PowerSetting {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size in bytes of the data in the  <i>Data</i> member.
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The new value of the power setting. The type and possible values for this member depend on <i>PowerSettng.</i>
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_SET_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    JobHandle{
        get {
            if(!this.HasProp("__JobHandle"))
                this.__JobHandle := HANDLE(0, this)
            return this.__JobHandle
        }
    }

    /**
     * @type {Integer}
     */
    MemberLevel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

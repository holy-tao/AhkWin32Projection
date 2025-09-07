#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\ACE_HEADER.ahk

/**
 * The SYSTEM_ALARM_ACE structure is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_ace
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SYSTEM_ALARM_ACE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {ACE_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := ACE_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    Mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SidStart {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

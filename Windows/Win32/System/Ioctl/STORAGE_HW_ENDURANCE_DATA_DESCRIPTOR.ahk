#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_HW_ENDURANCE_INFO.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_HW_ENDURANCE_DATA_DESCRIPTOR extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {STORAGE_HW_ENDURANCE_INFO}
     */
    EnduranceInfo{
        get {
            if(!this.HasProp("__EnduranceInfo"))
                this.__EnduranceInfo := STORAGE_HW_ENDURANCE_INFO(this.ptr + 8)
            return this.__EnduranceInfo
        }
    }
}

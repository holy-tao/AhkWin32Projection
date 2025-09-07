#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SD_CHANGE_MACHINE_SID_OUTPUT.ahk
#Include .\SD_QUERY_STATS_OUTPUT.ahk
#Include .\SD_ENUM_SDS_ENTRY.ahk
#Include .\SD_ENUM_SDS_OUTPUT.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SD_GLOBAL_CHANGE_OUTPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ChangeType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {SD_CHANGE_MACHINE_SID_OUTPUT}
     */
    SdChange{
        get {
            if(!this.HasProp("__SdChange"))
                this.__SdChange := SD_CHANGE_MACHINE_SID_OUTPUT(this.ptr + 8)
            return this.__SdChange
        }
    }

    /**
     * @type {SD_QUERY_STATS_OUTPUT}
     */
    SdQueryStats{
        get {
            if(!this.HasProp("__SdQueryStats"))
                this.__SdQueryStats := SD_QUERY_STATS_OUTPUT(this.ptr + 8)
            return this.__SdQueryStats
        }
    }

    /**
     * @type {SD_ENUM_SDS_OUTPUT}
     */
    SdEnumSds{
        get {
            if(!this.HasProp("__SdEnumSds"))
                this.__SdEnumSds := SD_ENUM_SDS_OUTPUT(this.ptr + 8)
            return this.__SdEnumSds
        }
    }
}

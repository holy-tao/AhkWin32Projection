#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SD_CHANGE_MACHINE_SID_INPUT.ahk
#Include .\SD_QUERY_STATS_INPUT.ahk
#Include .\SD_ENUM_SDS_INPUT.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SD_GLOBAL_CHANGE_INPUT extends Win32Struct
{
    static sizeof => 24

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
     * @type {SD_CHANGE_MACHINE_SID_INPUT}
     */
    SdChange{
        get {
            if(!this.HasProp("__SdChange"))
                this.__SdChange := SD_CHANGE_MACHINE_SID_INPUT(this.ptr + 8)
            return this.__SdChange
        }
    }

    /**
     * @type {SD_QUERY_STATS_INPUT}
     */
    SdQueryStats{
        get {
            if(!this.HasProp("__SdQueryStats"))
                this.__SdQueryStats := SD_QUERY_STATS_INPUT(this.ptr + 8)
            return this.__SdQueryStats
        }
    }

    /**
     * @type {SD_ENUM_SDS_INPUT}
     */
    SdEnumSds{
        get {
            if(!this.HasProp("__SdEnumSds"))
                this.__SdEnumSds := SD_ENUM_SDS_INPUT(this.ptr + 8)
            return this.__SdEnumSds
        }
    }
}

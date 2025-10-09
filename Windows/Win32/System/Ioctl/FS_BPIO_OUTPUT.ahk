#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FS_BPIO_RESULTS.ahk
#Include .\FS_BPIO_INFO.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FS_BPIO_OUTPUT extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OutFlags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {FS_BPIO_RESULTS}
     */
    Enable{
        get {
            if(!this.HasProp("__Enable"))
                this.__Enable := FS_BPIO_RESULTS(this.ptr + 24)
            return this.__Enable
        }
    }

    /**
     * @type {FS_BPIO_RESULTS}
     */
    Query{
        get {
            if(!this.HasProp("__Query"))
                this.__Query := FS_BPIO_RESULTS(this.ptr + 24)
            return this.__Query
        }
    }

    /**
     * @type {FS_BPIO_RESULTS}
     */
    VolumeStackResume{
        get {
            if(!this.HasProp("__VolumeStackResume"))
                this.__VolumeStackResume := FS_BPIO_RESULTS(this.ptr + 24)
            return this.__VolumeStackResume
        }
    }

    /**
     * @type {FS_BPIO_RESULTS}
     */
    StreamResume{
        get {
            if(!this.HasProp("__StreamResume"))
                this.__StreamResume := FS_BPIO_RESULTS(this.ptr + 24)
            return this.__StreamResume
        }
    }

    /**
     * @type {FS_BPIO_INFO}
     */
    GetInfo{
        get {
            if(!this.HasProp("__GetInfo"))
                this.__GetInfo := FS_BPIO_INFO(this.ptr + 24)
            return this.__GetInfo
        }
    }
}

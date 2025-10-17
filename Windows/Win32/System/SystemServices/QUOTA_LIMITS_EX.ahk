#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RATE_QUOTA_LIMIT.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class QUOTA_LIMITS_EX extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    PagedPoolLimit {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    NonPagedPoolLimit {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    MinimumWorkingSetSize {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    MaximumWorkingSetSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    PagefileLimit {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    TimeLimit {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    WorkingSetLimit {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    Reserved2 {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    Reserved3 {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    Reserved4 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {RATE_QUOTA_LIMIT}
     */
    CpuRateLimit{
        get {
            if(!this.HasProp("__CpuRateLimit"))
                this.__CpuRateLimit := RATE_QUOTA_LIMIT(88, this)
            return this.__CpuRateLimit
        }
    }
}

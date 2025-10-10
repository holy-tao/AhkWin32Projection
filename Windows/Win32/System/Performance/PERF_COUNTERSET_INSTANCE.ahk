#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTERSET_INSTANCE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    CounterSetGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    InstanceNameOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    InstanceNameSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

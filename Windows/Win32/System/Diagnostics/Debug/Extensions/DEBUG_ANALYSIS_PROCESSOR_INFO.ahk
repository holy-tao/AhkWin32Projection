#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_ANALYSIS_PROCESSOR_INFO extends Win32Struct
{
    static sizeof => 616

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Model {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Family {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Stepping {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Architecture {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    CurrentClockSpeed {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CurrentVoltage {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    MaxClockSpeed {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ProcessorType {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {String}
     */
    DeviceID {
        get => StrGet(this.ptr + 40, 31, "UTF-16")
        set => StrPut(value, this.ptr + 40, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    Manufacturer {
        get => StrGet(this.ptr + 104, 63, "UTF-16")
        set => StrPut(value, this.ptr + 104, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 232, 63, "UTF-16")
        set => StrPut(value, this.ptr + 232, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    Version {
        get => StrGet(this.ptr + 360, 63, "UTF-16")
        set => StrPut(value, this.ptr + 360, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 488, 63, "UTF-16")
        set => StrPut(value, this.ptr + 488, 63, "UTF-16")
    }
}

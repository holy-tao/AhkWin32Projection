#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class DEBUG_ANALYSIS_PROCESSOR_INFO extends Win32Struct {
    static sizeof => 328

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
        get => StrGet(this.ptr + 40, 31, "UTF-8")
        set => StrPut(value, this.ptr + 40, 31, "UTF-8")
    }

    /**
     * @type {String}
     */
    Manufacturer {
        get => StrGet(this.ptr + 72, 63, "UTF-8")
        set => StrPut(value, this.ptr + 72, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 136, 63, "UTF-8")
        set => StrPut(value, this.ptr + 136, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    Version {
        get => StrGet(this.ptr + 200, 63, "UTF-8")
        set => StrPut(value, this.ptr + 200, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 264, 63, "UTF-8")
        set => StrPut(value, this.ptr + 264, 63, "UTF-8")
    }
}

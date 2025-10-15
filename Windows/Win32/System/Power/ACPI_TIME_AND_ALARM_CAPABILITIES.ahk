#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class ACPI_TIME_AND_ALARM_CAPABILITIES extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    AcWakeSupported{
        get {
            if(!this.HasProp("__AcWakeSupported"))
                this.__AcWakeSupported := BOOLEAN(this.ptr + 0)
            return this.__AcWakeSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    DcWakeSupported{
        get {
            if(!this.HasProp("__DcWakeSupported"))
                this.__DcWakeSupported := BOOLEAN(this.ptr + 1)
            return this.__DcWakeSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    S4AcWakeSupported{
        get {
            if(!this.HasProp("__S4AcWakeSupported"))
                this.__S4AcWakeSupported := BOOLEAN(this.ptr + 2)
            return this.__S4AcWakeSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    S4DcWakeSupported{
        get {
            if(!this.HasProp("__S4DcWakeSupported"))
                this.__S4DcWakeSupported := BOOLEAN(this.ptr + 3)
            return this.__S4DcWakeSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    S5AcWakeSupported{
        get {
            if(!this.HasProp("__S5AcWakeSupported"))
                this.__S5AcWakeSupported := BOOLEAN(this.ptr + 4)
            return this.__S5AcWakeSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    S5DcWakeSupported{
        get {
            if(!this.HasProp("__S5DcWakeSupported"))
                this.__S5DcWakeSupported := BOOLEAN(this.ptr + 5)
            return this.__S5DcWakeSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    S4S5WakeStatusSupported{
        get {
            if(!this.HasProp("__S4S5WakeStatusSupported"))
                this.__S4S5WakeStatusSupported := BOOLEAN(this.ptr + 6)
            return this.__S4S5WakeStatusSupported
        }
    }

    /**
     * @type {Integer}
     */
    DeepestWakeSystemState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    RealTimeFeaturesSupported{
        get {
            if(!this.HasProp("__RealTimeFeaturesSupported"))
                this.__RealTimeFeaturesSupported := BOOLEAN(this.ptr + 12)
            return this.__RealTimeFeaturesSupported
        }
    }

    /**
     * @type {Integer}
     */
    RealTimeResolution {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}

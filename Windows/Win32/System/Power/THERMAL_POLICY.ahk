#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class THERMAL_POLICY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    WaitForUpdate{
        get {
            if(!this.HasProp("__WaitForUpdate"))
                this.__WaitForUpdate := BOOLEAN(this.ptr + 4)
            return this.__WaitForUpdate
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Hibernate{
        get {
            if(!this.HasProp("__Hibernate"))
                this.__Hibernate := BOOLEAN(this.ptr + 5)
            return this.__Hibernate
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Critical{
        get {
            if(!this.HasProp("__Critical"))
                this.__Critical := BOOLEAN(this.ptr + 6)
            return this.__Critical
        }
    }

    /**
     * @type {BOOLEAN}
     */
    ThermalStandby{
        get {
            if(!this.HasProp("__ThermalStandby"))
                this.__ThermalStandby := BOOLEAN(this.ptr + 7)
            return this.__ThermalStandby
        }
    }

    /**
     * @type {Integer}
     */
    ActivationReasons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PassiveLimit {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ActiveLevel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOLEAN}
     */
    OverThrottled{
        get {
            if(!this.HasProp("__OverThrottled"))
                this.__OverThrottled := BOOLEAN(this.ptr + 20)
            return this.__OverThrottled
        }
    }
}

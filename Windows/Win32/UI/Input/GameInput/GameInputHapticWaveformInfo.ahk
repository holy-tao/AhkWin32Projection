#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputUsage.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputHapticWaveformInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {GameInputUsage}
     */
    usage{
        get {
            if(!this.HasProp("__usage"))
                this.__usage := GameInputUsage(0, this)
            return this.__usage
        }
    }

    /**
     * @type {Integer}
     */
    isDurationSupported {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    isIntensitySupported {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    isRepeatSupported {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    isRepeatDelaySupported {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Integer}
     */
    defaultDuration {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

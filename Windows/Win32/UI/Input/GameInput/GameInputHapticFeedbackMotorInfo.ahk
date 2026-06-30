#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputHapticWaveformInfo.ahk
#Include .\GameInputRumbleMotors.ahk
#Include .\GameInputLocation.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputHapticFeedbackMotorInfo extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {GameInputRumbleMotors}
     */
    mappedRumbleMotors {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {GameInputLocation}
     */
    location {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    locationId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    waveformCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<GameInputHapticWaveformInfo>}
     */
    waveformInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

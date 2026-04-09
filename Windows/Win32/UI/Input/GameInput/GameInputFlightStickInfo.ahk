#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputLabel.ahk
#Include .\GameInputSwitchKind.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputFlightStickInfo extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {GameInputLabel}
     */
    menuButtonLabel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {GameInputLabel}
     */
    viewButtonLabel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {GameInputLabel}
     */
    firePrimaryButtonLabel {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {GameInputLabel}
     */
    fireSecondaryButtonLabel {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {GameInputSwitchKind}
     */
    hatSwitchKind {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputLabel.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputGamepadInfo extends Win32Struct {
    static sizeof => 56

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
    aButtonLabel {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {GameInputLabel}
     */
    bButtonLabel {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {GameInputLabel}
     */
    xButtonLabel {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {GameInputLabel}
     */
    yButtonLabel {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {GameInputLabel}
     */
    dpadUpLabel {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {GameInputLabel}
     */
    dpadDownLabel {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {GameInputLabel}
     */
    dpadLeftLabel {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {GameInputLabel}
     */
    dpadRightLabel {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {GameInputLabel}
     */
    leftShoulderButtonLabel {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {GameInputLabel}
     */
    rightShoulderButtonLabel {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {GameInputLabel}
     */
    leftThumbstickButtonLabel {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {GameInputLabel}
     */
    rightThumbstickButtonLabel {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}

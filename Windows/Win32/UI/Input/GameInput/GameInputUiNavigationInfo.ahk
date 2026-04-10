#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputLabel.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputUiNavigationInfo extends Win32Struct {
    static sizeof => 84

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
    acceptButtonLabel {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {GameInputLabel}
     */
    cancelButtonLabel {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {GameInputLabel}
     */
    upButtonLabel {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {GameInputLabel}
     */
    downButtonLabel {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {GameInputLabel}
     */
    leftButtonLabel {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {GameInputLabel}
     */
    rightButtonLabel {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {GameInputLabel}
     */
    contextButton1Label {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {GameInputLabel}
     */
    contextButton2Label {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {GameInputLabel}
     */
    contextButton3Label {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {GameInputLabel}
     */
    contextButton4Label {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {GameInputLabel}
     */
    pageUpButtonLabel {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {GameInputLabel}
     */
    pageDownButtonLabel {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {GameInputLabel}
     */
    pageLeftButtonLabel {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {GameInputLabel}
     */
    pageRightButtonLabel {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {GameInputLabel}
     */
    scrollUpButtonLabel {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {GameInputLabel}
     */
    scrollDownButtonLabel {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {GameInputLabel}
     */
    scrollLeftButtonLabel {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {GameInputLabel}
     */
    scrollRightButtonLabel {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {GameInputLabel}
     */
    guideButtonLabel {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}

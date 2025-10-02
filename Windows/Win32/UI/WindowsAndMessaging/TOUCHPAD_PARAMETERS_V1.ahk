#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TOUCHPAD_PARAMETERS_V1 extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {Integer}
     */
    versionNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    maxSupportedContacts {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    legacyTouchpadFeatures {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * This bitfield backs the following members:
     * - touchpadPresent
     * - legacyTouchpadPresent
     * - externalMousePresent
     * - touchpadEnabled
     * - touchpadActive
     * - feedbackSupported
     * - clickForceSupported
     * - Reserved1
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    touchpadPresent {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    legacyTouchpadPresent {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    externalMousePresent {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    touchpadEnabled {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    touchpadActive {
        get => (this._bitfield1 >> 4) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 4) | (this._bitfield1 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    feedbackSupported {
        get => (this._bitfield1 >> 5) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 5) | (this._bitfield1 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    clickForceSupported {
        get => (this._bitfield1 >> 6) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 6) | (this._bitfield1 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield1 >> 7) & 0x1FFFFFF
        set => this._bitfield1 := ((value & 0x1FFFFFF) << 7) | (this._bitfield1 & ~(0x1FFFFFF << 7))
    }

    /**
     * This bitfield backs the following members:
     * - allowActiveWhenMousePresent
     * - feedbackEnabled
     * - tapEnabled
     * - tapAndDragEnabled
     * - twoFingerTapEnabled
     * - rightClickZoneEnabled
     * - mouseAccelSettingHonored
     * - panEnabled
     * - zoomEnabled
     * - scrollDirectionReversed
     * - Reserved2
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    allowActiveWhenMousePresent {
        get => (this._bitfield2 >> 0) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 0) | (this._bitfield2 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    feedbackEnabled {
        get => (this._bitfield2 >> 1) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 1) | (this._bitfield2 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    tapEnabled {
        get => (this._bitfield2 >> 2) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 2) | (this._bitfield2 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    tapAndDragEnabled {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    twoFingerTapEnabled {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    rightClickZoneEnabled {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    mouseAccelSettingHonored {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    panEnabled {
        get => (this._bitfield2 >> 7) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 7) | (this._bitfield2 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    zoomEnabled {
        get => (this._bitfield2 >> 8) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 8) | (this._bitfield2 & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    scrollDirectionReversed {
        get => (this._bitfield2 >> 9) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 9) | (this._bitfield2 & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield2 >> 10) & 0x3FFFFF
        set => this._bitfield2 := ((value & 0x3FFFFF) << 10) | (this._bitfield2 & ~(0x3FFFFF << 10))
    }

    /**
     * @type {Integer}
     */
    sensitivityLevel {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cursorSpeed {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    feedbackIntensity {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    clickForceSensitivity {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    rightClickZoneWidth {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    rightClickZoneHeight {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

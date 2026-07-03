#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LEGACY_TOUCHPAD_FEATURES.ahk" { LEGACY_TOUCHPAD_FEATURES }
#Import ".\TOUCHPAD_SENSITIVITY_LEVEL.ahk" { TOUCHPAD_SENSITIVITY_LEVEL }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TOUCHPAD_PARAMETERS_V1 {
    #StructPack 4

    versionNumber : UInt32

    maxSupportedContacts : UInt32

    legacyTouchpadFeatures : LEGACY_TOUCHPAD_FEATURES

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
     */
    _bitfield1 : Int32


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
     */
    _bitfield2 : Int32


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
    sensitivityLevel : TOUCHPAD_SENSITIVITY_LEVEL

    cursorSpeed : UInt32

    feedbackIntensity : UInt32

    clickForceSensitivity : UInt32

    rightClickZoneWidth : UInt32

    rightClickZoneHeight : UInt32

}

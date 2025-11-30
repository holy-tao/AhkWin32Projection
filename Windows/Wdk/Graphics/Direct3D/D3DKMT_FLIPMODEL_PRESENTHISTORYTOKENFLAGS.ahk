#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_FLIPMODEL_PRESENTHISTORYTOKENFLAGS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Video
     * - RestrictedContent
     * - ClipToView
     * - StereoPreferRight
     * - TemporaryMono
     * - FlipRestart
     * - HDRMetaDataChanged
     * - AlphaMode
     * - SignalLimitOnTokenCompletion
     * - YCbCrFlags
     * - IndependentFlip
     * - IndependentFlipStage
     * - IndependentFlipReleaseCount
     * - IndependentFlipForceNotifyDwm
     * - UseCustomDuration
     * - IndependentFlipRequestDwmConfirm
     * - IndependentFlipCandidate
     * - IndependentFlipCheckNeeded
     * - IndependentFlipTrueImmediate
     * - IndependentFlipRequestDwmExit
     * - CompSurfaceNotifiedEarly
     * - IndependentFlipDoNotFlip
     * - RequirePairedToken
     * - VariableRefreshOverrideEligible
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Video {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    RestrictedContent {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ClipToView {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    StereoPreferRight {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    TemporaryMono {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    FlipRestart {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    HDRMetaDataChanged {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    AlphaMode {
        get => (this._bitfield >> 7) & 0x3
        set => this._bitfield := ((value & 0x3) << 7) | (this._bitfield & ~(0x3 << 7))
    }

    /**
     * @type {Integer}
     */
    SignalLimitOnTokenCompletion {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    YCbCrFlags {
        get => (this._bitfield >> 10) & 0x7
        set => this._bitfield := ((value & 0x7) << 10) | (this._bitfield & ~(0x7 << 10))
    }

    /**
     * @type {Integer}
     */
    IndependentFlip {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipStage {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipReleaseCount {
        get => (this._bitfield >> 16) & 0x3
        set => this._bitfield := ((value & 0x3) << 16) | (this._bitfield & ~(0x3 << 16))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipForceNotifyDwm {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    UseCustomDuration {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipRequestDwmConfirm {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipCandidate {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipCheckNeeded {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipTrueImmediate {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipRequestDwmExit {
        get => (this._bitfield >> 24) & 0x1
        set => this._bitfield := ((value & 0x1) << 24) | (this._bitfield & ~(0x1 << 24))
    }

    /**
     * @type {Integer}
     */
    CompSurfaceNotifiedEarly {
        get => (this._bitfield >> 25) & 0x1
        set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
    }

    /**
     * @type {Integer}
     */
    IndependentFlipDoNotFlip {
        get => (this._bitfield >> 26) & 0x1
        set => this._bitfield := ((value & 0x1) << 26) | (this._bitfield & ~(0x1 << 26))
    }

    /**
     * @type {Integer}
     */
    RequirePairedToken {
        get => (this._bitfield >> 27) & 0x1
        set => this._bitfield := ((value & 0x1) << 27) | (this._bitfield & ~(0x1 << 27))
    }

    /**
     * @type {Integer}
     */
    VariableRefreshOverrideEligible {
        get => (this._bitfield >> 28) & 0x1
        set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

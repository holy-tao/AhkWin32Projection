#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_MOTION_SEARCH extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO}
     */
    SessionInfo{
        get {
            if(!this.HasProp("__SessionInfo"))
                this.__SessionInfo := D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO(this.ptr + 8)
            return this.__SessionInfo
        }
    }

    /**
     * @type {Integer}
     */
    MotionSearchMode {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    MapSource {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    BidirectionalRefFrameEnabled {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    MaxMotionHints {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    MinDeviation {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    MaxDeviation {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    MapSourcePreferenceRanking {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    MotionUnitPrecisionSupport {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }
}

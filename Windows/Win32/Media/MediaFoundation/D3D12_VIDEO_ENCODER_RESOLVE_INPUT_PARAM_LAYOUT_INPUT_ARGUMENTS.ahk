#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_QUANTIZATION_MATRIX.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_DIRTY_REGIONS.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_MOTION_VECTORS.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_DATA.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_INPUT_ARGUMENTS extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO}
     */
    SessionInfo{
        get {
            if(!this.HasProp("__SessionInfo"))
                this.__SessionInfo := D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO(this.ptr + 0)
            return this.__SessionInfo
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_DATA}
     */
    InputData{
        get {
            if(!this.HasProp("__InputData"))
                this.__InputData := D3D12_VIDEO_ENCODER_INPUT_MAP_DATA(this.ptr + 96)
            return this.__InputData
        }
    }
}

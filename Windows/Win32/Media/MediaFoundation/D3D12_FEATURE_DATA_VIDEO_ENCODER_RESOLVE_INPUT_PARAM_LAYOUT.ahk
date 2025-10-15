#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SESSION_INFO.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT extends Win32Struct
{
    static sizeof => 120

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
    MapType {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {BOOL}
     */
    IsSupported{
        get {
            if(!this.HasProp("__IsSupported"))
                this.__IsSupported := BOOL(this.ptr + 108)
            return this.__IsSupported
        }
    }

    /**
     * @type {Integer}
     */
    MaxResolvedBufferAllocationSize {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}

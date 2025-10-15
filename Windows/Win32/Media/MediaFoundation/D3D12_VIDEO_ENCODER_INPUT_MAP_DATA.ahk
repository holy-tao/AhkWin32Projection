#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_QUANTIZATION_MATRIX.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_DIRTY_REGIONS.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_MOTION_VECTORS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_INPUT_MAP_DATA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MapType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_QUANTIZATION_MATRIX}
     */
    Quantization{
        get {
            if(!this.HasProp("__Quantization"))
                this.__Quantization := D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_QUANTIZATION_MATRIX(this.ptr + 8)
            return this.__Quantization
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_DIRTY_REGIONS}
     */
    DirtyRegions{
        get {
            if(!this.HasProp("__DirtyRegions"))
                this.__DirtyRegions := D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_DIRTY_REGIONS(this.ptr + 8)
            return this.__DirtyRegions
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_MOTION_VECTORS}
     */
    MotionVectors{
        get {
            if(!this.HasProp("__MotionVectors"))
                this.__MotionVectors := D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_MOTION_VECTORS(this.ptr + 8)
            return this.__MotionVectors
        }
    }
}

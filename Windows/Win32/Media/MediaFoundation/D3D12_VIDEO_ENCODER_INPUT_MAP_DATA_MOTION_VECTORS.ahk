#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_MOTION_VECTORS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG}
     */
    MotionSearchModeConfiguration{
        get {
            if(!this.HasProp("__MotionSearchModeConfiguration"))
                this.__MotionSearchModeConfiguration := D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG(0, this)
            return this.__MotionSearchModeConfiguration
        }
    }

    /**
     * @type {Integer}
     */
    NumHintsPerPixel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    ppMotionVectorMaps {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pMotionVectorMapsSubresources {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    ppMotionVectorMapsMetadata {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pMotionVectorMapsMetadataSubresources {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    MotionUnitPrecision {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1}
     */
    PictureControlConfiguration{
        get {
            if(!this.HasProp("__PictureControlConfiguration"))
                this.__PictureControlConfiguration := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1(56, this)
            return this.__PictureControlConfiguration
        }
    }
}

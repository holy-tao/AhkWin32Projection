#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1.ahk
#Include .\D3D12_VIDEO_ENCODE_REFERENCE_FRAMES.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_MOTION_VECTORS.ahk
#Include .\D3D12_VIDEO_ENCODER_DIRTY_REGIONS.ahk
#Include .\D3D12_VIDEO_ENCODER_QUANTIZATION_OPAQUE_MAP.ahk
#Include .\D3D12_VIDEO_ENCODER_FRAME_ANALYSIS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC1 extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Integer}
     */
    IntraRefreshFrameIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1}
     */
    PictureControlCodecData{
        get {
            if(!this.HasProp("__PictureControlCodecData"))
                this.__PictureControlCodecData := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA1(8, this)
            return this.__PictureControlCodecData
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODE_REFERENCE_FRAMES}
     */
    ReferenceFrames{
        get {
            if(!this.HasProp("__ReferenceFrames"))
                this.__ReferenceFrames := D3D12_VIDEO_ENCODE_REFERENCE_FRAMES(24, this)
            return this.__ReferenceFrames
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_MOTION_VECTORS}
     */
    MotionVectors{
        get {
            if(!this.HasProp("__MotionVectors"))
                this.__MotionVectors := D3D12_VIDEO_ENCODER_FRAME_MOTION_VECTORS(48, this)
            return this.__MotionVectors
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_DIRTY_REGIONS}
     */
    DirtyRects{
        get {
            if(!this.HasProp("__DirtyRects"))
                this.__DirtyRects := D3D12_VIDEO_ENCODER_DIRTY_REGIONS(64, this)
            return this.__DirtyRects
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_QUANTIZATION_OPAQUE_MAP}
     */
    QuantizationTextureMap{
        get {
            if(!this.HasProp("__QuantizationTextureMap"))
                this.__QuantizationTextureMap := D3D12_VIDEO_ENCODER_QUANTIZATION_OPAQUE_MAP(80, this)
            return this.__QuantizationTextureMap
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_FRAME_ANALYSIS}
     */
    FrameAnalysis{
        get {
            if(!this.HasProp("__FrameAnalysis"))
                this.__FrameAnalysis := D3D12_VIDEO_ENCODER_FRAME_ANALYSIS(88, this)
            return this.__FrameAnalysis
        }
    }
}

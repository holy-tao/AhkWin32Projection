#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVELS_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_LEVEL_TIER_CONSTRAINTS.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_H264.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_HEAP_DESC1.ahk
#Include .\D3D12_VIDEO_ENCODER_HEAP_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PROFILE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_HEAP_SIZE1 extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_HEAP_DESC1}
     */
    HeapDesc {
        get {
            if(!this.HasProp("__HeapDesc"))
                this.__HeapDesc := D3D12_VIDEO_ENCODER_HEAP_DESC1(0, this)
            return this.__HeapDesc
        }
    }

    /**
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    MemoryPoolL0Size {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    MemoryPoolL1Size {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}

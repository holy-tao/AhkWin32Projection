#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Codec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ResolutionRatiosCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    IsSupported{
        get {
            if(!this.HasProp("__IsSupported"))
                this.__IsSupported := BOOL(this.ptr + 12)
            return this.__IsSupported
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    MinResolutionSupported{
        get {
            if(!this.HasProp("__MinResolutionSupported"))
                this.__MinResolutionSupported := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(this.ptr + 16)
            return this.__MinResolutionSupported
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC}
     */
    MaxResolutionSupported{
        get {
            if(!this.HasProp("__MaxResolutionSupported"))
                this.__MaxResolutionSupported := D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC(this.ptr + 24)
            return this.__MaxResolutionSupported
        }
    }

    /**
     * @type {Integer}
     */
    ResolutionWidthMultipleRequirement {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ResolutionHeightMultipleRequirement {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC>}
     */
    pResolutionRatios {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

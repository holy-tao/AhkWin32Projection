#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT extends Win32Struct
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
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    Profile{
        get {
            if(!this.HasProp("__Profile"))
                this.__Profile := D3D12_VIDEO_ENCODER_PROFILE_DESC(this.ptr + 8)
            return this.__Profile
        }
    }

    /**
     * @type {BOOL}
     */
    IsSupported{
        get {
            if(!this.HasProp("__IsSupported"))
                this.__IsSupported := BOOL(this.ptr + 24)
            return this.__IsSupported
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT}
     */
    CodecSupportLimits{
        get {
            if(!this.HasProp("__CodecSupportLimits"))
                this.__CodecSupportLimits := D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT(this.ptr + 32)
            return this.__CodecSupportLimits
        }
    }
}

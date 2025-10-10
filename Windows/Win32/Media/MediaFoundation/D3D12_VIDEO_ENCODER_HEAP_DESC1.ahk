#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_HEAP_DESC1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeMask {
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
     * @type {Integer}
     */
    EncodeCodec {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PROFILE_DESC}
     */
    EncodeProfile{
        get {
            if(!this.HasProp("__EncodeProfile"))
                this.__EncodeProfile := D3D12_VIDEO_ENCODER_PROFILE_DESC(this.ptr + 16)
            return this.__EncodeProfile
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    EncodeLevel{
        get {
            if(!this.HasProp("__EncodeLevel"))
                this.__EncodeLevel := D3D12_VIDEO_ENCODER_LEVEL_SETTING(this.ptr + 32)
            return this.__EncodeLevel
        }
    }

    /**
     * @type {Integer}
     */
    ResolutionsListCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC>}
     */
    pResolutionList {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Pow2DownscaleFactor {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}

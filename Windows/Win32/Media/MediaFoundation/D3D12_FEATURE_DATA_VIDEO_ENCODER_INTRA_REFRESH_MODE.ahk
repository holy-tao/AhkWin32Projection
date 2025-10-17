#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_INTRA_REFRESH_MODE extends Win32Struct
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
                this.__Profile := D3D12_VIDEO_ENCODER_PROFILE_DESC(8, this)
            return this.__Profile
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_LEVEL_SETTING}
     */
    Level{
        get {
            if(!this.HasProp("__Level"))
                this.__Level := D3D12_VIDEO_ENCODER_LEVEL_SETTING(24, this)
            return this.__Level
        }
    }

    /**
     * @type {Integer}
     */
    IntraRefreshMode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    IsSupported {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}

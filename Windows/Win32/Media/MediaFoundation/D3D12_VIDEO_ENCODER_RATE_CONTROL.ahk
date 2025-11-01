#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS}
     */
    ConfigParams{
        get {
            if(!this.HasProp("__ConfigParams"))
                this.__ConfigParams := D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS(8, this)
            return this.__ConfigParams
        }
    }

    /**
     * @type {DXGI_RATIONAL}
     */
    TargetFrameRate{
        get {
            if(!this.HasProp("__TargetFrameRate"))
                this.__TargetFrameRate := DXGI_RATIONAL(24, this)
            return this.__TargetFrameRate
        }
    }
}

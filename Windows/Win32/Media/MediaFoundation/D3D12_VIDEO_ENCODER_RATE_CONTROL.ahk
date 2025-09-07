#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Represents a video encoder rate control configuration.
 * @remarks
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
     * A value from the [D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE](ne-d3d12video-d3d12_video_encoder_rate_control_mode.md) enumeration specifying the rate control mode.
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) enumeration.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS](ns-d3d12video-d3d12_video_encoder_rate_control_configuration_params.md) structure representing rate control configuration parameters corresponding to the specified *Mode*. Note that for absolute QP matrix mode, the configuration arguments are provided per EncodeFrame basis.
     * 
     * If the selected rate control mode is **D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_ABSOLUTE_QP_MAP**, the QP values in *pRateControlQPMap* are treated as absolute QP values.
     * 
     * For the other rate control modes,  the QP values in *pRateControlQPMap* are interpreted as a delta QP map to be used for the current frame encode operation. The values provided in the map are incremented/decremented on top of the QP values decided by the rate control algorithm or the baseline QP constant set in CQP mode.
     * @type {D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS}
     */
    ConfigParams{
        get {
            if(!this.HasProp("__ConfigParams"))
                this.__ConfigParams := D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS(this.ptr + 8)
            return this.__ConfigParams
        }
    }

    /**
     * A [DXGI_RATIONAL](/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_rational) specifying the target frame rate for the encoded stream. This value is a hint for the rate control budgeting algorithm.
     * @type {DXGI_RATIONAL}
     */
    TargetFrameRate{
        get {
            if(!this.HasProp("__TargetFrameRate"))
                this.__TargetFrameRate := DXGI_RATIONAL(this.ptr + 24)
            return this.__TargetFrameRate
        }
    }
}

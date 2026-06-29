#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1 }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1 }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1 }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1 }

/**
 * Represents a video encoder rate control configuration.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RATE_CONTROL {
    #StructPack 8

    /**
     * A value from the [D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE](ne-d3d12video-d3d12_video_encoder_rate_control_mode.md) enumeration specifying the rate control mode.
     */
    Mode : D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) enumeration.
     */
    Flags : D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS

    /**
     * A [D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS](ns-d3d12video-d3d12_video_encoder_rate_control_configuration_params.md) structure representing rate control configuration parameters corresponding to the specified *Mode*. Note that for absolute QP matrix mode, the configuration arguments are provided per EncodeFrame basis.
     * 
     * If the selected rate control mode is **D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_ABSOLUTE_QP_MAP**, the QP values in *pRateControlQPMap* are treated as absolute QP values.
     * 
     * For the other rate control modes,  the QP values in *pRateControlQPMap* are interpreted as a delta QP map to be used for the current frame encode operation. The values provided in the map are incremented/decremented on top of the QP values decided by the rate control algorithm or the baseline QP constant set in CQP mode.
     */
    ConfigParams : D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS

    /**
     * A [DXGI_RATIONAL](/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_rational) specifying the target frame rate for the encoded stream. This value is a hint for the rate control budgeting algorithm.
     */
    TargetFrameRate : DXGI_RATIONAL

}

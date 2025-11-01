#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control_configuration_params
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP>}
     */
    pConfiguration_CQP {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR>}
     */
    pConfiguration_CBR {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR>}
     */
    pConfiguration_VBR {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR>}
     */
    pConfiguration_QVBR {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1>}
     */
    pConfiguration_CQP1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1>}
     */
    pConfiguration_CBR1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1>}
     */
    pConfiguration_VBR1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1>}
     */
    pConfiguration_QVBR1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP>}
     */
    pConfiguration_AbsoluteQPMap {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

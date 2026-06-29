#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1 }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1 }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1 }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR }
#Import ".\D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1.ahk" { D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1 }

/**
 * Represents video encoder rate control structure definitions for a D3D12_VIDEO_ENCODER_RATE_CONTROL structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control_configuration_params
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS {
    #StructPack 8

    /**
     * The data size of the provided rate control structure.
     */
    DataSize : UInt32

    pConfiguration_CQP : D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pConfiguration_CBR', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pConfiguration_VBR', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pConfiguration_QVBR', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pConfiguration_CQP1', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP1.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pConfiguration_CBR1', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR1.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pConfiguration_VBR1', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pConfiguration_QVBR1', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR1.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pConfiguration_AbsoluteQPMap', { type: D3D12_VIDEO_ENCODER_RATE_CONTROL_ABSOLUTE_QP_MAP.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}

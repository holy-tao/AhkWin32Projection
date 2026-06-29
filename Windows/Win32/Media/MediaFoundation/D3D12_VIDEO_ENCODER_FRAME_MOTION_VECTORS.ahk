#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_MOVEREGION_INFO.ahk" { D3D12_VIDEO_ENCODER_MOVEREGION_INFO }
#Import ".\D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE.ahk" { D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_FRAME_MOTION_VECTORS {
    #StructPack 8

    MapSource : D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE

    pOpaqueLayoutBuffer : ID3D12Resource

    static __New() {
        DefineProp(this.Prototype, 'pCPUBuffer', { type: D3D12_VIDEO_ENCODER_MOVEREGION_INFO.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}

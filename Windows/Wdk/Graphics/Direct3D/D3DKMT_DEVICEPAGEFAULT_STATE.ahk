#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGK_PAGE_FAULT_FLAGS.ahk" { DXGK_PAGE_FAULT_FLAGS }
#Import ".\DXGK_RENDER_PIPELINE_STAGE.ahk" { DXGK_RENDER_PIPELINE_STAGE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DEVICEPAGEFAULT_STATE {
    #StructPack 8

    FaultedPrimitiveAPISequenceNumber : Int64

    FaultedPipelineStage : DXGK_RENDER_PIPELINE_STAGE

    FaultedBindTableEntry : UInt32

    PageFaultFlags : DXGK_PAGE_FAULT_FLAGS

    FaultErrorCode : IntPtr

    FaultedVirtualAddress : Int64

}

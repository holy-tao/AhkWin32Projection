#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList3.ahk

/**
 * Encapsulates a list of graphics commands for rendering, extending the interface to support ray tracing and render passes.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12graphicscommandlist4
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList4 extends ID3D12GraphicsCommandList3{
    /**
     * The interface identifier for ID3D12GraphicsCommandList4
     * @type {Guid}
     */
    static IID => Guid("{8754318e-d3a9-4541-98cf-645b50dc4874}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 68

    /**
     * 
     * @param {Integer} NumRenderTargets 
     * @param {Pointer<D3D12_RENDER_PASS_RENDER_TARGET_DESC>} pRenderTargets 
     * @param {Pointer<D3D12_RENDER_PASS_DEPTH_STENCIL_DESC>} pDepthStencil 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginRenderPass(NumRenderTargets, pRenderTargets, pDepthStencil, Flags) {
        ComCall(68, this, "uint", NumRenderTargets, "ptr", pRenderTargets, "ptr", pDepthStencil, "int", Flags)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EndRenderPass() {
        ComCall(69, this)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12MetaCommand>} pMetaCommand 
     * @param {Pointer} pInitializationParametersData 
     * @param {Pointer} InitializationParametersDataSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    InitializeMetaCommand(pMetaCommand, pInitializationParametersData, InitializationParametersDataSizeInBytes) {
        ComCall(70, this, "ptr", pMetaCommand, "ptr", pInitializationParametersData, "ptr", InitializationParametersDataSizeInBytes)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12MetaCommand>} pMetaCommand 
     * @param {Pointer} pExecutionParametersData 
     * @param {Pointer} ExecutionParametersDataSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    ExecuteMetaCommand(pMetaCommand, pExecutionParametersData, ExecutionParametersDataSizeInBytes) {
        ComCall(71, this, "ptr", pMetaCommand, "ptr", pExecutionParametersData, "ptr", ExecutionParametersDataSizeInBytes)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_DESC>} pDesc 
     * @param {Integer} NumPostbuildInfoDescs 
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC>} pPostbuildInfoDescs 
     * @returns {String} Nothing - always returns an empty string
     */
    BuildRaytracingAccelerationStructure(pDesc, NumPostbuildInfoDescs, pPostbuildInfoDescs) {
        ComCall(72, this, "ptr", pDesc, "uint", NumPostbuildInfoDescs, "ptr", pPostbuildInfoDescs)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC>} pDesc 
     * @param {Integer} NumSourceAccelerationStructures 
     * @param {Pointer<UInt64>} pSourceAccelerationStructureData 
     * @returns {String} Nothing - always returns an empty string
     */
    EmitRaytracingAccelerationStructurePostbuildInfo(pDesc, NumSourceAccelerationStructures, pSourceAccelerationStructureData) {
        ComCall(73, this, "ptr", pDesc, "uint", NumSourceAccelerationStructures, "uint*", pSourceAccelerationStructureData)
        return result
    }

    /**
     * 
     * @param {Integer} DestAccelerationStructureData 
     * @param {Integer} SourceAccelerationStructureData 
     * @param {Integer} Mode 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyRaytracingAccelerationStructure(DestAccelerationStructureData, SourceAccelerationStructureData, Mode) {
        ComCall(74, this, "uint", DestAccelerationStructureData, "uint", SourceAccelerationStructureData, "int", Mode)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12StateObject>} pStateObject 
     * @returns {String} Nothing - always returns an empty string
     */
    SetPipelineState1(pStateObject) {
        ComCall(75, this, "ptr", pStateObject)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_DISPATCH_RAYS_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    DispatchRays(pDesc) {
        ComCall(76, this, "ptr", pDesc)
        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginRenderPass", "EndRenderPass", "InitializeMetaCommand", "ExecuteMetaCommand", "BuildRaytracingAccelerationStructure", "EmitRaytracingAccelerationStructurePostbuildInfo", "CopyRaytracingAccelerationStructure", "SetPipelineState1", "DispatchRays"]

    /**
     * Marks the beginning of a render pass by binding a set of output resources for the duration of the render pass. These bindings are to one or more render target views (RTVs), and/or to a depth stencil view (DSV).
     * @param {Integer} NumRenderTargets A <b>UINT</b>. The number of render targets being bound.
     * @param {Pointer<D3D12_RENDER_PASS_RENDER_TARGET_DESC>} pRenderTargets A pointer to a constant <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_render_target_desc">D3D12_RENDER_PASS_RENDER_TARGET_DESC</a>, which describes bindings (fixed for the duration of the render pass) to one or more render target views (RTVs), as well as their beginning and ending access characteristics.
     * @param {Pointer<D3D12_RENDER_PASS_DEPTH_STENCIL_DESC>} pDepthStencil A pointer to a constant <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_depth_stencil_desc">D3D12_RENDER_PASS_DEPTH_STENCIL_DESC</a>, which describes a binding (fixed for the duration of the render pass) to a depth stencil view (DSV), as well as its beginning and ending access characteristics.
     * @param {Integer} Flags A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_flags">D3D12_RENDER_PASS_FLAGS</a>. The nature/requirements of the render pass; for example, whether it is a suspending or a resuming render pass, or whether it wants to write to unordered access view(s).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-beginrenderpass
     */
    BeginRenderPass(NumRenderTargets, pRenderTargets, pDepthStencil, Flags) {
        ComCall(68, this, "uint", NumRenderTargets, "ptr", pRenderTargets, "ptr", pDepthStencil, "int", Flags)
    }

    /**
     * Marks the ending of a render pass.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-endrenderpass
     */
    EndRenderPass() {
        ComCall(69, this)
    }

    /**
     * Initializes the specified meta command.
     * @param {ID3D12MetaCommand} pMetaCommand A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12metacommand">ID3D12MetaCommand</a> representing the meta command to initialize.
     * @param {Pointer} pInitializationParametersData An optional pointer to a constant structure containing the values of the parameters for initializing the meta command.
     * @param {Pointer} InitializationParametersDataSizeInBytes A <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a> containing the size of the structure pointed to by <i>pInitializationParametersData</i>, if set, otherwise 0.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-initializemetacommand
     */
    InitializeMetaCommand(pMetaCommand, pInitializationParametersData, InitializationParametersDataSizeInBytes) {
        ComCall(70, this, "ptr", pMetaCommand, "ptr", pInitializationParametersData, "ptr", InitializationParametersDataSizeInBytes)
    }

    /**
     * Records the execution (or invocation) of the specified meta command into a graphics command list.
     * @param {ID3D12MetaCommand} pMetaCommand A pointer to an <b>ID3D12MetaCommand</b> representing the meta command to initialize.
     * @param {Pointer} pExecutionParametersData An optional pointer to a constant structure containing the values of the parameters for executing the meta command.
     * @param {Pointer} ExecutionParametersDataSizeInBytes A <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a> containing the size of the structure pointed to by <i>pExecutionParametersData</i>, if set, otherwise 0.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-executemetacommand
     */
    ExecuteMetaCommand(pMetaCommand, pExecutionParametersData, ExecutionParametersDataSizeInBytes) {
        ComCall(71, this, "ptr", pMetaCommand, "ptr", pExecutionParametersData, "ptr", ExecutionParametersDataSizeInBytes)
    }

    /**
     * Performs a raytracing acceleration structure build on the GPU and optionally outputs post-build information immediately after the build.
     * @remarks
     * 
     * This method can be called on graphics or compute command lists but not from bundles.
     * 
     * Post-build information can also be obtained separately from an already built acceleration structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist4-emitraytracingaccelerationstructurepostbuildinfo">EmitRaytracingAccelerationStructurePostbuildInfo</a>.  The advantage of generating post-build info along with a build is that a barrier isn’t needed in between the build completing and requesting post-build information, enabling scenarios where the app needs the post-build info right away.
     * 
     * 
     * @param {Pointer<D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_DESC>} pDesc Description of the acceleration structure to build.
     * @param {Integer} NumPostbuildInfoDescs Size of the <i>pPostbuildInfoDescs</i> array.  Set to 0 if no post-build info is needed.
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC>} pPostbuildInfoDescs Optional array of descriptions for post-build info to generate describing properties of the acceleration structure that was built.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-buildraytracingaccelerationstructure
     */
    BuildRaytracingAccelerationStructure(pDesc, NumPostbuildInfoDescs, pPostbuildInfoDescs) {
        ComCall(72, this, "ptr", pDesc, "uint", NumPostbuildInfoDescs, "ptr", pPostbuildInfoDescs)
    }

    /**
     * Emits post-build properties for a set of acceleration structures. This enables applications to know the output resource requirements for performing acceleration structure operations via ID3D12GraphicsCommandList4::CopyRaytracingAccelerationStructure.
     * @remarks
     * 
     * This method can be called from graphics or compute command lists but not from bundles.
     * 
     * 
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC>} pDesc Description of pos-tbuild information to generate.
     * @param {Integer} NumSourceAccelerationStructures Number of pointers to acceleration structure GPU virtual addresses pointed to by <i>pSourceAccelerationStructureData</i>.  This number also affects the destination (output), which will be a contiguous array of <b>NumSourceAccelerationStructures</b> output structures, where the type of the structures depends on <i>InfoType</i> field of the supplied in the <i>pDesc</i> description.
     * @param {Pointer<Integer>} pSourceAccelerationStructureData Pointer to array of GPU virtual addresses of size <i>NumSourceAccelerationStructures</i>.
     * 
     * The address must be aligned to 256 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT</a>. 
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-emitraytracingaccelerationstructurepostbuildinfo
     */
    EmitRaytracingAccelerationStructurePostbuildInfo(pDesc, NumSourceAccelerationStructures, pSourceAccelerationStructureData) {
        pSourceAccelerationStructureDataMarshal := pSourceAccelerationStructureData is VarRef ? "uint*" : "ptr"

        ComCall(73, this, "ptr", pDesc, "uint", NumSourceAccelerationStructures, pSourceAccelerationStructureDataMarshal, pSourceAccelerationStructureData)
    }

    /**
     * Copies a source acceleration structure to destination memory while applying the specified transformation.
     * @remarks
     * 
     * Since raytracing acceleration structures may contain internal pointers and have a device dependent opaque layout, copying them around or otherwise manipulating them requires a dedicated API so that drivers can handle the requested operation.
     * 
     * This method can be called from graphics or compute command lists but not from bundles.
     * 
     * 
     * @param {Integer} DestAccelerationStructureData The destination memory. The required size can be discovered by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist4-emitraytracingaccelerationstructurepostbuildinfo">EmitRaytracingAccelerationStructurePostbuildInfo</a> beforehand, if necessary for the specified <i>Mode</i>.  
     * 
     * The destination start address must be aligned to 256 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT</a>, regardless of the specified <i>Mode</i>. 
     * 
     * The destination memory range cannot overlap source. Otherwise, results are undefined.  
     * 
     * The resource state that the memory pointed to must be in depends on the <i>Mode</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_copy_mode">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE</a>.
     * @param {Integer} SourceAccelerationStructureData The address of the acceleration structure or other type of data to copy/transform based on the specified <i>Mode</i>.  The data remains unchanged and usable.  The operation only copies the data  pointed to by <i>SourceAccelerationStructureData</i> and not any other data, such as acceleration structures, that the source data may point to.  For example, in the case of a top-level acceleration structure, any bottom-level acceleration structures that it points to are not copied in the operation.
     * 
     * The source memory must be aligned to 256 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT</a>, regardless of the specified <i>Mode</i>. 
     * 
     * The resource state that the memory pointed to must be in depends on the <i>Mode</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_copy_mode">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE</a>.
     * @param {Integer} Mode The type of copy operation to perform. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_copy_mode">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-copyraytracingaccelerationstructure
     */
    CopyRaytracingAccelerationStructure(DestAccelerationStructureData, SourceAccelerationStructureData, Mode) {
        ComCall(74, this, "uint", DestAccelerationStructureData, "uint", SourceAccelerationStructureData, "int", Mode)
    }

    /**
     * Sets a state object on the command list.
     * @remarks
     * 
     * This method can be called from graphics or compute command lists and bundles.
     * 
     * This method is an alternative to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setpipelinestate">ID3D12GraphicsCommandList::SetPipelineState</a>, which is only defined for graphics and compute shaders.  There is only one pipeline state active on a command list at a time, so either call sets the current pipeline state.  The distinction between the calls is that each sets particular types of pipeline state only.  In the current release, <b>SetPipelineState1</b> is only used for setting raytracing pipeline state.
     * 
     * 
     * @param {ID3D12StateObject} pStateObject The state object to set on the command list. In the current release, this can only be of type <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_state_object_type">D3D12_STATE_OBJECT_TYPE_RAYTRACING_PIPELINE</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-setpipelinestate1
     */
    SetPipelineState1(pStateObject) {
        ComCall(75, this, "ptr", pStateObject)
    }

    /**
     * Launch the threads of a ray generation shader.
     * @remarks
     * 
     * This method can be called from graphics or compute command lists and bundles.
     * 
     * 
     * 
     * A raytracing pipeline state must be set on the command list. Otherwise, the behavior of this call is undefined.
     * 
     * There are 3 dimensions passed in to set the grid size:  width/height/depth.  These dimensions are constrained such that width * height * depth &lt;= 2^30. Exceeding this produces undefined behavior. 
     * If any grid dimension is 0, no threads are launched.
     * 
     * 
     * @param {Pointer<D3D12_DISPATCH_RAYS_DESC>} pDesc A description of the ray dispatch
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist4-dispatchrays
     */
    DispatchRays(pDesc) {
        ComCall(76, this, "ptr", pDesc)
    }
}

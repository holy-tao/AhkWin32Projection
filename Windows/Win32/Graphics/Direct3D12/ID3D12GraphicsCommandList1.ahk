#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList.ahk

/**
 * Encapsulates a list of graphics commands for rendering, extending the interface to support programmable sample positions, atomic copies for implementing late-latch techniques, and optional depth-bounds testing.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12graphicscommandlist1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList1 extends ID3D12GraphicsCommandList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList1
     * @type {Guid}
     */
    static IID => Guid("{553103fb-1fe7-4557-bb38-946d7d0e7ca7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AtomicCopyBufferUINT", "AtomicCopyBufferUINT64", "OMSetDepthBounds", "SetSamplePositions", "ResolveSubresourceRegion", "SetViewInstanceMask"]

    /**
     * Atomically copies a primary data element of type UINT from one resource to another, along with optional dependent resources.
     * @remarks
     * 
     * This method is typically used to update resources for which normal rendering pipeline latency can be detrimental to user experience. For example, an application can compute a view matrix from the latest user input (such as from the sensors of a head-mounted display), and use this function to update and activate this matrix in command lists already dispatched to the GPU to reduce percieved latency between input and rendering.
     * 
     * 
     * @param {ID3D12Resource} pDstBuffer Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The resource that the UINT primary data element is copied into.
     * @param {Integer} DstOffset Type: <b>UINT64</b>
     * 
     * An offset into the destination resource buffer that specifies where the primary data element is copied into, in bytes. This offset combined with the base address of the resource buffer must result in a memory address that's naturally aligned for UINT values.
     * @param {ID3D12Resource} pSrcBuffer Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The resource that the UINT primary data element is copied from. This data is typically an address, index, or other handle that shader code can use to locate the most-recent version of latency-sensitive information.
     * @param {Integer} SrcOffset Type: <b>UINT64</b>
     * 
     * An offset into the source resource buffer that specifies where the primary data element is copied from, in bytes. This offset combined with the base address of the resource buffer must result in a memory address that's naturally aligned for UINT values.
     * @param {Integer} Dependencies Type: <b>UINT</b>
     * 
     * The number of dependent resources.
     * @param {Pointer<ID3D12Resource>} ppDependentResources Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_reads_(Dependencies)</c>
     * 
     * An array of resources that contain the dependent elements of the data payload.
     * @param {Pointer<D3D12_SUBRESOURCE_RANGE_UINT64>} pDependentSubresourceRanges Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_subresource_range_uint64">D3D12_SUBRESOURCE_RANGE_UINT64</a>*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_reads_(Dependencies)</c>
     * 
     * An array of subresource ranges that specify the dependent elements of the data payload. These elements are completely updated before the primary data element is itself atomically copied. This ensures that the entire operation is logically atomic; that is, the primary data element never refers to an incomplete data payload.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist1-atomiccopybufferuint
     */
    AtomicCopyBufferUINT(pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, Dependencies, ppDependentResources, pDependentSubresourceRanges) {
        ComCall(60, this, "ptr", pDstBuffer, "uint", DstOffset, "ptr", pSrcBuffer, "uint", SrcOffset, "uint", Dependencies, "ptr*", ppDependentResources, "ptr", pDependentSubresourceRanges)
    }

    /**
     * Atomically copies a primary data element of type UINT64 from one resource to another, along with optional dependent resources.
     * @remarks
     * 
     * This method is typically used to update resources for which normal rendering pipeline latency can be detrimental to user experience. For example, an application can compute a view matrix from the latest user input (such as from the sensors of a head-mounted display), and use this function to update and activate this matrix in command lists already dispatched to the GPU to reduce percieved latency between input and rendering.
     * 
     * 
     * @param {ID3D12Resource} pDstBuffer Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The resource that the UINT64 primary data element is copied into.
     * @param {Integer} DstOffset Type: <b>UINT64</b>
     * 
     * An offset into the destination resource buffer that specifies where the primary data element is copied into, in bytes. This offset combined with the base address of the resource buffer must result in a memory address that's naturally aligned for UINT64 values.
     * @param {ID3D12Resource} pSrcBuffer Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The resource that the UINT64 primary data element is copied from. This data is typically an address, index, or other handle that shader code can use to locate the most-recent version of latency-sensitive information.
     * @param {Integer} SrcOffset Type: <b>UINT64</b>
     * 
     * An offset into the source resource buffer that specifies where the primary data element is copied from, in bytes. This offset combined with the base address of the resource buffer must result in a memory address that's naturally aligned for UINT64 values.
     * @param {Integer} Dependencies Type: <b>UINT</b>
     * 
     * The number of dependent resources.
     * @param {Pointer<ID3D12Resource>} ppDependentResources Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_reads_(Dependencies)</c>
     * 
     * An array of resources that contain the dependent elements of the data payload.
     * @param {Pointer<D3D12_SUBRESOURCE_RANGE_UINT64>} pDependentSubresourceRanges Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_subresource_range_uint64">D3D12_SUBRESOURCE_RANGE_UINT64</a>*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_reads_(Dependencies)</c>
     * 
     * An array of subresource ranges that specify the dependent elements of the data payload. These elements are completely updated before the primary data element is itself atomically copied. This ensures that the entire operation is logically atomic; that is, the primary data element never refers to an incomplete data payload.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist1-atomiccopybufferuint64
     */
    AtomicCopyBufferUINT64(pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, Dependencies, ppDependentResources, pDependentSubresourceRanges) {
        ComCall(61, this, "ptr", pDstBuffer, "uint", DstOffset, "ptr", pSrcBuffer, "uint", SrcOffset, "uint", Dependencies, "ptr*", ppDependentResources, "ptr", pDependentSubresourceRanges)
    }

    /**
     * This method enables you to change the depth bounds dynamically.
     * @remarks
     * 
     * Depth-bounds testing allows pixels and samples to be discarded if the currently-stored depth value is outside the range specified by <i>Min</i> and <i>Max</i>, inclusive. If the currently-stored depth value of the pixel or sample is inside this range, then the depth-bounds test passes and it is rendered; otherwise, the depth-bounds test fails and the pixel or sample is discarded. Note that the depth-bounds test considers the currently-stored depth value, not the depth value generated by the executing pixel shader.
     * 
     * To use depth-bounds testing, the application must use the new <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device2-createpipelinestate">CreatePipelineState</a> method to enable depth-bounds testing on the PSO and then can use this command list method to change the depth-bounds dynamically.
     * 
     * OMSetDepthBounds is an optional feature. Use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> method to determine whether or not this feature is supported by the user-mode driver. Support for this feature is reported through the [D3D12_FEATURE_D3D12_OPTIONS1](./ne-d3d12-d3d12_feature.md) structure.
     * 
     * 
     * @param {Float} Min Type: <b>FLOAT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Specifies the minimum depth bounds. The default value is 0. NaN values silently convert to 0.
     * @param {Float} Max Type: <b>FLOAT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Specifies the maximum depth bounds. The default value is 1. NaN values silently convert to 0.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist1-omsetdepthbounds
     */
    OMSetDepthBounds(Min, Max) {
        ComCall(62, this, "float", Min, "float", Max)
    }

    /**
     * This method configures the sample positions used by subsequent draw, copy, resolve, and similar operations.
     * @remarks
     * 
     * The operational semantics of sample positions are determined by the various draw, copy, resolve, and other operations that can occur.
     * 
     * <b>CommandList:</b> In the absense of any prior calls to SetSamplePositions in a CommandList, samples assume the default position based on the Pipeline State Object (PSO). The default positions are determined either by the SAMPLE_DESC portion of the PSO if it is present, or by the standard sample positions if the RASTERIZER_DESC portion of the PSO has ForcedSampleCount set to a value greater than 0.
     * 
     * After SetSamplePosition has been called, subsequent draw calls must use a PSO that specifies a matching sample count either using the SAMPLE_DESC portion of the PSO, or ForcedSampleCount in the RASTERIZER_DESC portion of the PSO.
     * 
     * SetSamplePositions can only be called on a graphics CommandList. It can't be called in a bundle; bundles inherit sample position state from the calling CommandList and don't modify it.
     * 
     * Calling SetSamplePositions(0, 0, NULL) reverts the sample positions to their default values.
     * 
     * <b>Clear RenderTarget:</b> Sample positions are ignored when clearing a render target.
     * 
     * <b>Clear DepthStencil:</b> When clearing the depth portion of a depth-stencil surface or any region of it, the sample positions must be set to match those of future rendering to the cleared surface or region; the contents of any uncleared regions produced using different sample positions become undefined.
     * 
     * When clearing the stencil portion of a depth-stencil surface or any region of it, the sample positions are ignored.
     * 
     * <b>Draw to RenderTarget:</b> When drawing to a render target the sample positions can be changed for each draw call, even when drawing to a region that overlaps previous draw calls. The current sample positions determine the operational semantics of each draw call and samples are taken from taken from the stored contents of the render target, even if the contents were produced using different sample positions.
     * 
     * <b>Draw using DepthStencil:</b> When drawing to a depth-stencil surface (read or write) or any region of it, the sample positions must be set to match those used to clear the affected region previously. To use a different sample position, the target region must be cleared first. The pixels outside the clear region are unaffected.
     * 
     * Hardware may store the depth portion or a depth-stencil surface as plane equations, and evaluate them to produce depth values when the application issues a read. Only the rasterizer and output-merger are required to suport programmable sample positions of the depth portion of a depth-stencil surface. Any other read or write of the depth portion that has been rendered with sample positions set may ignore them and instead sample at the standard positions.
     * 
     * <b>Resolve RenderTarget:</b> When resolving a render target or any region of it, the sample positions are ignored; these APIs operate only on stored color values.
     * 
     * <b>Resolve DepthStencil:</b> When resolving the depth portion of a depth-stencil surface or any region of it, the sample positions must be set to match those of past rendering to the resolved surface or region. To use a different sample position, the target region must be cleared first.
     * 
     * When resolving the stencil portion of a depth-stencil surface or any region of it, the sample positions are ignored; stencil resolves operate only on stored stencil values.
     * 
     * <b>Copy RenderTarget:</b> When copying from a render target, the sample positions are ignored regardless of whether it is a full or partial copy.
     * 
     * <b>Copy DepthStencil (Full Subresource):</b> When copying a full subresource from a depth-stencil surface, the sample positions must be set to match the sample positions used to generate the source surface. To use a different sample position, the target region must be cleared first.
     * 
     * On some hardware properties of the source surface (such as stored plane equations for depth values) transfer to the destination. Therefore, if the destination surface is subsequently drawn to, the sample positions originally used to generate the source content need to be used with the destination surface. The API requires this on all hardware for consistency even if it may only apply to some.
     * 
     * <b>Copy DepthStencil (Partial Subresource):</b> When copying a partial subresource from a depth-stencil surface, the sample positions must be set to match the sample positions used to generate the source surface, similarly to copying a full subresource. However, if the content of an affected destination subresources is only partially covered by the copy, the contents of the uncovered portion within those subresources becomes undefined unless all of it was generated using the same sample positions as the copy source. To use a different sample position, the target region must be cleared first.
     * 
     * When copying a partial subresource from the stencil portion of a depth-stencil surface, the sample postions are ignored. It doesn’t matter what sample positions were used to generate content for any other areas of the destination buffer not covered by the copy – those contents remain valid.
     * 
     * <b>Shader SamplePos:</b> The HLSL SamplePos intrinsic is not aware of programmable sample positions and results returned to shaders calling this on a surface rendered with programmable positions is undefined. Applications must pass coordinates into their shader manually if needed. Similarly evaluating attributes by sample index is undefined with programmable sample positions.
     * 
     * <b>Transitioning out of DEPTH_READ or DEPTH_WRITE state:</b> If a subresource in DEPTH_READ or DEPTH_WRITE state is transitioned to any other state, including COPY_SOURCE or RESOLVE_SOURCE, some hardware might need to decompress the surface. Therefore, the sample positions must be set on the command list to match those used to generate the content in the source surface. Furthermore, for any subsequent transitions of the surface while the same depth data remains in it, the sample positions must continue to match those set on the command list. To use a different sample position, the target region must be cleared first.
     * 
     * If an application wants to minimize the decompressed area when only a portion needs to be used, or just to preserve compression, ResolveSubresourceRegion() can be called in DECOMPRESS mode with a rect specified.  This will decompress just the relevant area to a separate resource leaving the source intact on some hardware, though on other hardware even the source area is decompressed. The separate explicitly decompressed resource can then be transitioned to the desired state (such as SHADER_RESOURCE).
     * 
     * <b>Transitioning out of RENDER_TARGET state:</b> If a subresource in RENDER_TARGET state is transitioned to anything other than COPY_SOURCE or RESOLVE_SOURCE, some implementations may need to decompress the surface. This decompression is agnostic to sample positions.
     * 
     * If an application wants to minimize the decompressed area when only a portion needs to be used, or just to preserve compression, ResolveSubresourceRegion() can be called in DECOMPRESS mode with a rect specified.  This will decompress just the relevant area to a separate resource leaving the source intact on some hardware, though on other hardware even the source area is decompressed. The separate explicitly decompressed resource can then be transitioned to the desired state (such as SHADER_RESOURCE).
     * 
     * 
     * @param {Integer} NumSamplesPerPixel Type: <b>UINT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Specifies the number of samples to take, per pixel. This value can be 1, 2, 4, 8, or 16, otherwise the SetSamplePosition call is dropped. The number of samples must match the sample count configured in the PSO at draw time, otherwise the behavior is undefined.
     * @param {Integer} NumPixels Type: <b>UINT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Specifies the number of pixels that sample patterns are being specified for. This value can be either 1 or 4, otherwise the SetSamplePosition call is dropped. A value of 1 configures a single sample pattern to be used for each pixel; a value of 4 configures separate sample patterns for each pixel in a 2x2 pixel grid which is repeated over the render-target or viewport space, aligned to even coordintes.
     * 
     * Note that the maximum number of combined samples can't exceed 16, otherwise the call is dropped. If NumPixels is set to 4, NumSamplesPerPixel can specify no more than 4 samples.
     * @param {Pointer<D3D12_SAMPLE_POSITION>} pSamplePositions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_sample_position">D3D12_SAMPLE_POSITION</a>*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_reads_(NumSamplesPerPixel*NumPixels)</c>
     * 
     * Specifies an array of D3D12_SAMPLE_POSITION elements. The size of the array is NumPixels * NumSamplesPerPixel. If NumPixels is set to 4, then the first group of sample positions corresponds to the upper-left pixel in the 2x2 grid of pixels; the next group of sample positions corresponds to the upper-right pixel, the next group to the lower-left pixel, and the final group to the lower-right pixel.
     * 
     * If centroid interpolation is used during rendering, the order of positions for each pixel determines centroid-sampling prioritiy. That is, the first covered sample in the order specified is chosen as the centroid sample location.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist1-setsamplepositions
     */
    SetSamplePositions(NumSamplesPerPixel, NumPixels, pSamplePositions) {
        ComCall(63, this, "uint", NumSamplesPerPixel, "uint", NumPixels, "ptr", pSamplePositions)
    }

    /**
     * Copy a region of a multisampled or compressed resource into a non-multisampled or non-compressed resource.
     * @remarks
     * 
     * ResolveSubresourceRegion operates like <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resolvesubresource">ResolveSubresource</a> but allows for only part of a resource to be resolved and for source samples to be resolved in several ways. Partial resolves can be useful in multi-adapter scenarios; for example, when the rendered area has been partitioned across adapters, each adapter might only need to resolve the portion of a subresource that corresponds to its assigned partition.
     * 
     * 
     * @param {ID3D12Resource} pDstResource Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Destination resource. Must be created with the <b>D3D11_USAGE_DEFAULT</b> flag and must be single-sampled unless its to be resolved from a compressed resource (<b>D3D12_RESOLVE_MODE_DECOMPRESS</b>); in this case it must have the same sample count as the compressed source.
     * @param {Integer} DstSubresource Type: <b>UINT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * A zero-based index that identifies the destination subresource. Use <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12calcsubresource">D3D12CalcSubresource</a> to calculate the subresource index if the parent resource is complex.
     * @param {Integer} DstX Type: <b>UINT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The X coordinate of the left-most edge of the destination region. The width of the destination region is the same as the width of the source rect.
     * @param {Integer} DstY Type: <b>UINT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * The Y coordinate of the top-most edge of the destination region. The height of the destination region is the same as the height of the source rect.
     * @param {ID3D12Resource} pSrcResource Type: <b>ID3D12Resource*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Source resource. Must be multisampled or compressed.
     * @param {Integer} SrcSubresource Type: <b>UINT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * A zero-based index that identifies the source subresource.
     * @param {Pointer<RECT>} pSrcRect Type: <b>D3D12_RECT*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_opt_</c>
     * 
     * Specifies the rectangular region of the source resource to be resolved. Passing NULL for <i>pSrcRect</i> specifies that the entire subresource is to be resolved.
     * @param {Integer} Format Type: <b>DXGI_FORMAT</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * A DXGI_FORMAT that specifies how the source and destination resource formats are consolidated.
     * @param {Integer} ResolveMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resolve_mode">D3D12_RESOLVE_MODE</a></b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Specifies the operation used to resolve the source samples.
     * 
     * When using the <b>D3D12_RESOLVE_MODE_DECOMPRESS</b> operation, the sample count can be larger than 1 as long as the source and destination have the same sample count, and source and destination may specify the same resource as long as the source rect aligns with the destination X and Y coordinates, in which case decompression occurs in place.
     * 
     * When using the <b>D3D12_RESOLVE_MODE_MIN</b>, <b>D3D12_RESOLVE_MODE_MAX</b>, or <b>D3D12_RESOLVE_MODE_AVERAGE</b> operation, the destination must have a sample count of 1.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist1-resolvesubresourceregion
     */
    ResolveSubresourceRegion(pDstResource, DstSubresource, DstX, DstY, pSrcResource, SrcSubresource, pSrcRect, Format, ResolveMode) {
        ComCall(64, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcRect, "int", Format, "int", ResolveMode)
    }

    /**
     * Set a mask that controls which view instances are enabled for subsequent draws.
     * @remarks
     * 
     * The view instance mask only affects PSOs that declare view instance masking by specifying the D3D12_VIEW_INSTANCING_FLAG_ENABLE_VIEW_INSTANCE_MASKING flag during their creation. Attempting to create a PSO that declares view instance masking will fail on adapters that don't support view instancing.
     * 
     * The view instance mask defaults to 0 which disables all views. This forces applications that declare view instance masking to explicitly choose the views to enable, otherwise nothing will be rendered. If the view instance mask enabled all views by default the application might not remember to disable unused views, resulting in lost performance due to wasted work.
     * 
     * Bundles don't inherit their view instance mask from their caller, defaulting to 0 instead. This is because the mask setting must be known when the bundle is recorded if it affects how an implementation records draws. The view instance mask set by a bundle does persist to the caller after the bundle completes, however. These inheritence semantics are similar to those of PSOs.
     * 
     * No shader code paths that are dependent on SV_ViewID are executed at any shader stage for view instances that are masked off and no clipping, viewport processing, or rasterization is performed. Implementations that inspect the mask during rendering can incur a small performance penalty over PSOs that don't declare view instance masking at all, but usually the penalty can be overcome by the performance savings that result from skipping the work associated with the masked off views. Depending on the frequency and amount of skipped work, the performance gains can be significant.
     * 
     * 
     * @param {Integer} Mask Type: <b>UINT</b>
     * 
     * A mask that specifies which views are enabled or disabled. If bit <i>i</i> starting from the least-significant bit is set, view instance <i>i</i> is enabled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12graphicscommandlist1-setviewinstancemask
     */
    SetViewInstanceMask(Mask) {
        ComCall(65, this, "uint", Mask)
    }
}

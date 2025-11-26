#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext.ahk

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext1 adds new methods to those in ID3D11DeviceContext.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11devicecontext1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext1 extends ID3D11DeviceContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11DeviceContext1
     * @type {Guid}
     */
    static IID => Guid("{bb2c6faa-b5fb-4082-8e6b-388b8cfa90e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 115

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopySubresourceRegion1", "UpdateSubresource1", "DiscardResource", "DiscardView", "VSSetConstantBuffers1", "HSSetConstantBuffers1", "DSSetConstantBuffers1", "GSSetConstantBuffers1", "PSSetConstantBuffers1", "CSSetConstantBuffers1", "VSGetConstantBuffers1", "HSGetConstantBuffers1", "DSGetConstantBuffers1", "GSGetConstantBuffers1", "PSGetConstantBuffers1", "CSGetConstantBuffers1", "SwapDeviceContextState", "ClearView", "DiscardView1"]

    /**
     * Copies a region from a source resource to a destination resource.
     * @remarks
     * 
     * If the display driver supports overlapping, the source and destination subresources can be identical, and the source and destination regions can overlap each other.  For existing display drivers that don’t support overlapping, the runtime drops calls with identical source and destination subresources, regardless of whether the regions overlap.  To determine whether the display driver supports overlapping, check the <b>CopyWithOverlap</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options">D3D11_FEATURE_DATA_D3D11_OPTIONS</a>. This overlapping support enables additional scroll functionality in a call to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>.
     * 
     * <div class="alert"><b>Note</b>  <b>Applies only to feature level 9_x hardware</b> If you use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1">ID3D11DeviceContext1::UpdateSubresource1</a> or <b>CopySubresourceRegion1</b> to copy from a staging resource to a default resource, you can corrupt the destination contents. This occurs if you pass a <b>NULL</b> source box and if the source resource has different dimensions from those of the destination resource or if you use destination offsets, (x, y, and z). In this situation, always pass a source box that is the full size of the source resource.</div>
     * <div> </div>
     * 
     * 
     * @param {ID3D11Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the destination resource.
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Destination subresource index.
     * @param {Integer} DstX Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x-coordinate of the upper-left corner of the destination region.
     * @param {Integer} DstY Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y-coordinate of the upper-left corner of the destination region. For a 1D subresource, this must be zero.
     * @param {Integer} DstZ Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z-coordinate of the upper-left corner of the destination region. For a 1D or 2D subresource, this must be zero.
     * @param {ID3D11Resource} pSrcResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the source resource.
     * @param {Integer} SrcSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Source subresource index.
     * @param {Pointer<D3D11_BOX>} pSrcBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>*</b>
     * 
     * A pointer to a 3D box that defines the region of the source subresource that <b>CopySubresourceRegion1</b> can copy. If <b>NULL</b>, <b>CopySubresourceRegion1</b> copies the entire source subresource. The box must fit within the source resource.
     * 
     * An empty box results in a no-op. A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value. When the box is empty, <b>CopySubresourceRegion1</b> doesn't perform a copy operation.
     * @param {Integer} CopyFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_copy_flags">D3D11_COPY_FLAGS</a>-typed value that specifies how to perform the copy operation. If you specify zero for no copy option, <b>CopySubresourceRegion1</b> behaves like <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">ID3D11DeviceContext::CopySubresourceRegion</a>. For existing display drivers that can't process these flags, the runtime doesn't use them.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1
     */
    CopySubresourceRegion1(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox, CopyFlags) {
        ComCall(115, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox, "uint", CopyFlags)
    }

    /**
     * The CPU copies data from memory to a subresource created in non-mappable memory.
     * @remarks
     * 
     * If you call <b>UpdateSubresource1</b> to update a constant buffer, pass any region, and the driver has not been implemented to Windows 8, the runtime drops the call (except <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1, 9.2, and 9.3 where the runtime emulates support).  The runtime also drops the call if you update a constant buffer with a partial region whose extent is not aligned to 16-byte granularity (16 bytes being a full constant). When the runtime drops the call, the runtime doesn't call the corresponding device driver interface (DDI).
     * 
     * When you record a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-updatesubresource">UpdateSubresource</a> with an offset <i>pDstBox</i> in a software command list, the offset in <i>pDstBox</i> is incorrectly applied to <i>pSrcData</i> when you play back the command list.  The new-for-Windows 8<b>UpdateSubresource1</b> fixes this issue. In a call to <b>UpdateSubresource1</b>, <i>pDstBox</i> does not affect <i>pSrcData</i>.
     * 
     * For info about various resource types and how <b>UpdateSubresource1</b> might work with each resource type, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Introduction to a Resource in Direct3D 11</a>. 
     * 
     * <div class="alert"><b>Note</b>  <b>Applies only to feature level 9_x hardware</b> If you use <b>UpdateSubresource1</b> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1">ID3D11DeviceContext1::CopySubresourceRegion1</a> to copy from a staging resource to a default resource, you can corrupt the destination contents. This occurs if you pass a <b>NULL</b> source box and if the source resource has different dimensions from those of the destination resource or if you use destination offsets, (x, y, and z). In this situation, always pass a source box that is the full size of the source resource.</div>
     * <div> </div>
     * 
     * 
     * @param {ID3D11Resource} pDstResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the destination resource.
     * @param {Integer} DstSubresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based index that identifies the destination subresource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11calcsubresource">D3D11CalcSubresource</a> for more details.
     * @param {Pointer<D3D11_BOX>} pDstBox Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_box">D3D11_BOX</a>*</b>
     * 
     * A pointer to a box that defines the portion of the destination subresource to copy the resource data into. Coordinates are in bytes for buffers and in texels for textures. If <b>NULL</b>, <b>UpdateSubresource1</b> writes the data to the destination subresource with no offset. The dimensions of the source must fit the destination.
     * 
     * An empty box results in a no-op. A box is empty if the top value is greater than or equal to the bottom value, or the left value is greater than or equal to the right value, or the front value is greater than or equal to the back value. When the box is empty, <b>UpdateSubresource1</b> doesn't perform an update operation.
     * @param {Pointer<Void>} pSrcData Type: <b>const void*</b>
     * 
     * A pointer to the source data in memory.
     * @param {Integer} SrcRowPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of one row of the source data.
     * @param {Integer} SrcDepthPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of one depth slice of source data.
     * @param {Integer} CopyFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_copy_flags">D3D11_COPY_FLAGS</a>-typed value that specifies how to perform the update operation. If you specify zero for no update option, <b>UpdateSubresource1</b> behaves like <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-updatesubresource">ID3D11DeviceContext::UpdateSubresource</a>. For existing display drivers that can't process these flags, the runtime doesn't use them.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1
     */
    UpdateSubresource1(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch, CopyFlags) {
        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        ComCall(116, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, pSrcDataMarshal, pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch, "uint", CopyFlags)
    }

    /**
     * Discards a resource from the device context.
     * @remarks
     * 
     * <b>DiscardResource</b> informs the graphics processing unit (GPU) that the existing content in the resource that <i>pResource</i> points to is no longer needed.
     * 
     * 
     * @param {ID3D11Resource} pResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface for the resource to discard. The resource must have been created with usage <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DEFAULT</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DYNAMIC</a>, otherwise the runtime drops the call to <b>DiscardResource</b>; if the debug layer is enabled, the runtime returns an error message.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardresource
     */
    DiscardResource(pResource) {
        ComCall(117, this, "ptr", pResource)
    }

    /**
     * Discards a resource view from the device context.
     * @remarks
     * 
     * <b>DiscardView</b> informs the graphics processing unit (GPU) that the existing content in the resource view that <i>pResourceView</i> points to is no longer needed.  The view can be an SRV, RTV, UAV, or DSV.  <b>DiscardView</b> is a variation on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardresource">DiscardResource</a> method.  <b>DiscardView</b> allows you to discard a subset of a resource that is in a view (such as a single miplevel).  More importantly, <b>DiscardView</b> provides a convenience because often views are what are being bound and unbound at the pipeline.  Some pipeline bindings do not have views, such as stream output.  In that situation, <b>DiscardResource</b> can do the job for any resource.
     * 
     * 
     * @param {ID3D11View} pResourceView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11view">ID3D11View</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11view">ID3D11View</a> interface for the resource view to discard. The resource that underlies the view must have been created with usage <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DEFAULT</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DYNAMIC</a>, otherwise the runtime drops the call to <b>DiscardView</b>; if the debug layer is enabled, the runtime returns an error message.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardview
     */
    DiscardView(pResourceView) {
        ComCall(118, this, "ptr", pResourceView)
    }

    /**
     * Sets the constant buffers that the vertex shader pipeline stage uses.
     * @remarks
     * 
     * The runtime drops the call to <b>VSSetConstantBuffers1</b> if the number of constants to which <i>pNumConstants</i> points is larger than the maximum constant buffer size that is supported by shaders (4096 constants).  The values in the elements of the <i>pFirstConstant</i> and <i>pFirstConstant</i> + <i>pNumConstants</i> arrays can exceed the length of each buffer; from the shader's point of view, the constant buffer is the intersection of the actual memory allocation for the buffer and the window [value in an element of <i>pFirstConstant</i>, value in an element of <i>pFirstConstant</i> + value in an element of <i>pNumConstants</i>]. The runtime also drops the call to <b>VSSetConstantBuffers1</b> on existing drivers that don't support this offsetting.
     * 
     * The runtime will emulate this feature for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1, 9.2, and 9.3; therefore, this feature is supported for feature level 9.1, 9.2, and 9.3.  This feature is always available on new drivers for feature level 10 and higher.
     * 
     * From the shader’s point of view, element [0] in the constant buffers array is the constant at <i>pFirstConstant</i>.
     * 
     * Out of bounds access to the constant buffers from the shader to the range that is defined by <i>pFirstConstant</i> and <i>pNumConstants</i> returns 0. 
     * 
     * If <i>pFirstConstant</i> and <i>pNumConstants</i> arrays are <b>NULL</b>, you get the same result as if you were binding the entire buffer into view.  You get this same result if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetconstantbuffers">VSSetConstantBuffers</a> method. If the buffer is larger than the maximum constant buffer size that is supported by shaders (4096 elements), the shader can access only the first 4096 constants.
     * 
     * If either <i>pFirstConstant</i> or <i>pNumConstants</i> is <b>NULL</b>, the other parameter must also be <b>NULL</b>.
     * 
     * <h3><a id="Calling_VSSetConstantBuffers1_with_command_list_emulation"></a><a id="calling_vssetconstantbuffers1_with_command_list_emulation"></a><a id="CALLING_VSSETCONSTANTBUFFERS1_WITH_COMMAND_LIST_EMULATION"></a>Calling VSSetConstantBuffers1 with command list emulation</h3>
     * The runtime's <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-command-list">command list</a> emulation of <b>VSSetConstantBuffers1</b> sometimes doesn't actually change the offsets or sizes for the arrays of constant buffers. This behavior occurs when 
     * 
     * <b>VSSetConstantBuffers1</b> doesn't effectively change the constant buffers at the beginning and end of the range of slots that you set to update. This section shows how to work around this 
     * 
     * behavior.
     * 
     * Here is the code to check whether either the runtime emulates command lists or the driver supports command lists:
     * 
     * 
     * 
     * ```cpp
     * 
     *      HRESULT hr = S_OK;
     *      bool needWorkaround = false;
     *      D3D11_DEVICE_CONTEXT_TYPE contextType = pDeviceContext->GetType();
     * 
     *      if( D3D11_DEVICE_CONTEXT_DEFERRED == contextType)
     *      {
     *           D3D11_FEATURE_DATA_THREADING threadingCaps = { FALSE, FALSE };
     * 
     *           hr = pDevice->CheckFeatureSupport( D3D11_FEATURE_THREADING, &threadingCaps, sizeof(threadingCaps) );
     *           if( SUCCEEDED(hr) && !threadingCaps.DriverCommandLists )
     *           {
     *                needWorkaround = true; // the runtime emulates command lists.
     *           }
     *      }
     * 
     * ```
     * 
     * 
     * If the runtime emulates command lists, you need to use one of these code snippets:
     * 
     * 
     * If you change the offset and size on only a single constant buffer, set the constant buffer to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->VSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->VSSetConstantBuffers(0, 1, &NullCBuf);
     *      }
     *      pDeviceContext->VSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     * 
     * ```
     * 
     * 
     * If you change multiple constant buffers, set the first and last constant buffers of the range to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->VSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->VSSetConstantBuffers(0, 1, &NullCBuf);
     *           pDeviceContext->VSSetConstantBuffers(3, 1, &NullCBuf);
     *      }
     *      pDeviceContext->VSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     * 
     * ```
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers being given to the device.
     * @param {Pointer<Integer>} pFirstConstant Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array that holds the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer. Each offset must be a multiple of 16 constants.
     * @param {Pointer<Integer>} pNumConstants Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array that holds the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. Each number of constants must be a multiple of 16 constants, in the range [0..4096].
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-vssetconstantbuffers1
     */
    VSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(119, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Sets the constant buffers that the hull-shader stage of the pipeline uses.
     * @remarks
     * 
     * The runtime drops the call to <b>HSSetConstantBuffers1</b> if the number of constants to which <i>pNumConstants</i> points is larger than the maximum constant buffer size that is supported by shaders (4096 constants).  The values in the elements of the <i>pFirstConstant</i> and <i>pFirstConstant</i> + <i>pNumConstants</i> arrays can exceed the length of each buffer; from the shader's point of view, the constant buffer is the intersection of the actual memory allocation for the buffer and the window [value in an element of <i>pFirstConstant</i>, value in an element of <i>pFirstConstant</i> + value in an element of <i>pNumConstants</i>]. The runtime also drops the call to <b>HSSetConstantBuffers1</b> on existing drivers that don't support this offsetting.
     * 
     * The runtime will emulate this feature for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1, 9.2, and 9.3; therefore, this feature is supported for feature level 9.1, 9.2, and 9.3.  This feature is always available on new drivers for feature level 10 and higher.
     * 
     * From the shader’s point of view, element [0] in the constant buffers array is the constant at <i>pFirstConstant</i>.
     * 
     * Out of bounds access to the constant buffers from the shader to the range that is defined by <i>pFirstConstant</i> and <i>pNumConstants</i> returns 0. 
     * 
     * If the <i>pFirstConstant</i> and <i>pNumConstants</i> arrays are <b>NULL</b>, you get the same result as if you were binding the entire buffer into view.  You get this same result if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetconstantbuffers">HSSetConstantBuffers</a> method. If the buffer is larger than the maximum constant buffer size that is supported by shaders (4096 elements), the shader can access only the first 4096 constants.
     * 
     * If either <i>pFirstConstant</i> or <i>pNumConstants</i> is <b>NULL</b>, the other parameter must also be <b>NULL</b>.
     * 
     * <h3><a id="Calling_HSSetConstantBuffers1_with_command_list_emulation"></a><a id="calling_hssetconstantbuffers1_with_command_list_emulation"></a><a id="CALLING_HSSETCONSTANTBUFFERS1_WITH_COMMAND_LIST_EMULATION"></a>Calling HSSetConstantBuffers1 with command list emulation</h3>
     * The runtime's <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-command-list">command list</a> emulation of <b>HSSetConstantBuffers1</b> sometimes doesn't actually change the offsets or sizes for the arrays of constant buffers. This behavior occurs when 
     * 
     * <b>HSSetConstantBuffers1</b> doesn't effectively change the constant buffers at the beginning and end of the range of slots that you set to update. This section shows how to work around this 
     * 
     * behavior.
     * 
     * Here is the code to check whether either the runtime emulates command lists or the driver supports command lists:
     * 
     * 
     * 
     * ```cpp
     * 
     *      HRESULT hr = S_OK;
     *      bool needWorkaround = false;
     *      D3D11_DEVICE_CONTEXT_TYPE contextType = pDeviceContext->GetType();
     * 
     *      if( D3D11_DEVICE_CONTEXT_DEFERRED == contextType)
     *      {
     *           D3D11_FEATURE_DATA_THREADING threadingCaps = { FALSE, FALSE };
     * 
     *           hr = pDevice->CheckFeatureSupport( D3D11_FEATURE_THREADING, &threadingCaps, sizeof(threadingCaps) );
     *           if( SUCCEEDED(hr) && !threadingCaps.DriverCommandLists )
     *           {
     *                needWorkaround = true; // the runtime emulates command lists.
     *           }
     *      }
     * 
     * ```
     * 
     * 
     * If the runtime emulates command lists, you need to use one of these code snippets:
     * 
     * 
     * If you change the offset and size on only a single constant buffer, set the constant buffer to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->HSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->HSSetConstantBuffers(0, 1, &NullCBuf);
     *      }
     *      pDeviceContext->HSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     * 
     * ```
     * 
     * 
     * If you change multiple constant buffers, set the first and last constant buffers of the range to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->HSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->HSSetConstantBuffers(0, 1, &NullCBuf);
     *           pDeviceContext->HSSetConstantBuffers(3, 1, &NullCBuf);
     *      }
     *      pDeviceContext->HSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     * 
     * ```
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffers being given to the device.
     * @param {Pointer<Integer>} pFirstConstant An array that holds the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer. Each offset must be a multiple of 16 constants.
     * @param {Pointer<Integer>} pNumConstants An array that holds the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. Each number of constants must be a multiple of 16 constants, in the range [0..4096].
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-hssetconstantbuffers1
     */
    HSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(120, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Sets the constant buffers that the domain-shader stage uses.
     * @remarks
     * 
     * The runtime drops the call to <b>DSSetConstantBuffers1</b> if the number of constants to which <i>pNumConstants</i> points is larger than the maximum constant buffer size that is supported by shaders (4096 constants).  The values in the elements of the <i>pFirstConstant</i> and <i>pFirstConstant</i> + <i>pNumConstants</i> arrays can exceed the length of each buffer; from the shader's point of view, the constant buffer is the intersection of the actual memory allocation for the buffer and the window [value in an element of <i>pFirstConstant</i>, value in an element of <i>pFirstConstant</i> + value in an element of <i>pNumConstants</i>]. The runtime also drops the call to <b>DSSetConstantBuffers1</b> on existing drivers that don't support this offsetting.
     * 
     * The runtime will emulate this feature for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1, 9.2, and 9.3; therefore, this feature is supported for feature level 9.1, 9.2, and 9.3.  This feature is always available on new drivers for feature level 10 and higher.
     * 
     * From the shader’s point of view, element [0] in the constant buffers array is the constant at <i>pFirstConstant</i>.
     * 
     * Out of bounds access to the constant buffers from the shader to the range that is defined by <i>pFirstConstant</i> and <i>pNumConstants</i> returns 0. 
     * 
     * If <i>pFirstConstant</i> and <i>pNumConstants</i> arrays are <b>NULL</b>, you get the same result as if you were binding the entire buffer into view.  You get this same result if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dssetconstantbuffers">DSSetConstantBuffers</a> method. If the buffer is larger than the maximum constant buffer size that is supported by shaders (4096 elements), the shader can access only the first 4096 constants.
     * 
     * If either <i>pFirstConstant</i> or <i>pNumConstants</i> is <b>NULL</b>, the other parameter must also be <b>NULL</b>.
     * 
     * <h3><a id="Calling_DSSetConstantBuffers1_with_command_list_emulation"></a><a id="calling_dssetconstantbuffers1_with_command_list_emulation"></a><a id="CALLING_DSSETCONSTANTBUFFERS1_WITH_COMMAND_LIST_EMULATION"></a>Calling DSSetConstantBuffers1 with command list emulation</h3>
     * The runtime's <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-command-list">command list</a> emulation of <b>DSSetConstantBuffers1</b> sometimes doesn't actually change the offsets or sizes for the arrays of constant buffers. This behavior occurs when 
     * 
     * <b>DSSetConstantBuffers1</b> doesn't effectively change the constant buffers at the beginning and end of the range of slots that you set to update. This section shows how to work around this 
     * 
     * behavior.
     * 
     * Here is the code to check whether either the runtime emulates command lists or the driver supports command lists:
     * 
     * 
     * 
     * ```cpp
     * 
     *      HRESULT hr = S_OK;
     *      bool needWorkaround = false;
     *      D3D11_DEVICE_CONTEXT_TYPE contextType = pDeviceContext->GetType();
     * 
     *      if( D3D11_DEVICE_CONTEXT_DEFERRED == contextType)
     *      {
     *           D3D11_FEATURE_DATA_THREADING threadingCaps = { FALSE, FALSE };
     * 
     *           hr = pDevice->CheckFeatureSupport( D3D11_FEATURE_THREADING, &threadingCaps, sizeof(threadingCaps) );
     *           if( SUCCEEDED(hr) && !threadingCaps.DriverCommandLists )
     *           {
     *                needWorkaround = true; // the runtime emulates command lists.
     *           }
     *      }
     * 
     * ```
     * 
     * 
     * If the runtime emulates command lists, you need to use one of these code snippets:
     * 
     * 
     * If you change the offset and size on only a single constant buffer, set the constant buffer to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->DSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->DSSetConstantBuffers(0, 1, &NullCBuf);
     *      }
     *      pDeviceContext->DSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     * 
     * ```
     * 
     * 
     * If you change multiple constant buffers, set the first and last constant buffers of the range to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->DSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->DSSetConstantBuffers(0, 1, &NullCBuf);
     *           pDeviceContext->DSSetConstantBuffers(3, 1, &NullCBuf);
     *      }
     *      pDeviceContext->DSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     * 
     * ```
     * 
     * 
     * @param {Integer} StartSlot Index into the zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffers being given to the device.
     * @param {Pointer<Integer>} pFirstConstant An array that holds the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer. Each offset must be a multiple of 16 constants.
     * @param {Pointer<Integer>} pNumConstants An array that holds the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. Each number of constants must be a multiple of 16 constants, in the range [0..4096].
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-dssetconstantbuffers1
     */
    DSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(121, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Sets the constant buffers that the geometry shader pipeline stage uses.
     * @remarks
     * 
     * The runtime drops the call to <b>GSSetConstantBuffers1</b> if the number of constants to which <i>pNumConstants</i> points is larger than the maximum constant buffer size that is supported by shaders (4096 constants).  The values in the elements of the <i>pFirstConstant</i> and <i>pFirstConstant</i> + <i>pNumConstants</i> arrays can exceed the length of each buffer; from the shader's point of view, the constant buffer is the intersection of the actual memory allocation for the buffer and the window [value in an element of <i>pFirstConstant</i>, value in an element of <i>pFirstConstant</i> + value in an element of <i>pNumConstants</i>]. The runtime also drops the call to <b>GSSetConstantBuffers1</b> on existing drivers that don't support this offsetting.
     * 
     * The runtime will emulate this feature for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1, 9.2, and 9.3; therefore, this feature is supported for feature level 9.1, 9.2, and 9.3.  This feature is always available on new drivers for feature level 10 and higher.
     * 
     * From the shader’s point of view, element [0] in the constant buffers array is the constant at <i>pFirstConstant</i>.
     * 
     * Out of bounds access to the constant buffers from the shader to the range that is defined by <i>pFirstConstant</i> and <i>pNumConstants</i> returns 0. 
     * 
     * If <i>pFirstConstant</i> and <i>pNumConstants</i> arrays are <b>NULL</b>, you get the same result as if you were binding the entire buffer into view.  You get this same result if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetconstantbuffers">GSSetConstantBuffers</a> method. If the buffer is larger than the maximum constant buffer size that is supported by shaders (4096 elements), the shader can access only the first 4096 constants.
     * 
     * If either <i>pFirstConstant</i> or <i>pNumConstants</i> is <b>NULL</b>, the other parameter must also be <b>NULL</b>.
     * 
     * <h3><a id="Calling_GSSetConstantBuffers1_with_command_list_emulation"></a><a id="calling_gssetconstantbuffers1_with_command_list_emulation"></a><a id="CALLING_GSSETCONSTANTBUFFERS1_WITH_COMMAND_LIST_EMULATION"></a>Calling GSSetConstantBuffers1 with command list emulation</h3>
     * The runtime's <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-command-list">command list</a> emulation of <b>GSSetConstantBuffers1</b> sometimes doesn't actually change the offsets or sizes for the arrays of constant buffers. This behavior occurs when 
     * 
     * <b>GSSetConstantBuffers1</b> doesn't effectively change the constant buffers at the beginning and end of the range of slots that you set to update. This section shows how to work around this 
     * 
     * behavior.
     * 
     * Here is the code to check whether either the runtime emulates command lists or the driver supports command lists:
     * 
     * 
     * 
     * ```cpp
     * 
     *      HRESULT hr = S_OK;
     *      bool needWorkaround = false;
     *      D3D11_DEVICE_CONTEXT_TYPE contextType = pDeviceContext->GetType();
     * 
     *      if( D3D11_DEVICE_CONTEXT_DEFERRED == contextType)
     *      {
     *           D3D11_FEATURE_DATA_THREADING threadingCaps = { FALSE, FALSE };
     * 
     *           hr = pDevice->CheckFeatureSupport( D3D11_FEATURE_THREADING, &threadingCaps, sizeof(threadingCaps) );
     *           if( SUCCEEDED(hr) && !threadingCaps.DriverCommandLists )
     *           {
     *                needWorkaround = true; // the runtime emulates command lists.
     *           }
     *      }
     * 
     * ```
     * 
     * 
     * If the runtime emulates command lists, you need to use one of these code snippets:
     * 
     * 
     * If you change the offset and size on only a single constant buffer, set the constant buffer to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->GSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->GSSetConstantBuffers(0, 1, &NullCBuf);
     *      }
     *      pDeviceContext->GSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     * 
     * ```
     * 
     * 
     * If you change multiple constant buffers, set the first and last constant buffers of the range to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->GSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->GSSetConstantBuffers(0, 1, &NullCBuf);
     *           pDeviceContext->GSSetConstantBuffers(3, 1, &NullCBuf);
     *      }
     *      pDeviceContext->GSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     * 
     * ```
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @param {Pointer<Integer>} pFirstConstant An array that holds the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer. Each offset must be a multiple of 16 constants.
     * @param {Pointer<Integer>} pNumConstants An array that holds the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. Each number of constants must be a multiple of 16 constants, in the range [0..4096].
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-gssetconstantbuffers1
     */
    GSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(122, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Sets the constant buffers that the pixel shader pipeline stage uses, and enables the shader to access other parts of the buffer.
     * @remarks
     * 
     * To enable the shader to access other parts of the buffer, call
     *           <b>PSSetConstantBuffers1</b> instead of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetconstantbuffers">PSSetConstantBuffers</a>.
     *           <b>PSSetConstantBuffers1</b> has additional parameters <i>pFirstConstant</i> and <i>pNumConstants</i>.
     *         
     * 
     * The runtime drops the call to <b>PSSetConstantBuffers1</b> if the numbers of constants to which <i>pNumConstants</i> points
     *           is larger than the maximum constant buffer size that is supported by shaders.
     *           The maximum constant buffer size that is supported by shaders holds 4096 constants, where each constant has four 32-bit components.
     *         
     * 
     * The values in the elements of the <i>pFirstConstant</i> and <i>pFirstConstant</i> + <i>pNumConstants</i> arrays can exceed the length of each buffer;
     *           from the shader's point of view, the constant buffer is the intersection of the actual memory allocation for the buffer and
     *           the following window (range):
     *         
     * 
     * [value in an element of <i>pFirstConstant</i>, value in an element of <i>pFirstConstant</i> + value in an element of <i>pNumConstants</i>]
     *         
     * 
     * That is, the window is the range is from (value in an element of <i>pFirstConstant</i>) to (value in an element of <i>pFirstConstant</i> + value in an element of <i>pNumConstants</i>).
     *         
     * 
     * The runtime also drops the call to <b>PSSetConstantBuffers1</b> on existing drivers that do not support this offsetting.
     *         
     * 
     * The runtime will emulate this feature for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1, 9.2, and 9.3; therefore, this feature is supported for feature level 9.1, 9.2, and 9.3.
     *           This feature is always available on new drivers for feature level 10 and higher.
     *         
     * 
     * From the shader’s point of view, element [0] in the constant buffers array is the constant at <i>pFirstConstant</i>.
     *         
     * 
     * Out of bounds access to the constant buffers from the shader to the range that is defined by <i>pFirstConstant</i> and <i>pNumConstants</i> returns 0.
     *         
     * 
     * If <i>pFirstConstant</i> and <i>pNumConstants</i> arrays are <b>NULL</b>, you get the same result as if you were binding the entire buffer into view.
     *           You get this same result if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetconstantbuffers">PSSetConstantBuffers</a> method.
     *           If the buffer is larger than the maximum constant buffer size that is supported by shaders (4096 elements), the shader can access only the first 4096 constants.
     *         
     * 
     * If either <i>pFirstConstant</i> or <i>pNumConstants</i> is <b>NULL</b>, the other parameter must also be <b>NULL</b>.
     *         
     * 
     * <h3><a id="Calling_PSSetConstantBuffers1_with_command_list_emulation"></a><a id="calling_pssetconstantbuffers1_with_command_list_emulation"></a><a id="CALLING_PSSETCONSTANTBUFFERS1_WITH_COMMAND_LIST_EMULATION"></a>Calling PSSetConstantBuffers1 with command list emulation</h3>
     * The runtime's <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-command-list">command list</a> emulation of
     *             <b>PSSetConstantBuffers1</b> sometimes doesn't actually change the offsets or sizes for the arrays of constant buffers.
     *             This behavior occurs when <b>PSSetConstantBuffers1</b> doesn't effectively change the constant buffers at the beginning and end of the range of slots that you set to update.
     *             This section shows how to work around this behavior.
     *           
     * 
     * Here is the code to check whether either the runtime emulates command lists or the driver supports command lists:
     *             
     * 
     * 
     * ```cpp
     * 
     *      HRESULT hr = S_OK;
     *      bool needWorkaround = false;
     *      D3D11_DEVICE_CONTEXT_TYPE contextType = pDeviceContext->GetType();
     * 
     *      if( D3D11_DEVICE_CONTEXT_DEFERRED == contextType)
     *      {
     *           D3D11_FEATURE_DATA_THREADING threadingCaps = { FALSE, FALSE };
     * 
     *           hr = pDevice->CheckFeatureSupport( D3D11_FEATURE_THREADING, &threadingCaps, sizeof(threadingCaps) );
     *           if( SUCCEEDED(hr) && !threadingCaps.DriverCommandLists )
     *           {
     *                needWorkaround = true; // the runtime emulates command lists.
     *           }
     *      }
     * 
     * ```
     * 
     * 
     * If the runtime emulates command lists, you need to use one of these code snippets:
     *           
     * 
     * If you change the offset and size on only a single constant buffer, set the constant buffer to <b>NULL</b> first:
     *             
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->PSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->PSSetConstantBuffers(0, 1, &NullCBuf);
     *      }
     *      pDeviceContext->PSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     * 
     * ```
     * 
     * 
     * If you change multiple constant buffers, set the first and last constant buffers of the range to <b>NULL</b> first:
     *             
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->PSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->PSSetConstantBuffers(0, 1, &NullCBuf);
     *           pDeviceContext->PSSetConstantBuffers(3, 1, &NullCBuf);
     *      }
     *      pDeviceContext->PSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     * 
     * ```
     * 
     * 
     * @param {Integer} StartSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into the device's zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * Array of constant buffers being given to the device.
     * @param {Pointer<Integer>} pFirstConstant Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array that holds the offsets into the buffers that  <i>ppConstantBuffers</i> specifies.
     *             Each offset specifies where, from the shader's point of view, each constant buffer starts.
     *             Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).
     *             Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer.
     *             Each offset must be a multiple of 16 constants.
     * @param {Pointer<Integer>} pNumConstants Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array that holds the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies.
     *             Each number specifies the number of constants that are contained in the constant buffer that the shader uses.
     *             Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array.
     *             Each number of constants must be a multiple of 16 constants, in the range [0..4096].
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-pssetconstantbuffers1
     */
    PSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(123, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Sets the constant buffers that the compute-shader stage uses.
     * @remarks
     * 
     * The runtime drops the call to <b>CSSetConstantBuffers1</b> if the number of constants to which <i>pNumConstants</i> points is larger than the maximum constant buffer size that is supported by shaders (4096 constants).  The values in the elements of the <i>pFirstConstant</i> and <i>pFirstConstant</i> + <i>pNumConstants</i> arrays can exceed the length of each buffer; from the shader's point of view, the constant buffer is the intersection of the actual memory allocation for the buffer and the window [value in an element of <i>pFirstConstant</i>, value in an element of <i>pFirstConstant</i> + value in an element of <i>pNumConstants</i>]. The runtime also drops the call to <b>CSSetConstantBuffers1</b> on existing drivers that don't support this offsetting.
     * 
     * The runtime will emulate this feature for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9.1, 9.2, and 9.3; therefore, this feature is supported for feature level 9.1, 9.2, and 9.3.  This feature is always available on new drivers for feature level 10 and higher.
     * 
     * From the shader’s point of view, element [0] in the constant buffers array is the constant at <i>pFirstConstant</i>.
     * 
     * Out of bounds access to the constant buffers from the shader to the range that is defined by <i>pFirstConstant</i> and <i>pNumConstants</i> returns 0. 
     * 
     * If <i>pFirstConstant</i> and <i>pNumConstants</i> arrays are <b>NULL</b>, you get the same result as if you were binding the entire buffer into view.  You get this same result if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetconstantbuffers">CSSetConstantBuffers</a> method. If the buffer is larger than the maximum constant buffer size that is supported by shaders (4096 elements), the shader can access only the first 4096 constants.
     * 
     * If either <i>pFirstConstant</i> or <i>pNumConstants</i> is <b>NULL</b>, the other parameter must also be <b>NULL</b>.
     * 
     * <h3><a id="Calling_CSSetConstantBuffers1_with_command_list_emulation"></a><a id="calling_cssetconstantbuffers1_with_command_list_emulation"></a><a id="CALLING_CSSETCONSTANTBUFFERS1_WITH_COMMAND_LIST_EMULATION"></a>Calling CSSetConstantBuffers1 with command list emulation</h3>
     * The runtime's <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-command-list">command list</a> emulation of <b>CSSetConstantBuffers1</b> sometimes doesn't actually change the offsets or sizes for the arrays of constant buffers. This behavior occurs when 
     * 
     * <b>CSSetConstantBuffers1</b> doesn't effectively change the constant buffers at the beginning and end of the range of slots that you set to update. This section shows how to work around this 
     * 
     * behavior.
     * 
     * Here is the code to check whether either the runtime emulates command lists or the driver supports command lists:
     * 
     * 
     * 
     * ```cpp
     * 
     *      HRESULT hr = S_OK;
     *      bool needWorkaround = false;
     *      D3D11_DEVICE_CONTEXT_TYPE contextType = pDeviceContext->GetType();
     * 
     *      if( D3D11_DEVICE_CONTEXT_DEFERRED == contextType)
     *      {
     *           D3D11_FEATURE_DATA_THREADING threadingCaps = { FALSE, FALSE };
     * 
     *           hr = pDevice->CheckFeatureSupport( D3D11_FEATURE_THREADING, &threadingCaps, sizeof(threadingCaps) );
     *           if( SUCCEEDED(hr) && !threadingCaps.DriverCommandLists )
     *           {
     *                needWorkaround = true; // the runtime emulates command lists.
     *           }
     *      }
     * 
     * ```
     * 
     * 
     * If the runtime emulates command lists, you need to use one of these code snippets:
     * 
     * 
     * If you change the offset and size on only a single constant buffer, set the constant buffer to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->CSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->CSSetConstantBuffers(0, 1, &NullCBuf);
     *      }
     *      pDeviceContext->CSSetConstantBuffers1(0, 1, &CBuf, &Offset, &Count);
     * 
     * ```
     * 
     * 
     * If you change multiple constant buffers, set the first and last constant buffers of the range to <b>NULL</b> first:
     * 
     * 
     * 
     * ```cpp
     * 
     *      pDeviceContext->CSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     *      if( needWorkaround )
     *      {
     *           // Workaround for command list emulation
     *           pDeviceContext->CSSetConstantBuffers(0, 1, &NullCBuf);
     *           pDeviceContext->CSSetConstantBuffers(3, 1, &NullCBuf);
     *      }
     *      pDeviceContext->CSSetConstantBuffers1(0, 4, &CBufs, &Offsets, &Counts);
     * 
     * ```
     * 
     * 
     * @param {Integer} StartSlot Index into the zero-based array to begin setting constant buffers to (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to set (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffers (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>) being given to the device.
     * @param {Pointer<Integer>} pFirstConstant An array that holds the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 16 indicates that the start of the associated constant buffer is 256 bytes into the constant buffer. Each offset must be a multiple of 16 constants.
     * @param {Pointer<Integer>} pNumConstants An array that holds the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. Each number of constants must be a multiple of 16 constants, in the range [0..4096].
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-cssetconstantbuffers1
     */
    CSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(124, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Gets the constant buffers that the vertex shader pipeline stage uses.
     * @remarks
     * 
     * If no buffer is bound at a slot, <i>pFirstConstant</i> and <i>pNumConstants</i> are <b>NULL</b> for that slot.
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffer interface pointers to be returned by the method.
     * @param {Pointer<Integer>} pFirstConstant A pointer to an array that receives the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 2 indicates that the start of the associated constant buffer is 32 bytes into the constant buffer. The runtime sets <i>pFirstConstant</i> to <b>NULL</b> if the buffers do not have offsets.
     * @param {Pointer<Integer>} pNumConstants A pointer to an array that receives the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. The runtime sets <i>pNumConstants</i> to <b>NULL</b> if it doesn't specify the numbers of constants in each buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-vsgetconstantbuffers1
     */
    VSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(125, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Gets the constant buffers that the hull-shader stage uses.
     * @remarks
     * 
     * If no buffer is bound at a slot, <i>pFirstConstant</i> and <i>pNumConstants</i> are <b>NULL</b> for that slot.
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffer interface pointers to be returned by the method.
     * @param {Pointer<Integer>} pFirstConstant A pointer to an array that receives the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 2 indicates that the start of the associated constant buffer is 32 bytes into the constant buffer. The runtime sets <i>pFirstConstant</i> to <b>NULL</b> if the buffers do not have offsets.
     * @param {Pointer<Integer>} pNumConstants A pointer to an array that receives the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. The runtime sets <i>pNumConstants</i> to <b>NULL</b> if it doesn't specify the numbers of constants in each buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-hsgetconstantbuffers1
     */
    HSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(126, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Gets the constant buffers that the domain-shader stage uses.
     * @remarks
     * 
     * If no buffer is bound at a slot, <i>pFirstConstant</i> and <i>pNumConstants</i> are <b>NULL</b> for that slot.
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffer interface pointers to be returned by the method.
     * @param {Pointer<Integer>} pFirstConstant A pointer to an array that receives the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 2 indicates that the start of the associated constant buffer is 32 bytes into the constant buffer. The runtime sets <i>pFirstConstant</i> to <b>NULL</b> if the buffers do not have offsets.
     * @param {Pointer<Integer>} pNumConstants A pointer to an array that receives the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. The runtime sets <i>pNumConstants</i> to <b>NULL</b> if it doesn't specify the numbers of constants in each buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-dsgetconstantbuffers1
     */
    DSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(127, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Gets the constant buffers that the geometry shader pipeline stage uses.
     * @remarks
     * 
     * If no buffer is bound at a slot, <i>pFirstConstant</i> and <i>pNumConstants</i> are <b>NULL</b> for that slot.
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffer interface pointers to be returned by the method.
     * @param {Pointer<Integer>} pFirstConstant A pointer to an array that receives the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 2 indicates that the start of the associated constant buffer is 32 bytes into the constant buffer. The runtime sets <i>pFirstConstant</i> to <b>NULL</b> if the buffers do not have offsets.
     * @param {Pointer<Integer>} pNumConstants A pointer to an array that receives the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. The runtime sets <i>pNumConstants</i> to <b>NULL</b> if it doesn't specify the numbers of constants in each buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-gsgetconstantbuffers1
     */
    GSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(128, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Gets the constant buffers that the pixel shader pipeline stage uses.
     * @remarks
     * 
     * If no buffer is bound at a slot, <i>pFirstConstant</i> and <i>pNumConstants</i> are <b>NULL</b> for that slot.
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffer interface pointers to be returned by the method.
     * @param {Pointer<Integer>} pFirstConstant A pointer to an array that receives the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 2 indicates that the start of the associated constant buffer is 32 bytes into the constant buffer. The runtime sets <i>pFirstConstant</i> to <b>NULL</b> if the buffers do not have offsets.
     * @param {Pointer<Integer>} pNumConstants A pointer to an array that receives the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. The runtime sets <i>pNumConstants</i> to <b>NULL</b> if it doesn't specify the numbers of constants in each buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-psgetconstantbuffers1
     */
    PSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(129, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Gets the constant buffers that the compute-shader stage uses.
     * @remarks
     * 
     * If no buffer is bound at a slot, <i>pFirstConstant</i> and <i>pNumConstants</i> are <b>NULL</b> for that slot.
     * 
     * 
     * @param {Integer} StartSlot Index into the device's zero-based array to begin retrieving constant buffers from (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - 1).
     * @param {Integer} NumBuffers Number of buffers to retrieve (ranges from 0 to D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT - <i>StartSlot</i>).
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers Array of constant buffer interface pointers to be returned by the method.
     * @param {Pointer<Integer>} pFirstConstant A pointer to an array that receives the offsets into the buffers that  <i>ppConstantBuffers</i> specifies. Each offset specifies where, from the shader's point of view, each constant buffer starts.  Each offset is measured in shader constants, which are 16 bytes (4*32-bit components).  Therefore, an offset of 2 indicates that the start of the associated constant buffer is 32 bytes into the constant buffer. The runtime sets <i>pFirstConstant</i> to <b>NULL</b> if the buffers do not have offsets.
     * @param {Pointer<Integer>} pNumConstants A pointer to an array that receives the numbers of constants in the buffers that  <i>ppConstantBuffers</i> specifies. Each number specifies the number of constants that are contained in the constant buffer that the shader uses. Each number of constants starts from its respective offset that is specified in the <i>pFirstConstant</i> array. The runtime sets <i>pNumConstants</i> to <b>NULL</b> if it doesn't specify the numbers of constants in each buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-csgetconstantbuffers1
     */
    CSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        pFirstConstantMarshal := pFirstConstant is VarRef ? "uint*" : "ptr"
        pNumConstantsMarshal := pNumConstants is VarRef ? "uint*" : "ptr"

        ComCall(130, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, pFirstConstantMarshal, pFirstConstant, pNumConstantsMarshal, pNumConstants)
    }

    /**
     * Activates the given context state object and changes the current device behavior to Direct3D 11, Direct3D 10.1, or Direct3D 10.
     * @remarks
     * 
     * <b>SwapDeviceContextState</b> changes device behavior. This device behavior depends on the emulated interface that you passed to the <i>EmulatedInterface</i> parameter of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate">ID3D11Device1::CreateDeviceContextState</a> method when you created the context state object. 
     * 
     * <b>SwapDeviceContextState</b> is not supported on a deferred context.
     * 
     * <b>SwapDeviceContextState</b> disables the incompatible device interfaces <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a>. When a context state object is active, the runtime disables certain methods on the device and context interfaces. A context state object that is created with <c>__uuidof(ID3D11Device1)</code> or <code>__uuidof(ID3D11Device)</code> turns off most of the Direct3D 10 device interfaces. A context state object that is created with <code>__uuidof(ID3D10Device1)</code> or <code>__uuidof(ID3D10Device)</c> turns off most of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> methods.
     * For more information about this behavior, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate">ID3D11Device1::CreateDeviceContextState</a>.
     * 
     * <b>SwapDeviceContextState</b> activates the context state object specified by <i>pState</i>. This means that the device behaviors that are associated with the context state object's feature level and compatible interface are activated on the Direct3D device until the next call to <b>SwapDeviceContextState</b>. In addition, any state that was saved when this context state object was last active is now reactivated, so that the previous state is replaced.
     * 
     * <b>SwapDeviceContextState</b> sets <i>ppPreviousState</i> to the most recently activated context state object. The object allows the caller to save and then later restore the previous device state. This behavior is useful in a plug-in architecture such as Direct2D that shares a Direct3D device with its plug-ins. A Direct2D interface can use context state objects to save and restore the application's state.
     * 
     * If the caller did not previously call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate">ID3D11Device1::CreateDeviceContextState</a> method to create a previous context state object, <b>SwapDeviceContextState</b> sets <i>ppPreviousState</i> to the default context state object. In either case, usage of <b>SwapDeviceContextState</b> is the same.
     * 
     * The feature level that is specified by the application, and that is chosen by the context state object from the acceptable list that the application supplies to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate">ID3D11Device1::CreateDeviceContextState</a>, controls the feature level of the immediate context whenever the context state object is active. Because the Direct3D 11 device is free-threaded, the device methods cannot query the current immediate context feature level. Instead, the device runs at a feature level that is the maximum of all previously created context state objects' feature levels. This means that the device's feature level can increase dynamically.
     * 
     * The feature level of the context state object controls the functionality available from the immediate context. However, to maintain the free-threaded contract of the Direct3D 11 device methods—the resource-creation methods in particular—the upper-bound feature level of all created context state objects controls the set of resources that the device creates.
     * 
     * Because the context state object interface is published by the immediate context, the interface requires the same threading model as the immediate context. Specifically, <b>SwapDeviceContextState</b> is single-threaded with respect to the other immediate context methods and with respect to the equivalent methods of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>.
     * 
     * Crucially, because only one of the Direct3D 10 or Direct3D 11 ref-count behaviors can be available at a time, one of the Direct3D 10 and Direct3D 11 interfaces must break its ref-count contract. To avoid this situation, the activation of a context state object turns off the incompatible version interface. Also, if you call a method of an incompatible version interface, the call silently fails if the method has  return type <b>void</b>, returns an <b>HRESULT</b> value of <b>E_INVALIDARG</b>, or sets any out parameter to <b>NULL</b>.
     * 
     * When you switch from Direct3D 11 mode to either Direct3D 10 mode or Direct3D 10.1 mode, the binding behavior of the device changes. Specifically, the final release of a resource induces unbind in Direct3D 10 mode or Direct3D 10.1 mode. During final release an application releases all of the resource's references, including indirect references such as the linkage from view to resource, and the linkage from context state object to any of the context state object's bound resources. Any bound resource to which the application has no reference is unbound and destroyed, in order to maintain the Direct3D 10 behavior.
     * 
     * <b>SwapDeviceContextState</b> does not affect any state that <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videocontext">ID3D11VideoContext</a> sets. 
     * 
     * Command lists that are generated by deferred contexts do not hold a reference to context state objects and are not affected by future updates to context state objects.
     * 
     * No asynchronous objects are affected by <b>SwapDeviceContextState</b>. For example, if a query is active before a call to <b>SwapDeviceContextState</b>, it is still active after the call.
     * 
     * 
     * @param {ID3DDeviceContextState} pState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate">ID3DDeviceContextState</a> interface for the context state object that was previously created through the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate">ID3D11Device1::CreateDeviceContextState</a> method. If <b>SwapDeviceContextState</b> is called with <i>pState</i> set to <b>NULL</b>, the call has no effect.
     * @param {Pointer<ID3DDeviceContextState>} ppPreviousState A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate">ID3DDeviceContextState</a> interface for the previously-activated context state object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-swapdevicecontextstate
     */
    SwapDeviceContextState(pState, ppPreviousState) {
        ComCall(131, this, "ptr", pState, "ptr*", ppPreviousState)
    }

    /**
     * Sets all the elements in a resource view to one value.
     * @remarks
     * 
     * <b>ClearView</b> works only on render-target views (RTVs), depth/stencil views (DSVs) on depth-only resources (resources with no stencil component), unordered-access views (UAVs), or any video view of a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2d">Texture2D</a> surface. The runtime drops invalid calls. Empty rectangles in the <i>pRect</i> array are a no-op. A rectangle is empty if the top value equals the bottom value or the left value equals the right value.
     * 
     * <b>ClearView</b> doesn’t support 3D textures.
     * 
     * <b>ClearView</b> applies the same color value to all array slices in a view; all rectangles in the <i>pRect</i> array correspond to each array slice.  The <i>pRect</i> array of rectangles is a set of areas to clear on a single surface.  If the view is an array, <b>ClearView</b> clears all the rectangles on each array slice individually.
     * 
     * When you apply rectangles to buffers, set the top value to 0 and the bottom value to 1 and set the left value and right value to describe the extent within the buffer. When the top value equals the bottom value or the left value equals the right value, the rectangle is empty and a no-op is achieved.
     * 
     * The driver converts and clamps color values to the destination format as appropriate per Direct3D conversion rules.  For example, if the format of the view is <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R8G8B8A8_UNORM</a>, the driver clamps inputs to 0.0f to 1.0f (+INF -&gt; 1.0f (0XFF)/NaN -&gt; 0.0f).
     * 
     * If the format is integer, such as <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R8G8B8A8_UINT</a>, the runtime interprets inputs as integral floats. Therefore, 235.0f maps to 235 (rounds to zero, out of range/INF values clamp to target range, and NaN to 0).
     * 
     * Here are the color mappings:
     * 
     * <ul>
     * <li>Color[0]: R (or Y for video)</li>
     * <li>Color[1]: G (or U/Cb for video)</li>
     * <li>Color[2]: B (or V/Cr for video)</li>
     * <li>Color[3]: A</li>
     * </ul>
     * For video views with YUV or YCbBr formats, <b>ClearView</b> doesn't convert color values. In situations where the format name doesn’t indicate _UNORM,  _UINT, and so on, <b>ClearView</b> assumes _UINT. Therefore, 235.0f maps to 235 (rounds to zero, out of range/INF values clamp to target range, and NaN to 0).
     * 
     * 
     * @param {ID3D11View} pView A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11view">ID3D11View</a> interface that represents the resource view to clear.
     * @param {Pointer<Float>} Color A 4-component array that represents the color to use to clear the resource view.
     * @param {Pointer<RECT>} pRect An array of <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-rect">D3D11_RECT</a> structures for the rectangles in the resource view to clear. If <b>NULL</b>, <b>ClearView</b> clears the entire surface.
     * @param {Integer} NumRects Number of rectangles in the array that the  <i>pRect</i> parameter specifies.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-clearview
     */
    ClearView(pView, Color, pRect, NumRects) {
        ColorMarshal := Color is VarRef ? "float*" : "ptr"

        ComCall(132, this, "ptr", pView, ColorMarshal, Color, "ptr", pRect, "uint", NumRects)
    }

    /**
     * Discards the specified elements in a resource view from the device context.
     * @remarks
     * 
     * <b>DiscardView1</b> informs the graphics processing unit (GPU) that the existing content in the specified elements in the resource view that <i>pResourceView</i> points to is no longer needed.  The view can be an SRV, RTV, UAV, or DSV.  <b>DiscardView1</b> is a variation on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardresource">DiscardResource</a> method.  <b>DiscardView1</b> allows you to discard elements of a subset of a resource that is in a view (such as elements of a single miplevel).  More importantly, <b>DiscardView1</b> provides a convenience because often views are what are being bound and unbound at the pipeline.  Some pipeline bindings do not have views, such as stream output.  In that situation, <b>DiscardResource</b> can do the job for any resource.
     * 
     * 
     * @param {ID3D11View} pResourceView Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11view">ID3D11View</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11view">ID3D11View</a> interface for the resource view to discard. The resource that underlies the view must have been created with usage <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DEFAULT</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE_DYNAMIC</a>, otherwise the runtime drops the call to <b>DiscardView1</b>; if the debug layer is enabled, the runtime returns an error message.
     * @param {Pointer<RECT>} pRects Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-rect">D3D11_RECT</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-rect">D3D11_RECT</a> structures for the rectangles in the resource view to discard. If <b>NULL</b>, <b>DiscardView1</b> discards the entire view and behaves the same as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardview">DiscardView</a>.
     * @param {Integer} NumRects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of rectangles in the array that the  <i>pRects</i> parameter specifies.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardview1
     */
    DiscardView1(pResourceView, pRects, NumRects) {
        ComCall(133, this, "ptr", pResourceView, "ptr", pRects, "uint", NumRects)
    }
}

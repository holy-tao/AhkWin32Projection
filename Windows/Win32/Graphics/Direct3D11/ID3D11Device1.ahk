#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext1.ahk
#Include .\ID3D11BlendState1.ahk
#Include .\ID3D11RasterizerState1.ahk
#Include .\ID3D11Device.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device1 adds new methods to those in ID3D11Device.
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nn-d3d11_1-id3d11device1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device1 extends ID3D11Device{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device1
     * @type {Guid}
     */
    static IID => Guid("{a04bfb29-08ef-43d6-a49c-a9bdbdcbe686}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImmediateContext1", "CreateDeferredContext1", "CreateBlendState1", "CreateRasterizerState1", "CreateDeviceContextState", "OpenSharedResource1", "OpenSharedResourceByName"]

    /**
     * Gets an immediate context, which can play back command lists. (ID3D11Device1.GetImmediateContext1)
     * @remarks
     * <b>GetImmediateContext1</b> returns an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1">ID3D11DeviceContext1</a> object that represents an immediate context. You can use this immediate context to perform rendering that you want immediately submitted to a device. For most applications, an immediate context is the primary object that is used to draw your scene.
     * 
     * <b>GetImmediateContext1</b> increments the reference count of the immediate context by one. So, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer when you are done with it to avoid a memory leak.
     * @param {Pointer<ID3D11DeviceContext1>} ppImmediateContext Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1">ID3D11DeviceContext1</a> interface pointer is initialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nf-d3d11_1-id3d11device1-getimmediatecontext1
     */
    GetImmediateContext1(ppImmediateContext) {
        ComCall(43, this, "ptr*", ppImmediateContext)
    }

    /**
     * Creates a deferred context, which can record command lists. (ID3D11Device1.CreateDeferredContext1)
     * @remarks
     * A deferred context is a thread-safe context that you can use to record graphics commands on a thread other than the main rendering thread.
     *           By using a deferred context, you can record graphics commands into a command list that is encapsulated by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a> interface.
     *           After you record all scene items, you can then submit them to the main render thread for final rendering.
     *           In this manner, you can perform rendering tasks concurrently across multiple threads and potentially improve performance in multi-core CPU scenarios.
     *         
     * 
     * You can create multiple deferred contexts.
     *         
     * 
     * <div class="alert"><b>Note</b>  If you use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_SINGLETHREADED</a> value to create the device that is represented by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a>, the <b>CreateDeferredContext1</b> method will fail, and you will not be able to create a deferred context.
     *         </div>
     * <div> </div>
     * For more information about deferred contexts, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-render">Immediate and Deferred Rendering</a>.
     *         
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Integer} ContextFlags Reserved for future use.
     *             Pass 0.
     * @returns {Pointer<ID3D11DeviceContext1>} Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1">ID3D11DeviceContext1</a> interface pointer is initialized.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nf-d3d11_1-id3d11device1-createdeferredcontext1
     */
    CreateDeferredContext1(ContextFlags) {
        result := ComCall(44, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppDeferredContext
    }

    /**
     * Creates a blend-state object that encapsulates blend state for the output-merger stage and allows the configuration of logic operations.
     * @remarks
     * The logical operations (those that enable bitwise logical operations between pixel shader output and render target contents, refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_render_target_blend_desc1">D3D11_RENDER_TARGET_BLEND_DESC1</a> ) are only available on certain feature levels; call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">CheckFeatureSupport</a> with D3D11_FEATURE_D3D11_OPTIONS set, to ensure support by checking the boolean field  <i>OutputMergerLogicOp</i> of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options">D3D11_FEATURE_DATA_D3D11_OPTIONS</a>.
     * 
     * An app can create up to 4096 unique blend-state objects. For each object created, the runtime checks to see if a previous object 
     *       has the same state. If such a previous object exists, the runtime will return a pointer to previous instance instead of creating a duplicate object.
     * @param {Pointer<D3D11_BLEND_DESC1>} pBlendStateDesc A pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_blend_desc1">D3D11_BLEND_DESC1</a> structure that describes blend state.
     * @returns {Pointer<ID3D11BlendState1>} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11blendstate1">ID3D11BlendState1</a> interface for the blend-state object created.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nf-d3d11_1-id3d11device1-createblendstate1
     */
    CreateBlendState1(pBlendStateDesc) {
        result := ComCall(45, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppBlendState
    }

    /**
     * Creates a rasterizer state object that informs the rasterizer stage how to behave and forces the sample count while UAV rendering or rasterizing. (ID3D11Device1.CreateRasterizerState1)
     * @remarks
     * An app can create up to 4096 unique rasterizer state objects. For each object created, the runtime checks to see if a previous object 
     *       has the same state. If such a previous object exists, the runtime will return a pointer to previous instance instead of creating a duplicate object.
     * @param {Pointer<D3D11_RASTERIZER_DESC1>} pRasterizerDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-cd3d11_rasterizer_desc1">D3D11_RASTERIZER_DESC1</a> structure that describes the  rasterizer state.
     * @returns {Pointer<ID3D11RasterizerState1>} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11rasterizerstate1">ID3D11RasterizerState1</a> interface for the rasterizer state object created.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nf-d3d11_1-id3d11device1-createrasterizerstate1
     */
    CreateRasterizerState1(pRasterizerDesc) {
        result := ComCall(46, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRasterizerState
    }

    /**
     * Creates a context state object that holds all Microsoft Direct3D state and some Direct3D behavior.
     * @remarks
     * The  <b>REFIID</b> value of the emulated interface is a GUID obtained by use of the <b>__uuidof</b> operator. For example, <c>__uuidof(ID3D11Device)</c> gets the GUID of the interface to a Microsoft Direct3D 11 device.
     *         
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-swapdevicecontextstate">ID3D11DeviceContext1::SwapDeviceContextState</a> method to activate the context state object. When the context state object is active, the device behaviors that are associated with both the context state object's feature level and its compatible interface are activated on the Direct3D device until the next call to <b>SwapDeviceContextState</b>.
     *         
     * 
     * When a context state object is active, the runtime disables certain methods on the device and context interfaces. For example, a context state object that is created with <c>__uuidof(ID3D11Device)</code> will cause the runtime to turn off most of the Microsoft Direct3D 10 device interfaces, and a context state object that is created with <code>__uuidof(ID3D10Device1)</code> or <code>__uuidof(ID3D10Device)</c> will cause the runtime to turn off most of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> methods.
     *           This behavior ensures that a user of either emulated interface cannot set device state that the other emulated interface is unable to express. This restriction helps guarantee that the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a> emulated interface accurately reflects the full state of the pipeline and that the emulated interface will not operate contrary to its original interface definition.
     *         
     * 
     * For example, suppose the tessellation stage is made active through the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface
     *           when you create the device through <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>,  instead of through the Direct3D 10 equivalents. Because  the Direct3D 11 context is active, a Direct3D 10 interface is inactive when you first retrieve it via <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. This means that you cannot  immediately pass a Direct3D 10 interface that you retrieved from a Direct3D 11 device to a function. You must first call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-swapdevicecontextstate">SwapDeviceContextState</a> to activate a Direct3D 10-compatible context state object.
     *         
     * 
     * The following table shows the methods that are active and inactive for each emulated interface.<table>
     * <tr>
     * <th> Emulated interface </th>
     * <th>Active device or immediate context  interfaces </th>
     * <th>Inactive device or immediate context  interfaces</th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> or
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> +
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice1">IDXGIDevice1</a> +
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgidevice2">IDXGIDevice2</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10multithread">ID3D10Multithread</a>
     * 
     * 
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a> or
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> +
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice1">IDXGIDevice1</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10multithread">ID3D10Multithread</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> (As published by the immediate context. The Direct3D 10 or Microsoft Direct3D 10.1 emulated interface has no effect on deferred contexts.)
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The following table shows the immediate context methods that the runtime disables when the indicated context state objects are active.<table>
     * <tr>
     * <th>Methods of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> when <c>__uuidof(ID3D10Device1)</code> or <code>__uuidof(ID3D10Device)</c> is active
     *               </th>
     * <th>Methods of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a> when <c>__uuidof(ID3D11Device)</c> is active
     *               </th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cleardepthstencilview">ClearDepthStencilView</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-cleardepthstencilview">ClearDepthStencilView</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearrendertargetview">ClearRenderTargetView</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-clearrendertargetview">ClearRenderTargetView</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearstate">ClearState</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-clearstate">ClearState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewuint">ClearUnorderedAccessViewUint</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearunorderedaccessviewfloat">ClearUnorderedAccessViewFloat</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copyresource">CopyResource</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copyresource">CopyResource</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copystructurecount">CopyStructureCount</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">CopySubresourceRegion</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copysubresourceregion">CopySubresourceRegion</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-csgetconstantbuffers">CSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-csgetsamplers">CSGetSamplers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-csgetshader">CSGetShader</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-csgetshaderresources">CSGetShaderResources</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-csgetunorderedaccessviews">CSGetUnorderedAccessViews</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetconstantbuffers">CSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetsamplers">CSSetSamplers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetshader">CSSetShader</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetshaderresources">CSSetShaderResources</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetunorderedaccessviews">CSSetUnorderedAccessViews</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch">Dispatch</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatchindirect">DispatchIndirect</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createblendstate">CreateBlendState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-draw">Draw</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-draw">Draw</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawauto">DrawAuto</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawauto">DrawAuto</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexed">DrawIndexed</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawindexed">DrawIndexed</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstanced">DrawIndexedInstanced</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawindexedinstanced">DrawIndexedInstanced</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstancedindirect">DrawIndexedInstancedIndirect</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstanced">DrawInstanced</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawinstanced">DrawInstanced</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstancedindirect">DrawInstancedIndirect</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetconstantbuffers">DSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetsamplers">DSGetSamplers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetshader">DSGetShader</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dsgetshaderresources">DSGetShaderResources</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dssetconstantbuffers">DSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dssetsamplers">DSSetSamplers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dssetshader">DSSetShader</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dssetshaderresources">DSSetShaderResources</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-executecommandlist">ExecuteCommandList</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-finishcommandlist">FinishCommandList</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">Flush</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-flush">Flush</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-generatemips">GenerateMips</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-generatemips">GenerateMips</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getpredication">GetPredication</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-getpredication">GetPredication</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getresourceminlod">GetResourceMinLOD</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gettype">GetType</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gettextfiltersize">GetTextFilterSize</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetconstantbuffers">GSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gsgetconstantbuffers">GSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetsamplers">GSGetSamplers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gsgetsamplers">GSGetSamplers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetshader">GSGetShader</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gsgetshader">GSGetShader</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gsgetshaderresources">GSGetShaderResources</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gsgetshaderresources">GSGetShaderResources</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetconstantbuffers">GSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetconstantbuffers">GSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetsamplers">GSSetSamplers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetsamplers">GSSetSamplers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshader">GSSetShader</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetshader">GSSetShader</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetshaderresources">GSSetShaderResources</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetshaderresources">GSSetShaderResources</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetconstantbuffers">HSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetsamplers">HSGetSamplers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetshader">HSGetShader</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hsgetshaderresources">HSGetShaderResources</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetconstantbuffers">HSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetsamplers">HSSetSamplers</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetshader">HSSetShader</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetshaderresources">HSSetShaderResources</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iagetindexbuffer">IAGetIndexBuffer</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iagetindexbuffer">IAGetIndexBuffer</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iagetinputlayout">IAGetInputLayout</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iagetinputlayout">IAGetInputLayout</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iagetprimitivetopology">IAGetPrimitiveTopology</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iagetprimitivetopology">IAGetPrimitiveTopology</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iagetvertexbuffers">IAGetVertexBuffers</a>
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iagetvertexbuffers">IAGetVertexBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetindexbuffer">IASetIndexBuffer</a>
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetindexbuffer">IASetIndexBuffer</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetinputlayout">IASetInputLayout</a>
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetinputlayout">IASetInputLayout</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetprimitivetopology">IASetPrimitiveTopology</a>
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetprimitivetopology">IASetPrimitiveTopology</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetvertexbuffers">IASetVertexBuffers</a>
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-iasetvertexbuffers">IASetVertexBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omgetblendstate">OMGetBlendState</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omgetblendstate">OMGetBlendState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omgetdepthstencilstate">OMGetDepthStencilState</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omgetdepthstencilstate">OMGetDepthStencilState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omgetrendertargets">OMGetRenderTargets</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omgetrendertargets">OMGetRenderTargets</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omgetrendertargetsandunorderedaccessviews">OMGetRenderTargetsAndUnorderedAccessViews</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate">OMSetBlendState</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetblendstate">OMSetBlendState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetdepthstencilstate">OMSetDepthStencilState</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetdepthstencilstate">OMSetDepthStencilState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">OMSetRenderTargets</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetrendertargets">OMSetRenderTargets</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargetsandunorderedaccessviews">OMSetRenderTargetsAndUnorderedAccessViews</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-psgetconstantbuffers">PSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-psgetconstantbuffers">PSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-psgetsamplers">PSGetSamplers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-psgetsamplers">PSGetSamplers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-psgetshader">PSGetShader</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-psgetshader">PSGetShader</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-psgetshaderresources">PSGetShaderResources</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-psgetshaderresources">PSGetShaderResources</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetconstantbuffers">PSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetconstantbuffers">PSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetsamplers">PSSetSamplers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetsamplers">PSSetSamplers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshader">PSSetShader</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetshader">PSSetShader</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetshaderresources">PSSetShaderResources</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetshaderresources">PSSetShaderResources</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-resolvesubresource">ResolveSubresource</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-resolvesubresource">ResolveSubresource</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rsgetscissorrects">RSGetScissorRects</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rsgetscissorrects">RSGetScissorRects</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rsgetstate">RSGetState</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rsgetstate">RSGetState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rsgetviewports">RSGetViewports</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rsgetviewports">RSGetViewports</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetscissorrects">RSSetScissorRects</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rssetscissorrects">RSSetScissorRects</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetstate">RSSetState</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rssetstate">RSSetState</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetviewports">RSSetViewports</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rssetviewports">RSSetViewports</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-setpredication">SetPredication</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-setpredication">SetPredication</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-setresourceminlod">SetResourceMinLOD</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-settextfiltersize">SetTextFilterSize</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-sogettargets">SOGetTargets</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-sogettargets">SOGetTargets</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-sosettargets">SOSetTargets</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-sosettargets">SOSetTargets</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-updatesubresource">UpdateSubresource</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-updatesubresource">UpdateSubresource</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetconstantbuffers">VSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vsgetconstantbuffers">VSGetConstantBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetsamplers">VSGetSamplers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vsgetsamplers">VSGetSamplers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetshader">VSGetShader</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vsgetshader">VSGetShader</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vsgetshaderresources">VSGetShaderResources</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vsgetshaderresources">VSGetShaderResources</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetconstantbuffers">VSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetconstantbuffers">VSSetConstantBuffers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetsamplers">VSSetSamplers</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetsamplers">VSSetSamplers</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshader">VSSetShader</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshader">VSSetShader</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources">VSSetShaderResources</a>
     * 
     * 
     * </td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshaderresources">VSSetShaderResources</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The following table shows the immediate context methods that the runtime does not disable when the indicated context state objects are active.<table>
     * <tr>
     * <th>Methods of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> when <c>__uuidof(ID3D10Device1)</code> or <code>__uuidof(ID3D10Device)</c> is active
     *               </th>
     * <th>Methods of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a> when <c>__uuidof(ID3D11Device)</c> is active
     *               </th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">Begin</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">End</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-getcreationflags">GetCreationFlags</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-getprivatedata">GetPrivateData</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getcontextflags">GetContextFlags</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">GetData</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">Map</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-unmap">Unmap</a>
     * 
     * 
     * </td>
     * <td></td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The following table shows the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a> interface methods that the runtime does not disable because they are not immediate context methods.<table>
     * <tr>
     * <th>Methods of <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>
     * </th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-checkcounter">CheckCounter</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-checkcounterinfo">CheckCounterInfo</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Create*, like <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createquery">CreateQuery</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-getdeviceremovedreason">GetDeviceRemovedReason</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-getexceptionmode">GetExceptionMode</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-opensharedresource">OpenSharedResource</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-setexceptionmode">SetExceptionMode</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-setprivatedata">SetPrivateData</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-setprivatedatainterface">SetPrivateDataInterface</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_1_create_device_context_state_flag">D3D11_1_CREATE_DEVICE_CONTEXT_STATE_FLAG</a> 
     *               values that are combined by using a bitwise <b>OR</b> operation. 
     *               The resulting value specifies how to create the context state object. 
     *               The 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_1_create_device_context_state_flag">D3D11_1_CREATE_DEVICE_CONTEXT_STATE_SINGLETHREADED</a> flag is currently the only defined flag. 
     *               If the original device was created with 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_SINGLETHREADED</a>, 
     *               you must create all context state objects from that device with the 
     *              <b>D3D11_1_CREATE_DEVICE_CONTEXT_STATE_SINGLETHREADED</b> flag.
     *             
     * 
     * 
     * 
     * If you set the single-threaded flag for both the context state object and the device, you guarantee that you will call the whole set of context methods and device methods only from one thread. 
     *             You therefore do not need to use critical sections to synchronize access to the device context, and the runtime can avoid working with those processor-intensive critical sections.
     * @param {Pointer<Integer>} pFeatureLevels Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> values. The array can contain elements from the following list and determines the order of feature levels for which creation is attempted.
     *               Unlike <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>, you can't set <i>pFeatureLevels</i> to <b>NULL</b> because  there is no default feature level array.
     *             
     * 
     * 
     * ```
     * {
     *     D3D_FEATURE_LEVEL_11_1,
     *     D3D_FEATURE_LEVEL_11_0,
     *     D3D_FEATURE_LEVEL_10_1,
     *     D3D_FEATURE_LEVEL_10_0,
     *     D3D_FEATURE_LEVEL_9_3,
     *     D3D_FEATURE_LEVEL_9_2,
     *     D3D_FEATURE_LEVEL_9_1,
     * };
     *           
     * ```
     * @param {Integer} FeatureLevels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in <i>pFeatureLevels</i>. Unlike <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>, you must set <i>FeatureLevels</i> to greater than 0 because you can't set <i>pFeatureLevels</i> to <b>NULL</b>.
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The SDK version. You must set this parameter to <b>D3D11_SDK_VERSION</b>.
     * @param {Pointer<Guid>} EmulatedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) for the emulated interface. This value specifies the behavior of the device when the context state object is active. Valid values are  obtained by using the <b>__uuidof</b> operator on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a> interfaces. See Remarks.
     * @param {Pointer<Integer>} pChosenFeatureLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> value from the <i>pFeatureLevels</i> array. This is the first array value with which <b>CreateDeviceContextState</b> succeeded in creating the context state object. If the call to <b>CreateDeviceContextState</b> fails, the variable pointed to by <i>pChosenFeatureLevel</i> is set to zero.
     * @param {Pointer<ID3DDeviceContextState>} ppContextState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate">ID3DDeviceContextState</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate">ID3DDeviceContextState</a> object that represents the state of a Direct3D device.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate
     */
    CreateDeviceContextState(Flags, pFeatureLevels, FeatureLevels, SDKVersion, EmulatedInterface, pChosenFeatureLevel, ppContextState) {
        pFeatureLevelsMarshal := pFeatureLevels is VarRef ? "int*" : "ptr"
        pChosenFeatureLevelMarshal := pChosenFeatureLevel is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, "uint", Flags, pFeatureLevelsMarshal, pFeatureLevels, "uint", FeatureLevels, "uint", SDKVersion, "ptr", EmulatedInterface, pChosenFeatureLevelMarshal, pChosenFeatureLevel, "ptr*", ppContextState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gives a device access to a shared resource that is referenced by a handle and that was created on a different device.
     * @remarks
     * The behavior of <b>OpenSharedResource1</b> is similar to the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-opensharedresource">ID3D11Device::OpenSharedResource</a> method; each call to <b>OpenSharedResource1</b> to access a resource creates a new resource object.  In other words, if you call <b>OpenSharedResource1</b> twice and pass the same resource handle to <i>hResource</i>, you receive two resource  objects with different <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers.
     * 
     * <p class="proch"><b>To share a resource between two devices</b>
     * 
     * <ol>
     * <li>Create the resource as shared and specify that it uses NT handles, by setting the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_SHARED_NTHANDLE</a> flag.</li>
     * <li>Obtain the REFIID, or GUID, of the interface to the resource by using the __uuidof() macro. For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a>) retrieves the GUID of the interface to a 2D texture.</li>
     * <li>Query the resource for the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiresource1">IDXGIResource1</a> interface.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle">IDXGIResource1::CreateSharedHandle</a> method to obtain the unique handle to the resource.</li>
     * </ol>
     * @param {HANDLE} hResource_ A handle to the resource to open. For more info about this parameter, see Remarks.
     * @param {Pointer<Guid>} returnedInterface The globally unique identifier (GUID) for the resource interface. For more info about this parameter, see Remarks.
     * @returns {Pointer<Pointer<Void>>} A pointer to a variable that receives a pointer to the interface for the shared resource object to access.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1
     */
    OpenSharedResource1(hResource_, returnedInterface) {
        hResource_ := hResource_ is Win32Handle ? NumGet(hResource_, "ptr") : hResource_

        result := ComCall(48, this, "ptr", hResource_, "ptr", returnedInterface, "ptr*", &ppResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResource
    }

    /**
     * Gives a device access to a shared resource that is referenced by name and that was created on a different device.
     * @remarks
     * The behavior of <b>OpenSharedResourceByName</b> is similar to the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1">ID3D11Device1::OpenSharedResource1</a> method; each call to <b>OpenSharedResourceByName</b> to access a resource creates a new resource object.  In other words, if you call <b>OpenSharedResourceByName</b> twice and pass the same resource name to <i>lpName</i>, you receive two resource  objects with different <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers.
     * 
     * <p class="proch"><b>To share a resource between two devices</b>
     * 
     * <ol>
     * <li>Create the resource as shared and specify that it uses NT handles, by setting the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_SHARED_NTHANDLE</a> flag.</li>
     * <li>Obtain the REFIID, or GUID, of the interface to the resource by using the __uuidof() macro. For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a>) retrieves the GUID of the interface to a 2D texture.</li>
     * <li>Query the resource for the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiresource1">IDXGIResource1</a> interface.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle">IDXGIResource1::CreateSharedHandle</a> method to obtain the unique handle to the resource. In this <b>IDXGIResource1::CreateSharedHandle</b> call, you must pass a name for the resource if you want to subsequently call <b>OpenSharedResourceByName</b> to access the resource by name. </li>
     * </ol>
     * @param {PWSTR} lpName The name of the resource to open. This parameter cannot be <b>NULL</b>.
     * @param {Integer} dwDesiredAccess The requested access rights to the resource.  In addition to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">generic access rights</a>, DXGI defines the following values:
     * 
     * <ul>
     * <li><b>DXGI_SHARED_RESOURCE_READ</b> ( 0x80000000L ) - specifies read access to the resource.</li>
     * <li><b>DXGI_SHARED_RESOURCE_WRITE</b>	( 1 ) - specifies write access to the resource.</li>
     * </ul>
     * You can combine values by using a bitwise <b>OR</b> operation.
     * @param {Pointer<Guid>} returnedInterface The globally unique identifier (GUID) for the resource interface. For more info, see Remarks.
     * @returns {Pointer<Pointer<Void>>} A pointer to a variable that receives a pointer to the interface for the shared resource object to access.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresourcebyname
     */
    OpenSharedResourceByName(lpName, dwDesiredAccess, returnedInterface) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := ComCall(49, this, "ptr", lpName, "uint", dwDesiredAccess, "ptr", returnedInterface, "ptr*", &ppResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResource
    }
}

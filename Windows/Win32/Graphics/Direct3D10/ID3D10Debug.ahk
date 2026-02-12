#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\IDXGISwapChain.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A debug interface controls debug settings, validates pipeline state and can only be used if the debug layer is turned on. (ID3D10Debug)
 * @remarks
 * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nn-d3d10sdklayers-id3d10debug
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Debug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Debug
     * @type {Guid}
     */
    static IID => Guid("{9b7e4e01-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFeatureMask", "GetFeatureMask", "SetPresentPerRenderOpDelay", "GetPresentPerRenderOpDelay", "SetSwapChain", "GetSwapChain", "Validate"]

    /**
     * Set a bitfield of flags that will turn debug features on and off.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * Setting a feature-mask flag will cause a rendering-operation method (listed below) to do some extra task when called. The possible feature flags are:
     * 
     * <table>
     * <tr>
     * <td>D3D10_DEBUG_FEATURE_FINISH_PER_RENDER_OP</td>
     * <td>Application will wait for the GPU to finish processing the rendering operation before continuing.</td>
     * </tr>
     * <tr>
     * <td>D3D10_DEBUG_FEATURE_FLUSH_PER_RENDER_OP</td>
     * <td>Runtime will additionally call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-flush">ID3D10Device::Flush</a>.</td>
     * </tr>
     * <tr>
     * <td>D3D10_DEBUG_FEATURE_PRESENT_PER_RENDER_OP</td>
     * <td>Runtime will call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">Present</a>. Presentation of render buffers will occur according to the settings established by prior calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setswapchain">ID3D10Debug::SetSwapChain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setpresentperrenderopdelay">ID3D10Debug::SetPresentPerRenderOpDelay</a>.</td>
     * </tr>
     * </table>
     *  
     * 
     * These feature-mask flags apply to the following rendering-operation methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-draw">ID3D10Device::Draw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawindexed">ID3D10Device::DrawIndexed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawinstanced">ID3D10Device::DrawInstanced</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawindexedinstanced">ID3D10Device::DrawIndexedInstanced</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-drawauto">ID3D10Device::DrawAuto</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-clearrendertargetview">ID3D10Device::ClearRenderTargetView</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-cleardepthstencilview">ID3D10Device::ClearDepthStencilView</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copysubresourceregion">ID3D10Device::CopySubresourceRegion</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-copyresource">ID3D10Device::CopyResource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-updatesubresource">ID3D10Device::UpdateSubresource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-generatemips">ID3D10Device::GenerateMips</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-resolvesubresource">ID3D10Device::ResolveSubresource</a>
     * </li>
     * </ul>
     * @param {Integer} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Feature-mask flags bitwise ORed together. If a flag is present, then that feature will be set to on, otherwise the feature will be set to off. See remarks for a list of flags.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "uint", Mask, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Get a bitfield of flags that indicates which debug features are on or off. (ID3D10Debug.GetFeatureMask)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Mask of feature-mask flags bitwise ORed together. If a flag is present, then that feature will be set to on, otherwise the feature will be set to off. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask">ID3D10Debug::SetFeatureMask</a> for a list of possible feature-mask flags.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Set the number of milliseconds to sleep after Present is called.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * The application will only sleep if D3D10_DEBUG_FEATURE_PRESENT_PER_RENDER_OP is a set in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask">feature mask</a>. If that flag is not set the number of milliseconds is set but ignored and the application does not sleep. 10ms is used as a default value if this method is never called.
     * @param {Integer} Milliseconds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setpresentperrenderopdelay
     */
    SetPresentPerRenderOpDelay(Milliseconds) {
        result := ComCall(5, this, "uint", Milliseconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Get the number of milliseconds to sleep after Present is called.
     * @remarks
     * Value is set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setpresentperrenderopdelay">ID3D10Debug::SetPresentPerRenderOpDelay</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getpresentperrenderopdelay
     */
    GetPresentPerRenderOpDelay() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Set a swap chain that the runtime will use for automatically calling Present.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * The swap chain set by this method will only be used if D3D10_DEBUG_FEATURE_PRESENT_PER_RENDER_OP is set in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask">feature mask</a>.
     * @param {IDXGISwapChain} pSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>*</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">Present</a>; must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">DXGI_SWAP_EFFECT_SEQUENTIAL</a> swap-effect flag.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setswapchain
     */
    SetSwapChain(pSwapChain) {
        result := ComCall(7, this, "ptr", pSwapChain, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Get the swap chain that the runtime will use for automatically calling Present.
     * @remarks
     * The swap chain retrieved by this method will only be used if D3D10_DEBUG_FEATURE_PRESENT_PER_RENDER_OP is set in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask">feature mask</a>.
     * @returns {IDXGISwapChain} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">Present</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getswapchain
     */
    GetSwapChain() {
        result := ComCall(8, this, "ptr*", &ppSwapChain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDXGISwapChain(ppSwapChain)
    }

    /**
     * Check the validity of pipeline state.
     * @remarks
     * When the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">debug layer</a> is turned on all draw functions will do this operation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-validate
     */
    Validate() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

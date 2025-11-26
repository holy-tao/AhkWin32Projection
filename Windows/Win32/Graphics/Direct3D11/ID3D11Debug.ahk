#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\IDXGISwapChain.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A debug interface controls debug settings, validates pipeline state and can only be used if the debug layer is turned on.
 * @remarks
 * 
 * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 *           
 * 
 * For more information about the debug layer, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
 *           
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nn-d3d11sdklayers-id3d11debug
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Debug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Debug
     * @type {Guid}
     */
    static IID => Guid("{79cf2233-7536-4948-9d36-1e4692dc5760}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFeatureMask", "GetFeatureMask", "SetPresentPerRenderOpDelay", "GetPresentPerRenderOpDelay", "SetSwapChain", "GetSwapChain", "ValidateContext", "ReportLiveDeviceObjects", "ValidateContextForDispatch"]

    /**
     * Set a bit field of flags that will turn debug features on and off.
     * @param {Integer} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of feature-mask flags that are combined by using a bitwise OR operation. If a flag is present, that feature will be set to on, otherwise the feature will be set to off. For descriptions of the feature-mask flags, see Remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "uint", Mask, "HRESULT")
        return result
    }

    /**
     * Get a bitfield of flags that indicates which debug features are on or off.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Mask of feature-mask flags bitwise ORed together. If a flag is present, then that feature will be set to on, otherwise the feature will be set to off. See <a href="/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setfeaturemask">ID3D11Debug::SetFeatureMask</a> for a list of possible feature-mask flags.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Set the number of milliseconds to sleep after IDXGISwapChain::Present is called.
     * @param {Integer} Milliseconds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setpresentperrenderopdelay
     */
    SetPresentPerRenderOpDelay(Milliseconds) {
        result := ComCall(5, this, "uint", Milliseconds, "HRESULT")
        return result
    }

    /**
     * Get the number of milliseconds to sleep after IDXGISwapChain::Present is called.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-getpresentperrenderopdelay
     */
    GetPresentPerRenderOpDelay() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Sets a swap chain that the runtime will use for automatically calling IDXGISwapChain::Present.
     * @param {IDXGISwapChain} pSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>*</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>; must have been created with the DXGI_SWAP_EFFECT_SEQUENTIAL swap-effect flag.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setswapchain
     */
    SetSwapChain(pSwapChain) {
        result := ComCall(7, this, "ptr", pSwapChain, "HRESULT")
        return result
    }

    /**
     * Get the swap chain that the runtime will use for automatically calling IDXGISwapChain::Present.
     * @returns {IDXGISwapChain} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-getswapchain
     */
    GetSwapChain() {
        result := ComCall(8, this, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain(ppSwapChain)
    }

    /**
     * Check to see if the draw pipeline state is valid.
     * @param {ID3D11DeviceContext} pContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>, that represents a device context.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-validatecontext
     */
    ValidateContext(pContext) {
        result := ComCall(9, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Report information about a device object's lifetime.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_rldo_flags">D3D11_RLDO_FLAGS</a></b>
     * 
     * A value from the
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_rldo_flags">D3D11_RLDO_FLAGS</a> enumeration.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(10, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Verifies whether the dispatch pipeline state is valid.
     * @param {ID3D11DeviceContext} pContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> that represents a device context.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-validatecontextfordispatch
     */
    ValidateContextForDispatch(pContext) {
        result := ComCall(11, this, "ptr", pContext, "HRESULT")
        return result
    }
}

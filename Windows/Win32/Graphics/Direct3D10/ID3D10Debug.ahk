#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\IDXGISwapChain.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A debug interface controls debug settings, validates pipeline state and can only be used if the debug layer is turned on.
 * @remarks
 * 
 * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nn-d3d10sdklayers-id3d10debug
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
     * @param {Integer} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Feature-mask flags bitwise ORed together. If a flag is present, then that feature will be set to on, otherwise the feature will be set to off. See remarks for a list of flags.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "uint", Mask, "HRESULT")
        return result
    }

    /**
     * Get a bitfield of flags that indicates which debug features are on or off.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Mask of feature-mask flags bitwise ORed together. If a flag is present, then that feature will be set to on, otherwise the feature will be set to off. See <a href="/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setfeaturemask">ID3D10Debug::SetFeatureMask</a> for a list of possible feature-mask flags.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Set the number of milliseconds to sleep after Present is called.
     * @param {Integer} Milliseconds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setpresentperrenderopdelay
     */
    SetPresentPerRenderOpDelay(Milliseconds) {
        result := ComCall(5, this, "uint", Milliseconds, "HRESULT")
        return result
    }

    /**
     * Get the number of milliseconds to sleep after Present is called.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getpresentperrenderopdelay
     */
    GetPresentPerRenderOpDelay() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Set a swap chain that the runtime will use for automatically calling Present.
     * @param {IDXGISwapChain} pSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>*</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">Present</a>; must have been created with the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createswapchain">DXGI_SWAP_EFFECT_SEQUENTIAL</a> swap-effect flag.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-setswapchain
     */
    SetSwapChain(pSwapChain) {
        result := ComCall(7, this, "ptr", pSwapChain, "HRESULT")
        return result
    }

    /**
     * Get the swap chain that the runtime will use for automatically calling Present.
     * @returns {IDXGISwapChain} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">Present</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-getswapchain
     */
    GetSwapChain() {
        result := ComCall(8, this, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain(ppSwapChain)
    }

    /**
     * Check the validity of pipeline state.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/nf-d3d10sdklayers-id3d10debug-validate
     */
    Validate() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}

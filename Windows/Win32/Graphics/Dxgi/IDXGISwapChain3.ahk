#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGISwapChain2.ahk

/**
 * Extends IDXGISwapChain2 with methods to support getting the index of the swap chain's current back buffer and support for color space.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nn-dxgi1_4-idxgiswapchain3
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChain3 extends IDXGISwapChain2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChain3
     * @type {Guid}
     */
    static IID => Guid("{94d99bdb-f1f8-4ab0-b236-7da0170edab1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentBackBufferIndex", "CheckColorSpaceSupport", "SetColorSpace1", "ResizeBuffers1"]

    /**
     * Gets the index of the swap chain's current back buffer.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Returns the index of the current back buffer.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiswapchain3-getcurrentbackbufferindex
     */
    GetCurrentBackBufferIndex() {
        result := ComCall(36, this, "uint")
        return result
    }

    /**
     * Checks the swap chain's support for color space.
     * @param {Integer} ColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a>-typed value that specifies color space type to check support for.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives a combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/ne-dxgi1_4-dxgi_swap_chain_color_space_support_flag">DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for color space support.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiswapchain3-checkcolorspacesupport
     */
    CheckColorSpaceSupport(ColorSpace) {
        result := ComCall(37, this, "int", ColorSpace, "uint*", &pColorSpaceSupport := 0, "HRESULT")
        return pColorSpaceSupport
    }

    /**
     * Sets the color space used by the swap chain.
     * @param {Integer} ColorSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a>-typed value that specifies the color space to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns <b>S_OK</b> on success, or it returns one of the error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiswapchain3-setcolorspace1
     */
    SetColorSpace1(ColorSpace) {
        result := ComCall(38, this, "int", ColorSpace, "HRESULT")
        return result
    }

    /**
     * Changes the swap chain's back buffer size, format, and number of buffers, where the swap chain was created using a D3D12 command queue as an input device. This should be called when the application window is resized.
     * @param {Integer} BufferCount Type: <b>UINT</b>
     * 
     * The number of buffers in the swap chain (including all back and front buffers).
     *             This number can be different from the number of buffers with which you created the swap chain.
     *             This number can't be greater than <b>DXGI_MAX_SWAP_CHAIN_BUFFERS</b>.
     *             Set this number to zero to preserve the existing number of buffers in the swap chain.
     *             You can't specify less than two buffers for the flip presentation model.
     * @param {Integer} Width Type: <b>UINT</b>
     * 
     * The new width of the back buffer. 
     *             If you specify zero, DXGI will use the width of the client area of the target window. 
     *             You can't specify the width as zero if you called the <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> method to create the swap chain for a composition surface.
     * @param {Integer} Height Type: <b>UINT</b>
     * 
     * The new height of the back buffer. 
     *             If you specify zero, DXGI will use the height of the client area of the target window. 
     *             You can't specify the height as zero if you called the <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> method to create the swap chain for a composition surface.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the new format of the back buffer. 
     *             Set this value to <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_UNKNOWN</a> to preserve the existing format of the back buffer. 
     *             The flip presentation model supports a more restricted set of formats than the bit-block transfer (bitblt) model.
     * @param {Integer} SwapChainFlags Type: <b>UINT</b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a>-typed values that are combined by using a bitwise OR operation.
     *             The resulting value specifies options for swap-chain behavior.
     * @param {Pointer<Integer>} pCreationNodeMask Type: <b>const UINT*</b>
     * 
     * An array of UINTs, of total size <i>BufferCount</i>, where the value indicates which node the back buffer should be created on.
     *             Buffers created using <b>ResizeBuffers1</b> with a non-null <i>pCreationNodeMask</i> array are visible to all nodes.
     * @param {Pointer<IUnknown>} ppPresentQueue Type: <b>IUnknown*</b>
     * 
     * An array of command queues (<a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a> instances), of total size <i>BufferCount</i>.
     *             Each queue provided must match the corresponding creation node mask specified in the <i>pCreationNodeMask</i> array.
     *             When <b>Present()</b> is called, in addition to rotating to the next buffer for the next frame, the swapchain will also rotate through these command queues.
     *             This allows the app to control which queue requires synchronization for a given present operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; an error code otherwise.
     *             For a list of error codes, see <a href="/windows/win32/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiswapchain3-resizebuffers1
     */
    ResizeBuffers1(BufferCount, Width, Height, Format, SwapChainFlags, pCreationNodeMask, ppPresentQueue) {
        pCreationNodeMaskMarshal := pCreationNodeMask is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, "uint", BufferCount, "uint", Width, "uint", Height, "int", Format, "uint", SwapChainFlags, pCreationNodeMaskMarshal, pCreationNodeMask, "ptr*", ppPresentQueue, "HRESULT")
        return result
    }
}

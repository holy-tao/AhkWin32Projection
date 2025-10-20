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
     * 
     * @returns {Integer} 
     */
    GetCurrentBackBufferIndex() {
        result := ComCall(36, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ColorSpace 
     * @param {Pointer<UInt32>} pColorSpaceSupport 
     * @returns {HRESULT} 
     */
    CheckColorSpaceSupport(ColorSpace, pColorSpaceSupport) {
        result := ComCall(37, this, "int", ColorSpace, "uint*", pColorSpaceSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ColorSpace 
     * @returns {HRESULT} 
     */
    SetColorSpace1(ColorSpace) {
        result := ComCall(38, this, "int", ColorSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BufferCount 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} SwapChainFlags 
     * @param {Pointer<UInt32>} pCreationNodeMask 
     * @param {Pointer<IUnknown>} ppPresentQueue 
     * @returns {HRESULT} 
     */
    ResizeBuffers1(BufferCount, Width, Height, Format, SwapChainFlags, pCreationNodeMask, ppPresentQueue) {
        result := ComCall(39, this, "uint", BufferCount, "uint", Width, "uint", Height, "int", Format, "uint", SwapChainFlags, "uint*", pCreationNodeMask, "ptr", ppPresentQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

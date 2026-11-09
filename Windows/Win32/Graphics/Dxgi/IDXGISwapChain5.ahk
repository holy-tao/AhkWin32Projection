#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include Common\DXGI_COLOR_SPACE_TYPE.ahk
#Include Common\DXGI_FORMAT.ahk
#Include .\DXGI_SWAP_CHAIN_DESC2.ahk
#Include .\IDXGISwapChain4.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class IDXGISwapChain5 extends IDXGISwapChain4 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChain5
     * @type {Guid}
     */
    static IID => Guid("{9086bf22-9338-43bb-87ce-7790b6438a7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 41

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc2", "GetColorSpace1", "ResizeBuffers2"]

    /**
     * @returns {DXGI_SWAP_CHAIN_DESC2} 
     */
    GetDesc2() {
        pDesc := DXGI_SWAP_CHAIN_DESC2()
        result := ComCall(41, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * @returns {DXGI_COLOR_SPACE_TYPE} 
     */
    GetColorSpace1() {
        result := ComCall(42, this, "int")
        return result
    }

    /**
     * @param {Integer} BufferCount 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {DXGI_FORMAT} Format 
     * @param {Integer} SwapChainFlags 
     * @param {Pointer<Integer>} pCreationNodeMask 
     * @param {Pointer<IUnknown>} ppPresentQueue 
     * @param {DXGI_COLOR_SPACE_TYPE} ColorSpace 
     * @returns {HRESULT} 
     */
    ResizeBuffers2(BufferCount, Width, Height, Format, SwapChainFlags, pCreationNodeMask, ppPresentQueue, ColorSpace) {
        pCreationNodeMaskMarshal := pCreationNodeMask is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, "uint", BufferCount, "uint", Width, "uint", Height, "int", Format, "uint", SwapChainFlags, pCreationNodeMaskMarshal, pCreationNodeMask, "ptr*", ppPresentQueue, "int", ColorSpace, "HRESULT")
        return result
    }
}

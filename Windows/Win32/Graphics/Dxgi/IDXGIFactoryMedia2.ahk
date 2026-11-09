#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DXGI_SWAP_CHAIN_DESC2.ahk
#Include .\IDXGIFactoryMedia.ahk
#Include .\IDXGIOutput.ahk
#Include .\IDXGISwapChain5.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class IDXGIFactoryMedia2 extends IDXGIFactoryMedia {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactoryMedia2
     * @type {Guid}
     */
    static IID => Guid("{98ec0b90-2b18-42a6-9fcf-43b46f654022}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSwapChainForCompositionSurfaceHandle1"]

    /**
     * @param {IUnknown} pDevice 
     * @param {HANDLE} hSurface 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC2>} pDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @returns {IDXGISwapChain5} 
     */
    CreateSwapChainForCompositionSurfaceHandle1(pDevice, hSurface, pDesc, pRestrictToOutput) {
        hSurface := hSurface is Win32Handle ? NumGet(hSurface, "ptr") : hSurface

        result := ComCall(5, this, "ptr", pDevice, "ptr", hSurface, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain5(ppSwapChain)
    }
}

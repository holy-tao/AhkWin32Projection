#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIOutput.ahk

/**
 * An IDXGIOutput1 interface represents an adapter output (such as a monitor).
 * @remarks
 * 
  * To determine  the outputs that are available from the adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-enumoutputs">IDXGIAdapter::EnumOutputs</a>. To determine the specific output that the swap chain will update, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput">IDXGISwapChain::GetContainingOutput</a>. You can then call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> from any  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> object to obtain an <b>IDXGIOutput1</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgioutput1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput1 extends IDXGIOutput{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput1
     * @type {Guid}
     */
    static IID => Guid("{00cddea8-939b-4b83-a340-a685226666cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayModeList1", "FindClosestMatchingMode1", "GetDisplaySurfaceData1", "DuplicateOutput"]

    /**
     * 
     * @param {Integer} EnumFormat 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} pNumModes 
     * @param {Pointer<DXGI_MODE_DESC1>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaymodelist1
     */
    GetDisplayModeList1(EnumFormat, Flags, pNumModes, pDesc) {
        result := ComCall(19, this, "int", EnumFormat, "uint", Flags, "uint*", pNumModes, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXGI_MODE_DESC1>} pModeToMatch 
     * @param {Pointer<DXGI_MODE_DESC1>} pClosestMatch 
     * @param {IUnknown} pConcernedDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-findclosestmatchingmode1
     */
    FindClosestMatchingMode1(pModeToMatch, pClosestMatch, pConcernedDevice) {
        result := ComCall(20, this, "ptr", pModeToMatch, "ptr", pClosestMatch, "ptr", pConcernedDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDXGIResource} pDestination 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaysurfacedata1
     */
    GetDisplaySurfaceData1(pDestination) {
        result := ComCall(21, this, "ptr", pDestination, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {Pointer<IDXGIOutputDuplication>} ppOutputDuplication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-duplicateoutput
     */
    DuplicateOutput(pDevice, ppOutputDuplication) {
        result := ComCall(22, this, "ptr", pDevice, "ptr*", ppOutputDuplication, "HRESULT")
        return result
    }
}

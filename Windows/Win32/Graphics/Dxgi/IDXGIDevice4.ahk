#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDevice3.ahk

/**
 * This interface provides updated methods to offer and reclaim resources.
 * @remarks
 * 
  * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
  *           corresponding <b>IDXGIDevice4</b> interface. To retrieve the <b>IDXGIDevice4</b>  interface of a Direct3D device, use the following code:
  *         
  * 
  * 
  * ```cpp
  * IDXGIDevice4 * pDXGIDevice;
  * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice4), (void **)&pDXGIDevice);
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nn-dxgi1_5-idxgidevice4
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDevice4 extends IDXGIDevice3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDevice4
     * @type {Guid}
     */
    static IID => Guid("{95b4f95f-d8da-4ca4-9ee6-3b76d5968a10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OfferResources1", "ReclaimResources1"]

    /**
     * 
     * @param {Integer} NumResources 
     * @param {Pointer<IDXGIResource>} ppResources 
     * @param {Integer} Priority 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nf-dxgi1_5-idxgidevice4-offerresources1
     */
    OfferResources1(NumResources, ppResources, Priority, Flags) {
        result := ComCall(18, this, "uint", NumResources, "ptr*", ppResources, "int", Priority, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NumResources 
     * @param {Pointer<IDXGIResource>} ppResources 
     * @param {Pointer<Integer>} pResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nf-dxgi1_5-idxgidevice4-reclaimresources1
     */
    ReclaimResources1(NumResources, ppResources, pResults) {
        result := ComCall(19, this, "uint", NumResources, "ptr*", ppResources, "int*", pResults, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDevice1.ahk

/**
 * The IDXGIDevice2 interface implements a derived class for DXGI objects that produce image data. The interface exposes methods to block CPU processing until the GPU completes processing, and to offer resources to the operating system.
 * @remarks
 * 
  * The <b>IDXGIDevice2</b> interface is designed for use by DXGI objects that need access to other DXGI objects. This interface is useful to
  *           applications that do not use Direct3D to communicate with DXGI.
  *         
  * 
  * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
  *           corresponding <b>IDXGIDevice2</b> interface. To retrieve the <b>IDXGIDevice2</b>  interface of a Direct3D device, use the following code:
  *         
  * 
  * 
  * ```
  * IDXGIDevice2 * pDXGIDevice;
  * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice2), (void **)&pDXGIDevice);
  * 
  * ```
  * 
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgidevice2
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDevice2 extends IDXGIDevice1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDevice2
     * @type {Guid}
     */
    static IID => Guid("{05008617-fbfd-4051-a790-144884b4f6a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OfferResources", "ReclaimResources", "EnqueueSetEvent"]

    /**
     * 
     * @param {Integer} NumResources 
     * @param {Pointer<IDXGIResource>} ppResources 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources
     */
    OfferResources(NumResources, ppResources, Priority) {
        result := ComCall(14, this, "uint", NumResources, "ptr*", ppResources, "int", Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NumResources 
     * @param {Pointer<IDXGIResource>} ppResources 
     * @param {Pointer<BOOL>} pDiscarded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources
     */
    ReclaimResources(NumResources, ppResources, pDiscarded) {
        result := ComCall(15, this, "uint", NumResources, "ptr*", ppResources, "ptr", pDiscarded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-enqueuesetevent
     */
    EnqueueSetEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(16, this, "ptr", hEvent, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIDevice.ahk

/**
 * An IDXGIDevice1 interface implements a derived class for DXGI objects that produce image data.
 * @remarks
 * 
 * This interface is not supported by Direct3D 12 devices. Direct3D 12 applications have direct control over their swapchain management, so better latency control should be handled by the application. You can make use of Waitable objects (refer to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT</a>) and the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setmaximumframelatency">IDXGISwapChain2::SetMaximumFrameLatency</a> method if desired.
 * 
 * 
 * 
 * This interface is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on
 *           Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/kb/971644">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
 *         
 * 
 * The <b>IDXGIDevice1</b> interface is designed for use by DXGI objects that need access to other DXGI objects. This interface is useful to
 *           applications that do not use Direct3D to communicate with DXGI.
 *         
 * 
 * The Direct3D create device functions return a Direct3D device object. This Direct3D device object implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. You can query this Direct3D device object for the device's
 *           corresponding <b>IDXGIDevice1</b> interface. To retrieve the <b>IDXGIDevice1</b>  interface of a Direct3D device, use the following code:
 *         
 * 
 * 
 * ```
 * IDXGIDevice1 * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice1), (void **)&pDXGIDevice);
 * 
 * ```
 * 
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgidevice1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDevice1 extends IDXGIDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDevice1
     * @type {Guid}
     */
    static IID => Guid("{77db970f-6276-48ba-ba28-070143b4392c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMaximumFrameLatency", "GetMaximumFrameLatency"]

    /**
     * 
     * @param {Integer} MaxLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice1-setmaximumframelatency
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(12, this, "uint", MaxLatency, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice1-getmaximumframelatency
     */
    GetMaximumFrameLatency() {
        result := ComCall(13, this, "uint*", &pMaxLatency := 0, "HRESULT")
        return pMaxLatency
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDXGIDevice.ahk" { IDXGIDevice }

/**
 * An IDXGIDevice1 interface implements a derived class for DXGI objects that produce image data.
 * @remarks
 * This interface is not supported by Direct3D 12 devices. Direct3D 12 applications have direct control over their swapchain management, so better latency control should be handled by the application. You can make use of Waitable objects (refer to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT</a>) and the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgiswapchain2-setmaximumframelatency">IDXGISwapChain2::SetMaximumFrameLatency</a> method if desired.
 * 
 * 
 * 
 * This interface is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on
 *           Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
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
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgidevice1
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIDevice1 extends IDXGIDevice {
    /**
     * The interface identifier for IDXGIDevice1
     * @type {Guid}
     */
    static IID := Guid("{77db970f-6276-48ba-ba28-070143b4392c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIDevice1 interfaces
    */
    struct Vtbl extends IDXGIDevice.Vtbl {
        SetMaximumFrameLatency : IntPtr
        GetMaximumFrameLatency : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIDevice1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the number of frames that the system is allowed to queue for rendering.
     * @remarks
     * This method is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
     *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
     * 
     * Frame latency is the number of frames that are allowed to be stored in a queue before submission for rendering.  Latency is often used to 
     *     control how the CPU chooses between responding to user input and frames that are in the render queue.  It is often beneficial for applications that 
     *     have no user input (for example, video playback) to queue more than 3 frames of data.
     * @param {Integer} MaxLatency Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The maximum number of back buffer frames that a driver can queue. The value defaults to 3, but 
     *       can range from 1 to 16. A value of 0 will reset latency to the default.  For multi-head devices, this value is specified per-head.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, DXGI_ERROR_DEVICE_REMOVED if the device was removed.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice1-setmaximumframelatency
     */
    SetMaximumFrameLatency(MaxLatency) {
        result := ComCall(12, this, "uint", MaxLatency, "HRESULT")
        return result
    }

    /**
     * Gets the number of frames that the system is allowed to queue for rendering.
     * @remarks
     * This method is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
     *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
     * 
     * Frame latency is the number of frames that are allowed to be stored in a queue before submission for rendering.  Latency is often 
     *     used to control how the CPU chooses between responding to user input and frames that are in the render queue.  It is often beneficial for applications 
     *     that have no user input (for example, video playback) to queue more than 3 frames of data.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * This value is set to the number of frames that can be queued for render.  
     *       This value defaults to 3, but can range from 1 to 16.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgidevice1-getmaximumframelatency
     */
    GetMaximumFrameLatency() {
        result := ComCall(13, this, "uint*", &pMaxLatency := 0, "HRESULT")
        return pMaxLatency
    }

    Query(iid) {
        if (IDXGIDevice1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMaximumFrameLatency := CallbackCreate(GetMethod(implObj, "SetMaximumFrameLatency"), flags, 2)
        this.vtbl.GetMaximumFrameLatency := CallbackCreate(GetMethod(implObj, "GetMaximumFrameLatency"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMaximumFrameLatency)
        CallbackFree(this.vtbl.GetMaximumFrameLatency)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_ADAPTER_DESC.ahk
#Include .\IDXGIObject.ahk

/**
 * The IDXGIAdapter interface represents a display subsystem (including one or more GPUs, DACs and video memory).
 * @remarks
 * A display subsystem is often referred to as a video card, however, on some machines the display subsystem is part of the motherboard.
 *           
 * 
 * To enumerate the display subsystems, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory::EnumAdapters</a>.
 *           
 * 
 * To get an interface to the adapter for a particular device, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-getadapter">IDXGIDevice::GetAdapter</a>.
 *           
 * 
 * To create a software adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createsoftwareadapter">IDXGIFactory::CreateSoftwareAdapter</a>.
 *           
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nn-dxgi-idxgiadapter
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIAdapter extends IDXGIObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIAdapter
     * @type {Guid}
     */
    static IID => Guid("{2411e7e1-12ac-4ccf-bd14-9798e8534dc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumOutputs", "GetDesc", "CheckInterfaceSupport"]

    /**
     * Enumerate adapter (video card) outputs.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * When the <b>EnumOutputs</b> method succeeds and fills the <i>ppOutput</i> parameter with the address of the pointer to the output interface, <b>EnumOutputs</b> increments the output interface's reference count. To avoid a memory leak, when you finish using the 
     *       output interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method to decrement the reference count.
     * 
     * <b>EnumOutputs</b> first returns the output on which the desktop primary is displayed. This output corresponds with an index of zero. <b>EnumOutputs</b> then returns other outputs.
     * @param {Integer} Output Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the output.
     * @param {Pointer<Pointer<IDXGIOutput>>} ppOutput Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface at the position specified by the <i>Output</i> parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * A code that indicates success or failure (see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>). DXGI_ERROR_NOT_FOUND is returned if the index is greater than the number of outputs.
     * 
     * If the adapter came from a device created using D3D_DRIVER_TYPE_WARP, then the adapter has no outputs, so DXGI_ERROR_NOT_FOUND is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgiadapter-enumoutputs
     */
    EnumOutputs(Output, ppOutput) {
        result := ComCall(7, this, "uint", Output, "ptr*", ppOutput, "int")
        return result
    }

    /**
     * Gets a DXGI 1.0 description of an adapter (or video card).
     * @remarks
     * Graphics apps can use the DXGI API to retrieve an accurate set of graphics memory 
     *       values on systems that have Windows Display Driver Model (WDDM) drivers. The following are the critical steps involved.
     * 
     * <ul>
     * <li>
     * Graphics driver model determination —Because DXGI is only available on systems with WDDM drivers, the app must first confirm the driver model by using the following API.
     * 
     * 
     * ```
     * 
     * HasWDDMDriver()
     * {
     *     LPDIRECT3DCREATE9EX pD3D9Create9Ex = NULL;
     *     HMODULE             hD3D9          = NULL;
     * 
     *     hD3D9 = LoadLibrary( L"d3d9.dll" );
     * 
     *     if ( NULL == hD3D9 ) {
     *         return false;
     *     }
     * 
     *     //
     *     //  Try to create IDirect3D9Ex interface (also known as a DX9L interface). This interface can only be created if the driver is a WDDM driver.
     * 	 
     *     //
     *     pD3D9Create9Ex = (LPDIRECT3DCREATE9EX) GetProcAddress( hD3D9, "Direct3DCreate9Ex" );
     * 
     *     return pD3D9Create9Ex != NULL;
     * }
     *       
     * ```
     * 
     * 
     * </li>
     * <li>
     * Retrieval of graphics memory values.—After the app determines the driver model to be WDDM, the app can use the Direct3D 10 or later API and DXGI to get the amount of graphics memory. 
     *       After you create a Direct3D device, use this code to obtain 
     *       a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_adapter_desc">DXGI_ADAPTER_DESC</a> structure that contains the amount of available graphics memory.
     * 
     * 
     * ```
     * 
     * IDXGIDevice * pDXGIDevice;
     * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice), (void **)&pDXGIDevice);
     * IDXGIAdapter * pDXGIAdapter;
     * pDXGIDevice->GetAdapter(&pDXGIAdapter);
     * DXGI_ADAPTER_DESC adapterDesc;
     * pDXGIAdapter->GetDesc(&adapterDesc);
     *       
     * ```
     * 
     * 
     * </li>
     * </ul>
     * @returns {DXGI_ADAPTER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_adapter_desc">DXGI_ADAPTER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_adapter_desc">DXGI_ADAPTER_DESC</a> structure that describes the adapter. This parameter must not be <b>NULL</b>. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, <b>GetDesc</b> returns zeros for the PCI ID in the <b>VendorId</b>, <b>DeviceId</b>, <b>SubSysId</b>, and <b>Revision</b> members of <b>DXGI_ADAPTER_DESC</b> and “Software Adapter” for the description string in the <b>Description</b> member.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgiadapter-getdesc
     */
    GetDesc() {
        pDesc := DXGI_ADAPTER_DESC()
        result := ComCall(8, this, "ptr", pDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDesc
    }

    /**
     * Checks whether the system supports a device interface for a graphics component.
     * @remarks
     * <div class="alert"><b>Note</b>  You can  use <b>CheckInterfaceSupport</b> only to  check whether a Direct3D 10.x interface is supported, and only on Windows Vista SP1 and later versions of the operating system. If you try to use <b>CheckInterfaceSupport</b> to check whether a Direct3D 11.x and later version interface is supported, <b>CheckInterfaceSupport</b> returns DXGI_ERROR_UNSUPPORTED. Therefore, do not use <b>CheckInterfaceSupport</b>. Instead, to verify whether the operating system supports a particular interface, try to create the interface. For example, if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createblendstate">ID3D11Device::CreateBlendState</a> method and it fails, the operating system does not support the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a> interface.</div>
     * <div> </div>
     * @param {Pointer<Guid>} InterfaceName Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The GUID of the interface of the device version for which support is being checked. This should usually be __uuidof(IDXGIDevice), which returns the version number of the Direct3D 9 UMD (user mode driver) binary. Since WDDM 2.3, all driver components within a driver package (D3D9, D3D11, and D3D12) have been required to share a single version number, so this is a good way to query the driver version regardless of which API is being used.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a>*</b>
     * 
     * The user mode driver version of <i>InterfaceName</i>. This is  returned only if the interface is supported, otherwise this parameter will be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgiadapter-checkinterfacesupport
     */
    CheckInterfaceSupport(InterfaceName) {
        result := ComCall(9, this, "ptr", InterfaceName, "int64*", &pUMDVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pUMDVersion
    }
}

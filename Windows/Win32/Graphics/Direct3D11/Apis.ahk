#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\ID3DX11Scan.ahk" { ID3DX11Scan }
#Import ".\ID3D11Device.ahk" { ID3D11Device }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\Dxgi\IDXGISwapChain.ahk" { IDXGISwapChain }
#Import ".\D3DX11_FFT_DESC.ahk" { D3DX11_FFT_DESC }
#Import "..\Dxgi\IDXGIAdapter.ahk" { IDXGIAdapter }
#Import "..\Dxgi\DXGI_SWAP_CHAIN_DESC.ahk" { DXGI_SWAP_CHAIN_DESC }
#Import ".\ID3DX11FFT.ahk" { ID3DX11FFT }
#Import ".\D3DX11_FFT_BUFFER_INFO.ahk" { D3DX11_FFT_BUFFER_INFO }
#Import ".\ID3D11DeviceContext.ahk" { ID3D11DeviceContext }
#Import ".\D3D11_CREATE_DEVICE_FLAG.ahk" { D3D11_CREATE_DEVICE_FLAG }
#Import ".\ID3D11ShaderTrace.ahk" { ID3D11ShaderTrace }
#Import ".\ID3DX11SegmentedScan.ahk" { ID3DX11SegmentedScan }
#Import "..\Direct3D\D3D_DRIVER_TYPE.ahk" { D3D_DRIVER_TYPE }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D11
 */

;@region Functions
/**
 * Creates a device that represents the display adapter. (D3D11CreateDevice)
 * @remarks
 * This entry-point is supported by the Direct3D 11 runtime, which is available on Windows 7, Windows Server 2008 R2, and as an update to
 *           Windows Vista (KB971644).
 *         
 * 
 * To create a Direct3D 11.1 device (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a>), which is available on Windows 8, Windows Server 2012, and Windows 7 and Windows Server 2008 R2 with the <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a> installed, you first create a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> with this function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the <b>ID3D11Device</b> object to obtain the <b>ID3D11Device1</b> interface.
 *         
 * 
 * To create a Direct3D 11.2 device (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nn-d3d11_2-id3d11device2">ID3D11Device2</a>), which is available on Windows 8.1 and Windows Server 2012 R2, you first create a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> with this function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the <b>ID3D11Device</b> object to obtain the <b>ID3D11Device2</b> interface.
 *         
 * 
 * Set <i>ppDevice</i> and <i>ppImmediateContext</i> to <b>NULL</b> to determine which feature level is supported by looking
 *           at <i>pFeatureLevel</i> without creating a device.
 *         
 * 
 * For an example, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-initialize">How To: Create a Device and Immediate Context</a>; to create a device and a swap chain at the same time,
 *           use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>.
 *         
 * 
 * If you set the <i>pAdapter</i> parameter to a non-<b>NULL</b> value, you must also set the <i>DriverType</i> parameter to the D3D_DRIVER_TYPE_UNKNOWN value. If you set the <i>pAdapter</i> parameter to a non-<b>NULL</b> value and the <i>DriverType</i> parameter to the D3D_DRIVER_TYPE_HARDWARE value, <b>D3D11CreateDevice</b> returns an <a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a> of E_INVALIDARG.
 *         
 * 
 * <table>
 * <tr>
 * <td>
 * Differences between Direct3D 10 and Direct3D 11:
 * 
 * In Direct3D 10, the presence of <i>pAdapter</i> dictated which adapter to use and the <i>DriverType</i> could
 *                 mismatch what the adapter was.
 *               
 * 
 * In Direct3D 11, if you are trying to create a hardware or a software device, set <i>pAdapter</i> != <b>NULL</b> which constrains
 *                 the other inputs to be:
 *               
 * 
 * <ul>
 * <li><i>DriverType</i> must be D3D_DRIVER_TYPE_UNKNOWN
 *                 </li>
 * <li><i>Software</i> must be <b>NULL</b>.
 *                 </li>
 * </ul>
 * On the other hand, if <i>pAdapter</i> == <b>NULL</b>, the <i>DriverType</i> cannot be set to D3D_DRIVER_TYPE_UNKNOWN; it can be set to either:
 *               
 * 
 * <ul>
 * <li>If <i>DriverType</i> == D3D_DRIVER_TYPE_SOFTWARE,  <i>Software</i> cannot be <b>NULL</b>.
 *                 </li>
 * <li>If <i>DriverType</i> == D3D_DRIVER_TYPE_HARDWARE, the adapter used will be the default adapter, which is the first adapter that is enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory1::EnumAdapters</a>
 * </li>
 * </ul>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The function signature PFN_D3D11_CREATE_DEVICE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 *       
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 *       
 * 
 * <b>Windows Phone 8.1:
 *         </b> This API is supported.
 * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
 * 
 * A pointer to the video adapter to use when creating a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-intro">device</a>. Pass <b>NULL</b> to use the default adapter, which is the first adapter that is enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory1::EnumAdapters</a>. 
 * 
 * <div class="alert"><b>Note</b>  Do not mix the use of DXGI 1.0 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>) and DXGI 1.1 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a>) in an application. Use <b>IDXGIFactory</b> or <b>IDXGIFactory1</b>, but not both in an application.
 *             </div>
 * <div> </div>
 * @param {D3D_DRIVER_TYPE} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE</a></b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE</a>, which represents the driver type to create.
 * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
 * 
 * A handle to a DLL that implements a software rasterizer.
 *             If <i>DriverType</i> is <i>D3D_DRIVER_TYPE_SOFTWARE</i>,
 *             <i>Software</i> must not be <b>NULL</b>. Get the handle by
 *             calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>,
 *             <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> ,
 *             or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>.
 * @param {D3D11_CREATE_DEVICE_FLAG} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The runtime <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">layers</a> to enable (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a>);
 *             values can be bitwise OR'd together.
 * @param {Pointer<D3D_FEATURE_LEVEL>} pFeatureLevels Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
 * 
 * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>s, which determine the order of feature levels to attempt to create.
 *               If <i>pFeatureLevels</i> is set to <b>NULL</b>,
 *               this function uses the following array of feature levels:
 *             
 * 
 * 
 * ```
 * {
 *     D3D_FEATURE_LEVEL_11_0,
 *     D3D_FEATURE_LEVEL_10_1,
 *     D3D_FEATURE_LEVEL_10_0,
 *     D3D_FEATURE_LEVEL_9_3,
 *     D3D_FEATURE_LEVEL_9_2,
 *     D3D_FEATURE_LEVEL_9_1,
 * };
 * ```
 * 
 * 
 * <div class="alert"><b>Note</b>  If the Direct3D 11.1 runtime is present on the computer and <i>pFeatureLevels</i> is set to <b>NULL</b>, this function won't create a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_11_1</a> device. To create a <b>D3D_FEATURE_LEVEL_11_1</b> device, you must explicitly provide a <b>D3D_FEATURE_LEVEL</b> array that includes <b>D3D_FEATURE_LEVEL_11_1</b>. If you provide a <b>D3D_FEATURE_LEVEL</b> array that contains <b>D3D_FEATURE_LEVEL_11_1</b> on a computer that doesn't have the Direct3D 11.1 runtime installed, this function immediately fails with E_INVALIDARG.
 *             </div>
 * <div> </div>
 * @param {Integer} FeatureLevels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The number of elements in <i>pFeatureLevels</i>.
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The SDK version; use <i>D3D11_SDK_VERSION</i>.
 * @param {Pointer<ID3D11Device>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>**</b>
 * 
 * Returns the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> object that represents the device created. If this parameter is <b>NULL</b>, no ID3D11Device will be returned.
 * @param {Pointer<D3D_FEATURE_LEVEL>} pFeatureLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
 * 
 * If successful, returns the first <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> from the <i>pFeatureLevels</i> array which succeeded. Supply <b>NULL</b> as an input if you don't need to determine which feature level is supported.
 * @param {Pointer<ID3D11DeviceContext>} ppImmediateContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>**</b>
 * 
 * Returns the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> object that represents the device context. If this parameter is <b>NULL</b>, no ID3D11DeviceContext will be returned.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method can return one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
 *           
 * 
 * This method returns E_INVALIDARG if you set the <i>pAdapter</i> parameter to a non-<b>NULL</b> value and the <i>DriverType</i> parameter to the D3D_DRIVER_TYPE_HARDWARE value.
 *           
 * 
 * This method returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_SDK_COMPONENT_MISSING</a> if you specify <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_DEBUG</a> in <i>Flags</i> and the incorrect version of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> is installed on your computer. Install the latest Windows SDK to get the correct version.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-d3d11createdevice
 */
export D3D11CreateDevice(pAdapter, DriverType, Software, Flags, pFeatureLevels, FeatureLevels, SDKVersion, ppDevice, pFeatureLevel, ppImmediateContext) {
    pFeatureLevelsMarshal := pFeatureLevels is VarRef ? "int*" : "ptr"
    pFeatureLevelMarshal := pFeatureLevel is VarRef ? "int*" : "ptr"

    result := DllCall("d3d11.dll\D3D11CreateDevice", "ptr", pAdapter, D3D_DRIVER_TYPE, DriverType, HMODULE, Software, D3D11_CREATE_DEVICE_FLAG, Flags, pFeatureLevelsMarshal, pFeatureLevels, "uint", FeatureLevels, "uint", SDKVersion, ID3D11Device.Ptr, ppDevice, pFeatureLevelMarshal, pFeatureLevel, ID3D11DeviceContext.Ptr, ppImmediateContext, "HRESULT")
    return result
}

/**
 * Creates a device that represents the display adapter and a swap chain used for rendering.
 * @remarks
 * <div class="alert"><b>Note</b>  If you call this method in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.
 *         </div>
 * <div> </div>
 * This entry-point is supported by the Direct3D 11 runtime, which is available on Windows 7, Windows Server 2008 R2, and as an update to
 *           Windows Vista (KB971644).
 *         
 * 
 * To create a Direct3D 11.1 device (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a>), which is available on Windows 8, Windows Server 2012, and Windows 7 and Windows Server 2008 R2 with the <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a> installed, you first create a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> with this function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the <b>ID3D11Device</b> object to obtain the <b>ID3D11Device1</b> interface.
 *         
 * 
 * To create a Direct3D 11.2 device (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nn-d3d11_2-id3d11device2">ID3D11Device2</a>), which is available on Windows 8.1 and Windows Server 2012 R2, you first create a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> with this function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the <b>ID3D11Device</b> object to obtain the <b>ID3D11Device2</b> interface.
 *         
 * 
 * Also, see the remarks section in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a> for details about input parameter dependencies. To create a device without
 *           creating a swap chain, use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a> function.
 *         
 * 
 * If you set the <i>pAdapter</i> parameter to a non-<b>NULL</b> value, you must also set the <i>DriverType</i> parameter to the D3D_DRIVER_TYPE_UNKNOWN value. If you set the <i>pAdapter</i> parameter to a non-<b>NULL</b> value and the <i>DriverType</i> parameter to the D3D_DRIVER_TYPE_HARDWARE value, <b>D3D11CreateDeviceAndSwapChain</b> returns an <a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a> of E_INVALIDARG.
 *         
 * 
 * The function signature PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 *       
 * 
 * <h3><a id="Usage_notes"></a><a id="usage_notes"></a><a id="USAGE_NOTES"></a>Usage notes</h3>
 * <div class="alert"><b>Note</b>  The <b>D3D11CreateDeviceAndSwapChain</b> function does not exist for Windows Store apps. Instead, Windows Store apps use the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a> function and then use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a> method.
 *           </div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  This function has not been updated to support recent additional features of swap chain creation. For the most up-to-date swap chain creation methods, refer to the methods of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgifactory2">IDXGIFactory2</a> (including <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">CreateSwapChainForCoreWindow</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">CreateSwapChainForComposition</a>).</div>
 * <div> </div>
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
 * 
 * A pointer to the video adapter to use when creating a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-intro">device</a>. Pass <b>NULL</b> to use the default adapter, which is the first adapter enumerated
 *             by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory1::EnumAdapters</a>. 
 * 
 * <div class="alert"><b>Note</b>  Do not mix the use of DXGI 1.0 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>) and DXGI 1.1 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a>) in an application. Use <b>IDXGIFactory</b> or <b>IDXGIFactory1</b>, but not both in an application.
 *             </div>
 * <div> </div>
 * @param {D3D_DRIVER_TYPE} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE</a></b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE</a>, which represents the driver type to create.
 * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
 * 
 * A handle to a DLL that implements a software rasterizer.
 *             If <i>DriverType</i> is <i>D3D_DRIVER_TYPE_SOFTWARE</i>, <i>Software</i> must not be <b>NULL</b>. Get the handle by
 *             calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>,
 *             <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> ,
 *             or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>. The value should be non-<b>NULL</b> when <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE</a> is <b>D3D_DRIVER_TYPE_SOFTWARE</b> and <b>NULL</b> otherwise.
 * @param {D3D11_CREATE_DEVICE_FLAG} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The runtime <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">layers</a> to enable (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a>);
 *             values can be bitwise OR'd together.
 * @param {Pointer<D3D_FEATURE_LEVEL>} pFeatureLevels Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
 * 
 * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>s, which determine the order of feature levels to attempt to create.
 *               If <i>pFeatureLevels</i> is set to <b>NULL</b>,
 *               this function uses the following array of feature levels:
 *             
 * 
 * 
 * ```
 * 
 * {
 *     D3D_FEATURE_LEVEL_11_0,
 *     D3D_FEATURE_LEVEL_10_1,
 *     D3D_FEATURE_LEVEL_10_0,
 *     D3D_FEATURE_LEVEL_9_3,
 *     D3D_FEATURE_LEVEL_9_2,
 *     D3D_FEATURE_LEVEL_9_1,
 * };
 *           
 * ```
 * 
 * 
 * <div class="alert"><b>Note</b>  If the Direct3D 11.1 runtime is present on the computer and <i>pFeatureLevels</i> is set to <b>NULL</b>, this function won't create a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_11_1</a> device. To create a <b>D3D_FEATURE_LEVEL_11_1</b> device, you must explicitly provide a <b>D3D_FEATURE_LEVEL</b> array that includes <b>D3D_FEATURE_LEVEL_11_1</b>. If you provide a <b>D3D_FEATURE_LEVEL</b> array that contains <b>D3D_FEATURE_LEVEL_11_1</b> on a computer that doesn't have the Direct3D 11.1 runtime installed, this function immediately fails with E_INVALIDARG.
 *             </div>
 * <div> </div>
 * @param {Integer} FeatureLevels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The number of elements in <i>pFeatureLevels</i>.
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The SDK version; use <i>D3D11_SDK_VERSION</i>.
 * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pSwapChainDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
 * 
 * A pointer to a swap chain description (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>) that contains initialization parameters for the swap chain.
 * @param {Pointer<IDXGISwapChain>} ppSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
 * 
 * Returns the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a> object that represents the swap chain used for rendering.
 * @param {Pointer<ID3D11Device>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>**</b>
 * 
 * Returns the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> object that represents the device created. If this parameter is  <b>NULL</b>, no ID3D11Device will be returned'.
 * @param {Pointer<D3D_FEATURE_LEVEL>} pFeatureLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
 * 
 * Returns a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>, which represents the first element in an array of feature levels supported
 *             by the device. Supply <b>NULL</b> as an input if you don't need to determine which feature level is supported.
 * @param {Pointer<ID3D11DeviceContext>} ppImmediateContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>**</b>
 * 
 * Returns the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> object that represents the device context. If this parameter is <b>NULL</b>, no ID3D11DeviceContext will be returned.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method can return one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
 *           
 * 
 * This method returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a> if you call it in a Session 0 process.
 *           
 * 
 * This method returns E_INVALIDARG if you set the <i>pAdapter</i> parameter to a non-<b>NULL</b> value and the <i>DriverType</i> parameter to the D3D_DRIVER_TYPE_HARDWARE value.
 *           
 * 
 * This method returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_SDK_COMPONENT_MISSING</a> if you specify <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_DEBUG</a> in <i>Flags</i> and the incorrect version of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> is installed on your computer. Install the latest Windows SDK to get the correct version.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain
 */
export D3D11CreateDeviceAndSwapChain(pAdapter, DriverType, Software, Flags, pFeatureLevels, FeatureLevels, SDKVersion, pSwapChainDesc, ppSwapChain, ppDevice, pFeatureLevel, ppImmediateContext) {
    pFeatureLevelsMarshal := pFeatureLevels is VarRef ? "int*" : "ptr"
    pFeatureLevelMarshal := pFeatureLevel is VarRef ? "int*" : "ptr"

    result := DllCall("d3d11.dll\D3D11CreateDeviceAndSwapChain", "ptr", pAdapter, D3D_DRIVER_TYPE, DriverType, HMODULE, Software, D3D11_CREATE_DEVICE_FLAG, Flags, pFeatureLevelsMarshal, pFeatureLevels, "uint", FeatureLevels, "uint", SDKVersion, DXGI_SWAP_CHAIN_DESC.Ptr, pSwapChainDesc, IDXGISwapChain.Ptr, ppSwapChain, ID3D11Device.Ptr, ppDevice, pFeatureLevelMarshal, pFeatureLevel, ID3D11DeviceContext.Ptr, ppImmediateContext, "HRESULT")
    return result
}

/**
 * Disassembles a section of compiled Microsoft High Level Shader Language (HLSL) code that is specified by shader trace steps.
 * @remarks
 * D3DDisassemble11Trace walks the steps of a shader trace and outputs appropriate disassembly for each step that is based on the step's instruction index. The disassembly is annotated with register-value information from the trace. The behavior of D3DDisassemble11Trace differs from D3DDisassemble in that instead of the static disassembly of a compiled shader that D3DDisassemble performs, D3DDisassemble11Trace provides an execution trace that is based on the shader trace information.
 * @param {Integer} pSrcData Type: <b>LPCVOID</b>
 * 
 * A pointer to compiled shader data.
 * @param {Pointer} SrcDataSize Type: <b>SIZE_T</b>
 * 
 * The size, in bytes, of the block of memory that pSrcData points to.
 * @param {ID3D11ShaderTrace} pTrace Type: <b>ID3D11ShaderTrace*</b>
 * 
 * A pointer to the ID3D11ShaderTrace interface for the shader trace information object.
 * @param {Integer} StartStep Type: <b>UINT</b>
 * 
 * The number of the step in the trace from which D3DDisassemble11Trace starts the disassembly.
 * @param {Integer} NumSteps Type: <b>UINT</b>
 * 
 * The number of trace steps to disassemble.
 * @param {Integer} Flags Type: <b>UINT</b>
 * 
 * A combination of zero or more of the following flags that are combined by using a bitwise OR operation. The resulting value specifies how D3DDisassemble11Trace disassembles the compiled shader data.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>D3D_DISASM_ENABLE_COLOR_CODE (0x01)</td>
 * <td> Enable the output of color codes.</td>
 * </tr>
 * <tr>
 * <td>D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS (0x02)</td>
 * <td> Enable the output of default values.</td>
 * </tr>
 * <tr>
 * <td>D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING (0x04)</td>
 * <td> Enable instruction numbering.</td>
 * </tr>
 * <tr>
 * <td>D3D_DISASM_ENABLE_INSTRUCTION_CYCLE (0x08)</td>
 * <td> No effect.</td>
 * </tr>
 * <tr>
 * <td>D3D_DISASM_DISABLE_DEBUG_INFO (0x10)</td>
 * <td> Disable the output of debug information.</td>
 * </tr>
 * <tr>
 * <td>D3D_DISASM_ENABLE_INSTRUCTION_OFFSET (0x20)</td>
 * <td> Enable the output of instruction offsets.</td>
 * </tr>
 * <tr>
 * <td>D3D_DISASM_INSTRUCTION_ONLY (0x40)</td>
 * <td> 
 * Enable the output of the instruction cycle per step in D3DDisassemble11Trace. This flag is similar to the D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING and D3D_DISASM_ENABLE_INSTRUCTION_OFFSET flags.
 * 
 * This flag has no effect in the D3DDisassembleRegion function. Cycle information comes from the trace; therefore, cycle information is available only in the trace disassembly.
 *  </td>
 * </tr>
 * </table>
 * @returns {ID3DBlob} Type: <b>ID3D10Blob**</b>
 * 
 * A pointer to a buffer that receives the ID3DBlob interface that accesses the disassembled HLSL code.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-d3ddisassemble11trace
 * @since windows8.0
 */
export D3DDisassemble11Trace(pSrcData, SrcDataSize, pTrace, StartStep, NumSteps, Flags) {
    result := DllCall("D3DCOMPILER_47.dll\D3DDisassemble11Trace", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pTrace, "uint", StartStep, "uint", NumSteps, "uint", Flags, "ptr*", &ppDisassembly := 0, "HRESULT")
    return ID3DBlob(ppDisassembly)
}

/**
 * Creates a scan context.
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> the scan is associated with.
 * @param {Integer} MaxElementScanSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Maximum single scan size, in elements (FLOAT, UINT, or INT).
 * @param {Integer} MaxScanCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Maximum number of scans in multiscan.
 * @returns {ID3DX11Scan} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11scan">ID3DX11Scan</a>**</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11scan">ID3DX11Scan Interface</a> pointer that will be set to the created interface object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createscan
 */
export D3DX11CreateScan(pDeviceContext, MaxElementScanSize, MaxScanCount) {
    result := DllCall("d3dcsx.dll\D3DX11CreateScan", "ptr", pDeviceContext, "uint", MaxElementScanSize, "uint", MaxScanCount, "ptr*", &ppScan := 0, "HRESULT")
    return ID3DX11Scan(ppScan)
}

/**
 * Creates a segmented scan context.
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface.
 * @param {Integer} MaxElementScanSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Maximum single scan size, in elements (FLOAT, UINT, or INT).
 * @returns {ID3DX11SegmentedScan} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11segmentedscan">ID3DX11SegmentedScan</a>**</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11segmentedscan">ID3DX11SegmentedScan Interface</a> pointer that will be set to the created interface object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createsegmentedscan
 */
export D3DX11CreateSegmentedScan(pDeviceContext, MaxElementScanSize) {
    result := DllCall("d3dcsx.dll\D3DX11CreateSegmentedScan", "ptr", pDeviceContext, "uint", MaxElementScanSize, "ptr*", &ppScan := 0, "HRESULT")
    return ID3DX11SegmentedScan(ppScan)
}

/**
 * Creates an ID3DX11FFT COM interface object. (D3DX11CreateFFT)
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface to use for the FFT.
 * @param {Pointer<D3DX11_FFT_DESC>} pDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_desc">D3DX11_FFT_DESC</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_desc">D3DX11_FFT_DESC</a> structure that describes the shape of the FFT data as well as the scaling factors that should be used for forward and inverse transforms.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Flags that affect the behavior of the FFT, can be 0 or a combination of flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag">D3DX11_FFT_CREATE_FLAG</a>.
 * @param {Pointer<D3DX11_FFT_BUFFER_INFO>} pBufferInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure that receives the buffer requirements to execute the FFT algorithms.
 *               Use this info to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 * @returns {ID3DX11FFT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a>**</b>
 * 
 * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a> interface for the created FFT object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft
 */
export D3DX11CreateFFT(pDeviceContext, pDesc, Flags, pBufferInfo) {
    result := DllCall("d3dcsx.dll\D3DX11CreateFFT", "ptr", pDeviceContext, D3DX11_FFT_DESC.Ptr, pDesc, "uint", Flags, D3DX11_FFT_BUFFER_INFO.Ptr, pBufferInfo, "ptr*", &ppFFT := 0, "HRESULT")
    return ID3DX11FFT(ppFFT)
}

/**
 * Creates an ID3DX11FFT COM interface object. (D3DX11CreateFFT1DReal)
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface to use for the FFT.
 * @param {Integer} X Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the first dimension of the FFT.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Flags that affect the behavior of the FFT, can be 0 or a combination of flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag">D3DX11_FFT_CREATE_FLAG</a>.
 * @param {Pointer<D3DX11_FFT_BUFFER_INFO>} pBufferInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure that receives the buffer requirements to execute the FFT algorithms. Use this info to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 * @returns {ID3DX11FFT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a>**</b>
 * 
 * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a> interface for the created FFT object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft1dreal
 */
export D3DX11CreateFFT1DReal(pDeviceContext, X, Flags, pBufferInfo) {
    result := DllCall("d3dcsx.dll\D3DX11CreateFFT1DReal", "ptr", pDeviceContext, "uint", X, "uint", Flags, D3DX11_FFT_BUFFER_INFO.Ptr, pBufferInfo, "ptr*", &ppFFT := 0, "HRESULT")
    return ID3DX11FFT(ppFFT)
}

/**
 * Creates an ID3DX11FFT COM interface object. (D3DX11CreateFFT1DComplex)
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface to use for the FFT.
 * @param {Integer} X Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the first dimension of the FFT.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Flags that affect the behavior of the FFT, can be 0 or a combination of flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag">D3DX11_FFT_CREATE_FLAG</a>.
 * @param {Pointer<D3DX11_FFT_BUFFER_INFO>} pBufferInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure that receives the buffer requirements to execute the FFT algorithms. Use this info to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 * @returns {ID3DX11FFT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a>**</b>
 * 
 * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a> interface for the created FFT object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft1dcomplex
 */
export D3DX11CreateFFT1DComplex(pDeviceContext, X, Flags, pBufferInfo) {
    result := DllCall("d3dcsx.dll\D3DX11CreateFFT1DComplex", "ptr", pDeviceContext, "uint", X, "uint", Flags, D3DX11_FFT_BUFFER_INFO.Ptr, pBufferInfo, "ptr*", &ppFFT := 0, "HRESULT")
    return ID3DX11FFT(ppFFT)
}

/**
 * Creates an ID3DX11FFT COM interface object. (D3DX11CreateFFT2DReal)
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface to use for the FFT.
 * @param {Integer} X Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the first dimension of the FFT.
 * @param {Integer} Y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the second dimension of the FFT.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Flags that affect the behavior of the FFT, can be 0 or a combination of flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag">D3DX11_FFT_CREATE_FLAG</a>.
 * @param {Pointer<D3DX11_FFT_BUFFER_INFO>} pBufferInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure that receives the buffer requirements to execute the FFT algorithms. Use this info to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 * @returns {ID3DX11FFT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a>**</b>
 * 
 * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a> interface for the created FFT object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft2dreal
 */
export D3DX11CreateFFT2DReal(pDeviceContext, X, Y, Flags, pBufferInfo) {
    result := DllCall("d3dcsx.dll\D3DX11CreateFFT2DReal", "ptr", pDeviceContext, "uint", X, "uint", Y, "uint", Flags, D3DX11_FFT_BUFFER_INFO.Ptr, pBufferInfo, "ptr*", &ppFFT := 0, "HRESULT")
    return ID3DX11FFT(ppFFT)
}

/**
 * Creates an ID3DX11FFT COM interface object. (D3DX11CreateFFT2DComplex)
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface to use for the FFT.
 * @param {Integer} X Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the first dimension of the FFT.
 * @param {Integer} Y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the second dimension of the FFT.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Flags that affect the behavior of the FFT, can be 0 or a combination of flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag">D3DX11_FFT_CREATE_FLAG</a>.
 * @param {Pointer<D3DX11_FFT_BUFFER_INFO>} pBufferInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure that receives the buffer requirements to execute the FFT algorithms. Use this info to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 * @returns {ID3DX11FFT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a>**</b>
 * 
 * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a> interface for the created FFT object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft2dcomplex
 */
export D3DX11CreateFFT2DComplex(pDeviceContext, X, Y, Flags, pBufferInfo) {
    result := DllCall("d3dcsx.dll\D3DX11CreateFFT2DComplex", "ptr", pDeviceContext, "uint", X, "uint", Y, "uint", Flags, D3DX11_FFT_BUFFER_INFO.Ptr, pBufferInfo, "ptr*", &ppFFT := 0, "HRESULT")
    return ID3DX11FFT(ppFFT)
}

/**
 * Creates an ID3DX11FFT COM interface object. (D3DX11CreateFFT3DReal)
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface to use for the FFT.
 * @param {Integer} X Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the first dimension of the FFT.
 * @param {Integer} Y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the second dimension of the FFT.
 * @param {Integer} Z Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the third dimension of the FFT.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Flags that affect the behavior of the FFT, can be 0 or a combination of flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag">D3DX11_FFT_CREATE_FLAG</a>.
 * @param {Pointer<D3DX11_FFT_BUFFER_INFO>} pBufferInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure that receives the buffer requirements to execute the FFT algorithms. Use this info to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 * @returns {ID3DX11FFT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a>**</b>
 * 
 * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a> interface for the created FFT object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft3dreal
 */
export D3DX11CreateFFT3DReal(pDeviceContext, X, Y, Z, Flags, pBufferInfo) {
    result := DllCall("d3dcsx.dll\D3DX11CreateFFT3DReal", "ptr", pDeviceContext, "uint", X, "uint", Y, "uint", Z, "uint", Flags, D3DX11_FFT_BUFFER_INFO.Ptr, pBufferInfo, "ptr*", &ppFFT := 0, "HRESULT")
    return ID3DX11FFT(ppFFT)
}

/**
 * Creates an ID3DX11FFT COM interface object. (D3DX11CreateFFT3DComplex)
 * @param {ID3D11DeviceContext} pDeviceContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface to use for the FFT.
 * @param {Integer} X Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the first dimension of the FFT.
 * @param {Integer} Y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the second dimension of the FFT.
 * @param {Integer} Z Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Length of the third dimension of the FFT.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Flags that affect the behavior of the FFT, can be 0 or a combination of flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag">D3DX11_FFT_CREATE_FLAG</a>.
 * @param {Pointer<D3DX11_FFT_BUFFER_INFO>} pBufferInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure that receives the buffer requirements to execute the FFT algorithms. Use this info to allocate raw buffers of the specified (or larger) sizes and then call the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a> method to register the buffers with the FFT object.
 * @returns {ID3DX11FFT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a>**</b>
 * 
 * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nn-d3dcsx-id3dx11fft">ID3DX11FFT</a> interface for the created FFT object.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft3dcomplex
 */
export D3DX11CreateFFT3DComplex(pDeviceContext, X, Y, Z, Flags, pBufferInfo) {
    result := DllCall("d3dcsx.dll\D3DX11CreateFFT3DComplex", "ptr", pDeviceContext, "uint", X, "uint", Y, "uint", Z, "uint", Flags, D3DX11_FFT_BUFFER_INFO.Ptr, pBufferInfo, "ptr*", &ppFFT := 0, "HRESULT")
    return ID3DX11FFT(ppFFT)
}

;@endregion Functions

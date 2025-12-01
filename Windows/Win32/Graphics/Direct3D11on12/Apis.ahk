#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 * @version v4.0.30319
 */
class Direct3D11on12 {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Creates a device that uses Direct3D 11 functionality in Direct3D 12, specifying a pre-existing Direct3D 12 device to use for Direct3D 11 interop.
     * @remarks
     * The function signature PFN_D3D11ON12_CREATE_DEVICE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
     * @param {IUnknown} pDevice Type: <b>IUnknown*</b>
     * 
     * Specifies a pre-existing Direct3D 12 device to use for Direct3D 11 interop. May not be NULL.
     * @param {Integer} Flags Type: <b>UINT</b>
     * 
     * One or more bitwise OR'd flags from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_FLAG</a>. These are the same flags as those used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>. Specifies which runtime <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">layers</a> to enable. <i>Flags</i> must be compatible with device flags, and its <i>NodeMask</i> must be a subset of the <i>NodeMask</i> provided to the present API.
     * @param {Pointer<Integer>} pFeatureLevels Type: <b>const D3D_FEATURE_LEVEL*</b>
     * 
     * An array of any of the following:
     * 
     * <ul>
     * <li>D3D_FEATURE_LEVEL_12_1</li>
     * <li>D3D_FEATURE_LEVEL_12_0</li>
     * <li>D3D_FEATURE_LEVEL_11_1</li>
     * <li>D3D_FEATURE_LEVEL_11_0</li>
     * <li>D3D_FEATURE_LEVEL_10_1</li>
     * <li>D3D_FEATURE_LEVEL_10_0</li>
     * <li>D3D_FEATURE_LEVEL_9_3</li>
     * <li>D3D_FEATURE_LEVEL_9_2</li>
     * <li>D3D_FEATURE_LEVEL_9_1</li>
     * </ul>
     * 
     * The first feature level that is less than or equal to the Direct3D 12 device's feature level will be used to perform Direct3D 11 validation. Creation will fail if no acceptable feature levels are provided. Providing NULL will default to the Direct3D 12 device's feature level.
     * @param {Integer} FeatureLevels Type: <b>UINT</b>
     * 
     * The size of (that is, the number of elements in) the *pFeatureLevels* array.
     * @param {Pointer<IUnknown>} ppCommandQueues Type: <b>IUnknown* const *</b>
     * 
     * An array of unique queues for D3D11On12 to use. The queues must be of the 3D command queue type.
     * @param {Integer} NumQueues Type: <b>UINT</b>
     * 
     * The size of (that is, the number of elements in) the *ppCommandQueues* array.
     * @param {Integer} NodeMask Type: <b>UINT</b>
     * 
     * Which node of the Direct3D 12 device to use. Only 1 bit may be set.
     * @param {Pointer<ID3D11Device>} ppDevice Type: <b>ID3D11Device**</b>
     * 
     * Pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>. May be NULL.
     * @param {Pointer<ID3D11DeviceContext>} ppImmediateContext Type: <b>ID3D11DeviceContext**</b>
     * 
     * A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>. May be NULL.
     * @param {Pointer<Integer>} pChosenFeatureLevel Type: <b>D3D_FEATURE_LEVEL*</b>
     * 
     * A pointer to the returned feature level. May be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a> that are documented for <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>.          
     * 
     * This method returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_SDK_COMPONENT_MISSING</a> if you specify <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_DEBUG</a> in <i>Flags</i> and the incorrect version of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> is installed on your computer. Install the latest Windows SDK to get the correct version.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-d3d11on12createdevice
     */
    static D3D11On12CreateDevice(pDevice, Flags, pFeatureLevels, FeatureLevels, ppCommandQueues, NumQueues, NodeMask, ppDevice, ppImmediateContext, pChosenFeatureLevel) {
        pFeatureLevelsMarshal := pFeatureLevels is VarRef ? "int*" : "ptr"
        pChosenFeatureLevelMarshal := pChosenFeatureLevel is VarRef ? "int*" : "ptr"

        result := DllCall("d3d11.dll\D3D11On12CreateDevice", "ptr", pDevice, "uint", Flags, pFeatureLevelsMarshal, pFeatureLevels, "uint", FeatureLevels, "ptr*", ppCommandQueues, "uint", NumQueues, "uint", NodeMask, "ptr*", ppDevice, "ptr*", ppImmediateContext, pChosenFeatureLevelMarshal, pChosenFeatureLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}

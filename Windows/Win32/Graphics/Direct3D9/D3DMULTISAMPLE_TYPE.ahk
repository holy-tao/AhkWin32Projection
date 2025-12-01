#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the levels of full-scene multisampling that the device can apply.
 * @remarks
 * In addition to enabling full-scene multisampling at [**IDirect3DDevice9::Reset**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-reset) time, there will be render states that turn various aspects on and off at fine-grained levels.
 * 
 * Multisampling is valid only on a swap chain that is being created or reset with the D3DSWAPEFFECT\_DISCARD swap effect.
 * 
 * The multisample antialiasing value can be set with the parameters (or sub-parameters) in the following methods.
 * 
 * 
 * 
 * | Method                                                                                             | Parameters                         | Sub-parameters                     |
 * |----------------------------------------------------------------------------------------------------|------------------------------------|------------------------------------|
 * | [**IDirect3D9::CheckDeviceMultiSampleType**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype)           | MultiSampleType and pQualityLevels |                                    |
 * | [**IDirect3D9::CreateDevice**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-createdevice)                                       | pPresentationParameters            | MultiSampleType and pQualityLevels |
 * | [**IDirect3DDevice9::CreateAdditionalSwapChain**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-createadditionalswapchain) | pPresentationParameters            | MultiSampleType and pQualityLevels |
 * | [**IDirect3DDevice9::CreateDepthStencilSurface**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-createdepthstencilsurface) | MultiSampleType and pQualityLevels |                                    |
 * | [**IDirect3DDevice9::CreateRenderTarget**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-createrendertarget)               | MultiSampleType and pQualityLevels |                                    |
 * | [**IDirect3DDevice9::Reset**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-reset)                                         | pPresentationParameters            | MultiSampleType and pQualityLevels |
 * 
 * 
 * 
 *  
 * 
 * It is not good practice to switch from one multisample type to another to raise the quality of the antialiasing.
 * 
 * D3DMULTISAMPLE\_NONE enables swap effects other than discarding, locking, and so on.
 * 
 * Whether the display device supports maskable multisampling (more than one sample for a multiple-sample render-target format plus antialias support) or just non-maskable multisampling (only antialias support), the driver for the device provides the number of quality levels for the D3DMULTISAMPLE\_NONMASKABLE multiple-sample type. Applications that just use multisampling for antialiasing purposes only need to query for the number of non-maskable multiple-sample quality levels that the driver supports.
 * 
 * The quality levels supported by the device can be obtained with the pQualityLevels parameter of [**IDirect3D9::CheckDeviceMultiSampleType**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype). Quality levels used by the application are set with the MultiSampleQuality parameter of [**IDirect3DDevice9::CreateDepthStencilSurface**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-createdepthstencilsurface) and [**IDirect3DDevice9::CreateRenderTarget**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-createrendertarget).
 * 
 * See D3DRS\_MULTISAMPLEMASK for discussion of maskable multisampling.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dmultisample-type
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DMULTISAMPLE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_NONMASKABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_2_SAMPLES => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_3_SAMPLES => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_4_SAMPLES => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_5_SAMPLES => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_6_SAMPLES => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_7_SAMPLES => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_8_SAMPLES => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_9_SAMPLES => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_10_SAMPLES => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_11_SAMPLES => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_12_SAMPLES => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_13_SAMPLES => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_14_SAMPLES => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_15_SAMPLES => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DMULTISAMPLE_16_SAMPLES => 16
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the monitor being used to display a full-screen application is rotated.
 * @remarks
 * This enumeration is used in [**IDirect3D9Ex::GetAdapterDisplayModeEx**](/windows/desktop/api/d3d9/nf-d3d9-idirect3d9ex-getadapterdisplaymodeex), [**IDirect3DDevice9Ex::GetDisplayModeEx**](/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-getdisplaymodeex), and [**IDirect3DSwapChain9Ex::GetDisplayModeEx**](/windows/desktop/api/D3D9/nf-d3d9-idirect3dswapchain9ex-getdisplaymodeex).
 * 
 * Applications may choose to handle monitor rotation themselves by using the [D3DPRESENTFLAG\_NOAUTOROTATE](d3dpresentflag.md), in which case, the application will need to know how the monitor is rotated so that it may adjust its rendering accordingly.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddisplayrotation
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DDISPLAYROTATION extends Win32Enum {

    /**
     * Native name: D3DDISPLAYROTATION_IDENTITY
     * @type {Integer (Int32)}
     */
    static IDENTITY => 1

    /**
     * Native name: D3DDISPLAYROTATION_90
     * @type {Integer (Int32)}
     */
    static 90 => 2

    /**
     * Native name: D3DDISPLAYROTATION_180
     * @type {Integer (Int32)}
     */
    static 180 => 3

    /**
     * Native name: D3DDISPLAYROTATION_270
     * @type {Integer (Int32)}
     */
    static 270 => 4
}

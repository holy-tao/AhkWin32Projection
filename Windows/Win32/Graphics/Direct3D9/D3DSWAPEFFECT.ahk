#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines swap effects.
 * @remarks
 * The state of the back buffer after a call to Present is well-defined by each of these swap effects, and whether the Direct3D device was created with a full-screen swap chain or a windowed swap chain has no effect on this state. In particular, the D3DSWAPEFFECT\_FLIP swap effect operates the same whether windowed or full-screen, and the Direct3D runtime guarantees this by creating extra buffers. As a result, it is recommended that applications use D3DSWAPEFFECT\_DISCARD whenever possible to avoid any such penalties. This is because this swap effect will always be the most efficient in terms of memory consumption and performance.
  * 
  * Applications that use D3DSWAPEFFECT\_FLIP or D3DSWAPEFFECT\_DISCARD should not expect full-screen destination alpha to work. This means that the D3DRS\_DESTBLEND render state will not work as expected because full-screen swap chains with these swap effects do not have an explicit pixel format from the driver's point of view. The driver infers that they should take on the display format, which does not have an alpha channel. To work around this, take the following steps:
  * 
  * -   Use D3DSWAPEFFECT\_COPY.
  * -   Check the D3DCAPS3\_ALPHA\_FULLSCREEN\_FLIP\_OR\_DISCARD flag in the Caps3 member of the [**D3DCAPS9**](/windows/desktop/api/D3D9Caps/ns-d3d9caps-d3dcaps9) structure. This flag indicates whether the driver can do alpha blending when D3DSWAPEFFECT\_FLIP or D3DSWAPEFFECT\_DISCARD is used.
  * -   Applications using flip mode swap effect (D3DSWAPEFFECT\_FLIPEX) should call [**PresentEx**](/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9ex-presentex) after a window resize or region change to ensure that the display content is updated.
  * 
  * An invisible window cannot receive user-mode events; furthermore, an invisible-fullscreen window will interfere with the presentation of another applications' windowed-mode window. Therefore, each application needs to ensure that a device window is visible when a swapchain is presented in fullscreen mode.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dswapeffect
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSWAPEFFECT{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_DISCARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_FLIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_COPY => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_OVERLAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_FLIPEX => 5
}

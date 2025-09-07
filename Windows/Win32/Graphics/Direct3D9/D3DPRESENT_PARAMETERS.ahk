#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Describes the presentation parameters.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dpresent-parameters
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DPRESENT_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the new swap chain's back buffers, in pixels. If **Windowed** is **FALSE** (the presentation is full-screen), this value must equal the width of one of the enumerated display modes found through [**EnumAdapterModes**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-enumadaptermodes). If **Windowed** is **TRUE** and either **BackBufferWidth** or **BackBufferHeight** is zero, the corresponding dimension of the client area of the **hDeviceWindow** (or the focus window, if **hDeviceWindow** is **NULL**) is taken.
     * @type {Integer}
     */
    BackBufferWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of the new swap chain's back buffers, in pixels. If **Windowed** is **FALSE** (the presentation is full-screen), this value must equal the height of one of the enumerated display modes found through [**EnumAdapterModes**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-enumadaptermodes). If **Windowed** is **TRUE** and either **BackBufferWidth** or **BackBufferHeight** is zero, the corresponding dimension of the client area of the **hDeviceWindow** (or the focus window, if **hDeviceWindow** is **NULL**) is taken.
     * @type {Integer}
     */
    BackBufferHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * The back buffer format. For more information about formats, see [D3DFORMAT](d3dformat.md). This value must be one of the render-target formats as validated by [**CheckDeviceType**](/windows/desktop/api). You can use [**GetDisplayMode**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-getdisplaymode) to obtain the current format.
     * 
     * In fact, D3DFMT\_UNKNOWN can be specified for the **BackBufferFormat** while in windowed mode. This tells the runtime to use the current display-mode format and eliminates the need to call [**GetDisplayMode**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-getdisplaymode).
     * 
     * For windowed applications, the back buffer format no longer needs to match the display-mode format because color conversion can now be done by the hardware (if the hardware supports color conversion). The set of possible back buffer formats is constrained, but the runtime will allow any valid back buffer format to be presented to any desktop format. (There is the additional requirement that the device be operable in the desktop; devices typically do not operate in 8 bits per pixel modes.)
     * 
     * Full-screen applications cannot do color conversion.
     * @type {Integer}
     */
    BackBufferFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * This value can be between 0 and [D3DPRESENT\_BACK\_BUFFERS\_MAX](d3dpresent-back-buffers.md) (or [D3DPRESENT\_BACK\_BUFFERS\_MAX\_EX](d3dpresent-back-buffers.md) when using Direct3D 9Ex). Values of 0 are treated as 1. If the number of back buffers cannot be created, the runtime will fail the method call and fill this value with the number of back buffers that could be created. As a result, an application can call the method twice with the same D3DPRESENT\_PARAMETERS structure and expect it to work the second time.
     * 
     * The method fails if one back buffer cannot be created. The value of **BackBufferCount** influences what set of swap effects are allowed. Specifically, any D3DSWAPEFFECT\_COPY swap effect requires that there be exactly one back buffer.
     * @type {Integer}
     */
    BackBufferCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **[**D3DMULTISAMPLE\_TYPE**](./d3dmultisample-type.md)**
     * 
     * 
     * Member of the [**D3DMULTISAMPLE\_TYPE**](./d3dmultisample-type.md) enumerated type. The value must be D3DMULTISAMPLE\_NONE unless **SwapEffect** has been set to D3DSWAPEFFECT\_DISCARD. Multisampling is supported only if the swap effect is D3DSWAPEFFECT\_DISCARD.
     * @type {Integer}
     */
    MultiSampleType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Quality level. The valid range is between zero and one less than the level returned by pQualityLevels used by [**CheckDeviceMultiSampleType**](/windows/desktop/api). Passing a larger value returns the error D3DERR\_INVALIDCALL. Paired values of render targets or of depth stencil surfaces and [**D3DMULTISAMPLE\_TYPE**](./d3dmultisample-type.md) must match.
     * @type {Integer}
     */
    MultiSampleQuality {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: **[**D3DSWAPEFFECT**](./d3dswapeffect.md)**
     * 
     * 
     * Member of the [**D3DSWAPEFFECT**](./d3dswapeffect.md) enumerated type. The runtime will guarantee the implied semantics concerning buffer swap behavior; therefore, if **Windowed** is **TRUE** and **SwapEffect** is set to D3DSWAPEFFECT\_FLIP, the runtime will create one extra back buffer and copy whichever becomes the front buffer at presentation time.
     * 
     * D3DSWAPEFFECT\_COPY requires that **BackBufferCount** be set to 1.
     * 
     * D3DSWAPEFFECT\_DISCARD will be enforced in the debug runtime by filling any buffer with noise after it is presented.
     * 
     * Differences between Direct3D9 and Direct3D9Ex:
     * 
     * - In Direct3D9Ex, D3DSWAPEFFECT\_FLIPEX is added to designate when an application is adopting flip mode. That is, whan an application's frame is passed in window's mode (instead of copied) to the Desktop Window Manager(DWM) for composition. Flip mode provides more efficient memory bandwidth and enables an application to take advantage of full-screen-present statistics. It does not change full screen behavior. Flip mode behavior is available beginning with Windows 7.
     * @type {Integer}
     */
    SwapEffect {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: **[**HWND**](../winprog/windows-data-types.md)**
     * 
     * 
     * The device window determines the location and size of the back buffer on screen. This is used by Direct3D when the back buffer contents are copied to the front buffer during [**Present**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-present).
     * 
     * -   For a full-screen application, this is a handle to the top window (which is the focus window).
     * 
     *     For applications that use multiple full-screen devices (such as a multimonitor system), exactly one device can use the focus window as the device window. All other devices must have unique device windows.
     * 
     * -   For a windowed-mode application, this handle will be the default target window for [**Present**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-present). If this handle is **NULL**, the focus window will be taken.
     * 
     * Note that no attempt is made by the runtime to reflect user changes in window size. The back buffer is not implicitly reset when this window is reset. However, the [**Present**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-present) method does automatically track window position changes.
     * @type {HWND}
     */
    hDeviceWindow{
        get {
            if(!this.HasProp("__hDeviceWindow"))
                this.__hDeviceWindow := HWND(this.ptr + 32)
            return this.__hDeviceWindow
        }
    }

    /**
     * Type: **[**BOOL**](../winprog/windows-data-types.md)**
     * @type {Integer}
     */
    Windowed {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: **[**BOOL**](../winprog/windows-data-types.md)**
     * 
     * 
     * If this value is **TRUE**, Direct3D will manage depth buffers for the application. The device will create a depth-stencil buffer when it is created. The depth-stencil buffer will be automatically set as the render target of the device. When the device is reset, the depth-stencil buffer will be automatically destroyed and recreated in the new size.
     * 
     * If EnableAutoDepthStencil is **TRUE**, then AutoDepthStencilFormat must be a valid depth-stencil format.
     * @type {Integer}
     */
    EnableAutoDepthStencil {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type. The format of the automatic depth-stencil surface that the device will create. This member is ignored unless **EnableAutoDepthStencil** is **TRUE**.
     * @type {Integer}
     */
    AutoDepthStencilFormat {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * One of the [D3DPRESENTFLAG](d3dpresentflag.md) constants.
     * 
     * 
     * **FullScreen\_RefreshRateInHz**
     * 
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The rate at which the display adapter refreshes the screen. The value depends on the mode in which the application is running:
     * 
     * -   For windowed mode, the refresh rate must be 0.
     * -   For full-screen mode, the refresh rate is one of the refresh rates returned by [**EnumAdapterModes**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-enumadaptermodes).
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    FullScreen_RefreshRateInHz {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The maximum rate at which the swap chain's back buffers can be presented to the front buffer. For a detailed explanation of the modes and the intervals that are supported, see [D3DPRESENT](d3dpresent.md).
     * @type {Integer}
     */
    PresentationInterval {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}

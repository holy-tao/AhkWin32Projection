#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9Ex.ahk
#Include .\IDirect3D9.ahk

/**
 * Applications use the methods of the IDirect3D9Ex interface (which inherits from IDirect3D9) to create Microsoft Direct3D 9Ex objects and set up the environment.
 * @remarks
 * 
 * The <b>IDirect3D9Ex</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-direct3dcreate9ex">Direct3DCreate9Ex</a> function.
 * 
 * The <b>LPDIRECT3D9EX</b> and <b>PDIRECT3D9EX</b> types are defined as pointers to the <b>IDirect3D9Ex</b> interface:
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3D9Ex *LPDIRECT3D9EX, *PDIRECT3D9EX;
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3d9ex
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3D9Ex extends IDirect3D9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D9Ex
     * @type {Guid}
     */
    static IID => Guid("{02177241-69fc-400c-8ff1-93a44df6861d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdapterModeCountEx", "EnumAdapterModesEx", "GetAdapterDisplayModeEx", "CreateDeviceEx", "GetAdapterLUID"]

    /**
     * Returns the number of display modes available.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number denoting the display adapter from which to retrieve the display mode count.
     * @param {Pointer<D3DDISPLAYMODEFILTER>} pFilter Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodefilter">D3DDISPLAYMODEFILTER</a>*</b>
     * 
     * Specifies the characteristics of the desired display mode. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodefilter">D3DDISPLAYMODEFILTER</a>.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of display modes available. A return of value zero from this method is an indication that no such display mode is supported or simply this monitor is no longer available.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3d9ex-getadaptermodecountex
     */
    GetAdapterModeCountEx(Adapter, pFilter) {
        result := ComCall(17, this, "uint", Adapter, "ptr", pFilter, "uint")
        return result
    }

    /**
     * This method returns the actual display mode info based on the given mode index.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number denoting the display adapter to enumerate. D3DADAPTER_DEFAULT is always the primary display adapter. This method returns D3DERR_INVALIDCALL when this value equals or exceeds the number of display adapters in the system.
     * @param {Pointer<D3DDISPLAYMODEFILTER>} pFilter Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodefilter">D3DDISPLAYMODEFILTER</a>*</b>
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodefilter">D3DDISPLAYMODEFILTER</a>.
     * @param {Integer} Mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Represents the display-mode index which is an unsigned integer between zero and the value returned by GetAdapterModeCount minus one.
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>*</b>
     * 
     * A pointer to the available display mode of type <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <ul>
     * <li>If the device can be used on this adapter, D3D_OK is returned.</li>
     * <li>If the Adapter equals or exceeds the number of display adapters in the system, D3DERR_INVALIDCALL is returned.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3d9ex-enumadaptermodesex
     */
    EnumAdapterModesEx(Adapter, pFilter, Mode, pMode) {
        result := ComCall(18, this, "uint", Adapter, "ptr", pFilter, "uint", Mode, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the current display mode and rotation settings of the adapter.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter to query. D3DADAPTER_DEFAULT is always the primary display adapter.
     * @param {Pointer<D3DDISPLAYMODEEX>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a> structure containing data about the display mode of the adapter. As opposed to the display mode of the device, which may not be active if the device does not own full-screen mode. Can be set to <b>NULL</b>.
     * @param {Pointer<Integer>} pRotation Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplayrotation">D3DDISPLAYROTATION</a> structure indicating the type of screen rotation the application will do. The value returned through this pointer is important when the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresentflag">D3DPRESENTFLAG_NOAUTOROTATE</a> flag is used; otherwise, it can be set to <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. 
     * 
     * 
     * 
     * If <i>Adapter</i> is out of range or <i>pMode</i> is invalid, this method returns D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3d9ex-getadapterdisplaymodeex
     */
    GetAdapterDisplayModeEx(Adapter, pMode, pRotation) {
        pRotationMarshal := pRotation is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "uint", Adapter, "ptr", pMode, pRotationMarshal, pRotation, "HRESULT")
        return result
    }

    /**
     * Creates a device to represent the display adapter.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter. <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-default">D3DADAPTER_DEFAULT</a> is always the primary display adapter.
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Specifies the type of device. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a>. If the desired device type is not available, the method will fail.
     * @param {HWND} hFocusWindow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The focus window alerts Direct3D when an application switches from foreground mode to background mode. For full-screen mode, the window specified must be a top-level window. For windowed mode, this parameter may be <b>NULL</b> only if the hDeviceWindow member of pPresentationParameters is set to a valid, non-<b>NULL</b> value.
     * @param {Integer} BehaviorFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of one or more options (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>) that control device creation.
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structure, describing the presentation parameters for the device to be created. If <i>BehaviorFlags</i> specifies <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE_ADAPTERGROUP_DEVICE</a>, this parameter is an array. Regardless of the number of heads that exist, only one depth/stencil surface is automatically created.
     * 
     * This parameter is both an input and an output parameter. Calling this method may change several members including:
     * 
     * <ul>
     * <li>If BackBufferCount, BackBufferWidth, and BackBufferHeight are 0 before the method is called, they will be changed when the method returns.</li>
     * <li>If BackBufferFormat equals <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_UNKNOWN</a> before the method is called, it will be changed when the method returns.</li>
     * </ul>
     * @param {Pointer<D3DDISPLAYMODEEX>} pFullscreenDisplayMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>*</b>
     * 
     * The display mode for when the device is set to fullscreen. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymodeex">D3DDISPLAYMODEEX</a>. If <i>BehaviorFlags</i> specifies <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE_ADAPTERGROUP_DEVICE</a>, this parameter is an array. This parameter must be <b>NULL</b> for windowed mode.
     * @returns {IDirect3DDevice9Ex} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex">IDirect3DDevice9Ex</a>**</b>
     * 
     * Address of a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex">IDirect3DDevice9Ex</a>, which represents the created device.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3d9ex-createdeviceex
     */
    CreateDeviceEx(Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters, pFullscreenDisplayMode) {
        hFocusWindow := hFocusWindow is Win32Handle ? NumGet(hFocusWindow, "ptr") : hFocusWindow

        result := ComCall(20, this, "uint", Adapter, "int", DeviceType, "ptr", hFocusWindow, "uint", BehaviorFlags, "ptr", pPresentationParameters, "ptr", pFullscreenDisplayMode, "ptr*", &ppReturnedDeviceInterface := 0, "HRESULT")
        return IDirect3DDevice9Ex(ppReturnedDeviceInterface)
    }

    /**
     * This method returns a unique identifier for the adapter that is specific to the adapter hardware. Applications can use this identifier to define robust mappings across various APIs (Direct3D 9, DXGI).
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number denoting the display adapter from which to retrieve the LUID.
     * @param {Pointer<LUID>} pLUID Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a>*</b>
     * 
     * A unique identifier for the given adapter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3d9ex-getadapterluid
     */
    GetAdapterLUID(Adapter, pLUID) {
        result := ComCall(21, this, "uint", Adapter, "ptr", pLUID, "HRESULT")
        return result
    }
}

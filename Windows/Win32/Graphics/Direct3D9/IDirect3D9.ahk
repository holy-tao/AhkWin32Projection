#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Gdi\HMONITOR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3D9 interface to create Microsoft Direct3D objects and set up the environment. This interface includes methods for enumerating and retrieving capabilities of the device.
 * @remarks
 * 
  * The <b>IDirect3D9</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-direct3dcreate9">Direct3DCreate9</a> function.
  * 
  * The LPDIRECT3D9 and PDIRECT3D9 types are defined as pointers to the <b>IDirect3D9</b> interface.
  *     
  *             
  * 
  * 
  * ```
  * typedef struct IDirect3D9 *LPDIRECT3D9, *PDIRECT3D9;
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3d9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3D9 extends IUnknown{
    /**
     * The interface identifier for IDirect3D9
     * @type {Guid}
     */
    static IID => Guid("{81bdcbca-64d4-426d-ae8d-ad0147f4275c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Void>} pInitializeFunction 
     * @returns {HRESULT} 
     */
    RegisterSoftwareDevice(pInitializeFunction) {
        result := ComCall(3, this, "ptr", pInitializeFunction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAdapterCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} Flags 
     * @param {Pointer<D3DADAPTER_IDENTIFIER9>} pIdentifier 
     * @returns {HRESULT} 
     */
    GetAdapterIdentifier(Adapter, Flags, pIdentifier) {
        result := ComCall(5, this, "uint", Adapter, "uint", Flags, "ptr", pIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} Format 
     * @returns {Integer} 
     */
    GetAdapterModeCount(Adapter, Format) {
        result := ComCall(6, this, "uint", Adapter, "uint", Format, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} Format 
     * @param {Integer} Mode 
     * @param {Pointer<D3DDISPLAYMODE>} pMode 
     * @returns {HRESULT} 
     */
    EnumAdapterModes(Adapter, Format, Mode, pMode) {
        result := ComCall(7, this, "uint", Adapter, "uint", Format, "uint", Mode, "ptr", pMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<D3DDISPLAYMODE>} pMode 
     * @returns {HRESULT} 
     */
    GetAdapterDisplayMode(Adapter, pMode) {
        result := ComCall(8, this, "uint", Adapter, "ptr", pMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DevType 
     * @param {Integer} AdapterFormat 
     * @param {Integer} BackBufferFormat 
     * @param {BOOL} bWindowed 
     * @returns {HRESULT} 
     */
    CheckDeviceType(Adapter, DevType, AdapterFormat, BackBufferFormat, bWindowed) {
        result := ComCall(9, this, "uint", Adapter, "int", DevType, "uint", AdapterFormat, "uint", BackBufferFormat, "int", bWindowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} AdapterFormat 
     * @param {Integer} Usage 
     * @param {Integer} RType 
     * @param {Integer} CheckFormat 
     * @returns {HRESULT} 
     */
    CheckDeviceFormat(Adapter, DeviceType, AdapterFormat, Usage, RType, CheckFormat) {
        result := ComCall(10, this, "uint", Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", Usage, "int", RType, "uint", CheckFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} SurfaceFormat 
     * @param {BOOL} Windowed 
     * @param {Integer} MultiSampleType 
     * @param {Pointer<UInt32>} pQualityLevels 
     * @returns {HRESULT} 
     */
    CheckDeviceMultiSampleType(Adapter, DeviceType, SurfaceFormat, Windowed, MultiSampleType, pQualityLevels) {
        result := ComCall(11, this, "uint", Adapter, "int", DeviceType, "uint", SurfaceFormat, "int", Windowed, "int", MultiSampleType, "uint*", pQualityLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} AdapterFormat 
     * @param {Integer} RenderTargetFormat 
     * @param {Integer} DepthStencilFormat 
     * @returns {HRESULT} 
     */
    CheckDepthStencilMatch(Adapter, DeviceType, AdapterFormat, RenderTargetFormat, DepthStencilFormat) {
        result := ComCall(12, this, "uint", Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", RenderTargetFormat, "uint", DepthStencilFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Integer} SourceFormat 
     * @param {Integer} TargetFormat 
     * @returns {HRESULT} 
     */
    CheckDeviceFormatConversion(Adapter, DeviceType, SourceFormat, TargetFormat) {
        result := ComCall(13, this, "uint", Adapter, "int", DeviceType, "uint", SourceFormat, "uint", TargetFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetDeviceCaps function retrieves device-specific information for the specified device.
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {Pointer<D3DCAPS9>} pCaps 
     * @returns {HRESULT} The return value specifies the value of the desired item.
     * 
     * When <i>nIndex</i> is BITSPIXEL and the device has 15bpp or 16bpp, the return value is 16.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdevicecaps
     */
    GetDeviceCaps(Adapter, DeviceType, pCaps) {
        result := ComCall(14, this, "uint", Adapter, "int", DeviceType, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @returns {HMONITOR} 
     */
    GetAdapterMonitor(Adapter) {
        result := ComCall(15, this, "uint", Adapter, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DeviceType 
     * @param {HWND} hFocusWindow 
     * @param {Integer} BehaviorFlags 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @param {Pointer<IDirect3DDevice9>} ppReturnedDeviceInterface 
     * @returns {HRESULT} 
     */
    CreateDevice(Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters, ppReturnedDeviceInterface) {
        hFocusWindow := hFocusWindow is Win32Handle ? NumGet(hFocusWindow, "ptr") : hFocusWindow

        result := ComCall(16, this, "uint", Adapter, "int", DeviceType, "ptr", hFocusWindow, "uint", BehaviorFlags, "ptr", pPresentationParameters, "ptr", ppReturnedDeviceInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

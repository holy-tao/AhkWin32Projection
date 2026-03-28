#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Gdi\HMONITOR.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirect3D9 (d3d9.h) interface applications use the methods of the IDirect3D9 interface to create Microsoft Direct3D objects and set up the environment.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3d9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3D9 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterSoftwareDevice", "GetAdapterCount", "GetAdapterIdentifier", "GetAdapterModeCount", "EnumAdapterModes", "GetAdapterDisplayMode", "CheckDeviceType", "CheckDeviceFormat", "CheckDeviceMultiSampleType", "CheckDepthStencilMatch", "CheckDeviceFormatConversion", "GetDeviceCaps", "GetAdapterMonitor", "CreateDevice"]

    /**
     * The IDirect3D9::RegisterSoftwareDevice method (d3d9.h) registers a pluggable software device.
     * @remarks
     * If the user's computer provides no special hardware acceleration for 3D operations, your application might emulate 3D hardware in software. Software rasterization devices emulate the functions of color 3D hardware in software. A software device runs more slowly than a hal. However, software devices take advantage of any special instructions supported by the CPU to increase performance. Instruction sets include the AMD 3DNow! instruction set on some AMD processors and the MMX instruction set supported by many Intel processors. Direct3D uses the 3D-Now! instruction set to accelerate transformation and lighting operations and the MMX instruction set to accelerate rasterization.
     * 
     * Software devices communicate with Direct3D through an interface similar to the hardware device driver interface (DDI).
     * 
     * Software devices are loaded by the application and registered with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> object. Direct3D uses the software device for rendering. 
     * 
     * The Direct3D Driver Development Kit (DDK) provides the documentation and headers for developing pluggable software devices.
     * @param {Pointer<Void>} pInitializeFunction Type: <b>void*</b>
     * 
     * Pointer to the initialization function for the software device to be registered.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL. The method call is invalid. For example, a method's parameter may have an invalid value: D3DERR_OUTOFVIDEOMEMORY.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-registersoftwaredevice
     */
    RegisterSoftwareDevice(pInitializeFunction) {
        pInitializeFunctionMarshal := pInitializeFunction is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pInitializeFunctionMarshal, pInitializeFunction, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::GetAdapterCount method (d3d9.h) returns the number of adapters on the system.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A UINT value that denotes the number of adapters on the system at the time this <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface was instantiated.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadaptercount
     */
    GetAdapterCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * The IDirect3D9::GetAdapterIdentifier method (d3d9.h) describes the physical display adapters present in the system when the IDirect3D9 interface was instantiated.
     * @param {Integer} _Adapter 
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Flags sets the <b>WHQLLevel</b> member of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-identifier9">D3DADAPTER_IDENTIFIER9</a>. Flags can be set to either 0 or D3DENUM_WHQL_LEVEL. If D3DENUM_WHQL_LEVEL is specified, this call can connect to the Internet to download new Microsoft Windows Hardware Quality Labs (WHQL) certificates.
     * 
     * Differences between Direct3D 9 and Direct3D 9Ex:
     * 
     * D3DENUM_WHQL_LEVEL is deprecated for Direct3D9Ex running on Windows Vista, Windows Server 2008, Windows 7, and Windows Server 2008 R2 (or more current operating system). Any of these operating systems return 1 in the <b>WHQLLevel</b> member of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-identifier9">D3DADAPTER_IDENTIFIER9</a> without checking the status of the driver.
     * @param {Pointer<D3DADAPTER_IDENTIFIER9>} pIdentifier Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-identifier9">D3DADAPTER_IDENTIFIER9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-identifier9">D3DADAPTER_IDENTIFIER9</a> structure to be filled with information describing this adapter. If <i>Adapter</i> is greater than or equal to the number of adapters in the system, this structure will be zeroed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if Adapter is out of range, if Flags contains unrecognized parameters, or if pIdentifier is <b>NULL</b> or points to unwritable memory.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadapteridentifier
     */
    GetAdapterIdentifier(_Adapter, Flags, pIdentifier) {
        result := ComCall(5, this, "uint", _Adapter, "uint", Flags, "ptr", pIdentifier, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::GetAdapterModeCount method (d3d9.h) returns the number of display modes available on this adapter.
     * @param {Integer} _Adapter 
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Identifies the format of the surface type using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-enumadaptermodes">EnumAdapterModes</a> to see the valid formats.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * This method returns the number of display modes on this adapter or zero if Adapter is greater than or equal to the number of adapters on the system.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadaptermodecount
     */
    GetAdapterModeCount(_Adapter, Format) {
        result := ComCall(6, this, "uint", _Adapter, "uint", Format, "uint")
        return result
    }

    /**
     * The IDirect3D9::EnumAdapterModes method (d3d9.h) queries the device to determine whether the specified adapter supports the requested format and display mode.
     * @remarks
     * An application supplies a display mode and a format to <b>EnumAdapterModes</b> which returns a display mode. This method could be used in a loop to enumerate all available display modes.
     * 
     * The application specifies a format and the enumeration is restricted to those display modes that exactly match the format (alpha is ignored). Allowed formats (which are members of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>) are as follows:
     * 
     * <ul>
     * <li>D3DFMT_A1R5G5B5</li>
     * <li>D3DFMT_A2R10G10B10</li>
     * <li>D3DFMT_A8R8G8B8</li>
     * <li>D3DFMT_R5G6B5</li>
     * <li>D3DFMT_X1R5G5B5</li>
     * <li>D3DFMT_X8R8G8B8</li>
     * </ul>
     * In addition, <b>EnumAdapterModes</b> treats pixel formats 565 and 555 as equivalent, and returns the correct version. The difference comes into play only when the application locks the back buffer and there is an explicit flag that the application must set in order to accomplish this.
     * @param {Integer} _Adapter 
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Allowable pixel formats. See Remarks.
     * @param {Integer} _Mode 
     * @param {Pointer<D3DDISPLAYMODE>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>*</b>
     * 
     * A pointer to the available display mode of type <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>. See Remarks.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <ul>
     * <li>If the device can be used on this adapter, D3D_OK is returned.</li>
     * <li>If the Adapter equals or exceeds the number of display adapters in the system, D3DERR_INVALIDCALL is returned.</li>
     * <li>If either surface format is not supported or if hardware acceleration is not available for the specified formats, D3DERR_NOTAVAILABLE is returned.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-enumadaptermodes
     */
    EnumAdapterModes(_Adapter, Format, _Mode, pMode) {
        result := ComCall(7, this, "uint", _Adapter, "uint", Format, "uint", _Mode, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::GetAdapterDisplayMode method (d3d9.h) retrieves the current display mode of the adapter.
     * @remarks
     * <b>GetAdapterDisplayMode</b> will not return the correct format when the display is in an extended format, such as 2:10:10:10. Instead, it returns the format X8R8G8B8.
     * @param {Integer} _Adapter 
     * @param {Pointer<D3DDISPLAYMODE>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a> structure, to be filled with information describing the current adapter's mode.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. 
     * 
     * 
     * 
     * If Adapter is out of range or pMode is invalid, this method returns D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadapterdisplaymode
     */
    GetAdapterDisplayMode(_Adapter, pMode) {
        result := ComCall(8, this, "uint", _Adapter, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::CheckDeviceType method (d3d9.h) verifies whether a hardware accelerated device type can be used on this adapter.
     * @remarks
     * A hal device type requires hardware acceleration. Applications can use CheckDeviceType to determine if the needed hardware and drivers are present to support a hal device. 
     * 
     * Full-screen applications should not specify a DisplayFormat that contains an alpha channel. This will result in a failed call. Note that an alpha channel can be present in the back buffer but the two display formats must be identical in all other respects. For example, if DisplayFormat = D3DFMT_X1R5G5B5, valid values for BackBufferFormat include D3DFMT_X1R5G5B5 and D3DFMT_A1R5G5B5 but exclude D3DFMT_R5G6B5.
     * 
     * The following code fragment shows how you could use CheckDeviceType to test whether a certain device type can be used on this adapter.
     * 
     * 
     * ```
     * 
     * if(SUCCEEDED(pD3Device->CheckDeviceType(D3DADAPTER_DEFAULT, 
     *                                         D3DDEVTYPE_HAL, 
     *                                         DisplayFormat, 
     *                                         BackBufferFormat, 
     *                                         bIsWindowed)))
     *     
     *      return S_OK;
     * // There is no HAL on this adapter using this render-target format. 
     * // Try again, using another format.
     * 
     * ```
     * 
     * 
     * This code returns S_OK if the device can be used on the default adapter with the specified surface format.
     * 
     * Using <b>CheckDeviceType</b> to test for compatibility between a back buffer that differs from the display format will return appropriate values. This means that the call will reflect device capabilities. If the device cannot render to the requested back-buffer format, the call will still return D3DERR_NOTAVAILABLE. If the device can render to the format, but cannot perform the color-converting presentation, the return value will also be D3DERR_NOTAVAILABLE. Applications can discover hardware support for the presentation itself by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformatconversion">CheckDeviceFormatConversion</a>. No software emulation for the color-converting presentation itself will be offered.
     * @param {Integer} _Adapter 
     * @param {Integer} DevType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type, indicating the device type to check.
     * @param {Integer} AdapterFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, indicating the format of the adapter display mode for which the device type is to be checked. For example, some devices will operate only in 16-bits-per-pixel modes.
     * @param {Integer} BackBufferFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Back buffer format. For more information about formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>. This value must be one of the render-target formats. You can use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-getadapterdisplaymode">GetAdapterDisplayMode</a> to obtain the current format.
     *     
     *  For windowed applications, the back buffer format does not need to match the display mode format if the hardware supports color conversion. The set of possible back buffer formats is constrained, but the runtime will allow any valid back buffer format to be presented to any desktop format. There is the additional requirement that the device be operable in the desktop because devices typically do not operate in 8 bits per pixel modes.
     *     
     *  Full-screen applications cannot do color conversion.
     *     
     *  D3DFMT_UNKNOWN is allowed for windowed mode.
     * @param {BOOL} bWindowed Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Value indicating whether the device type will be used in full-screen or windowed mode. If set to <b>TRUE</b>, the query is performed for windowed applications; otherwise, this value should be set <b>FALSE</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the device can be used on this adapter, D3D_OK is returned.
     * 
     *  D3DERR_INVALIDCALL is returned if Adapter equals or exceeds the number of display adapters in the system. D3DERR_INVALIDCALL is also returned if <b>CheckDeviceType</b> specified a device that does not exist.
     * 
     *  D3DERR_NOTAVAILABLE is returned if the requested back buffer format is not supported, or if hardware acceleration is not available for the specified formats.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicetype
     */
    CheckDeviceType(_Adapter, DevType, AdapterFormat, BackBufferFormat, bWindowed) {
        result := ComCall(9, this, "uint", _Adapter, "int", DevType, "uint", AdapterFormat, "uint", BackBufferFormat, "int", bWindowed, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::CheckDeviceFormat method (d3d9helper.h) determines whether a surface format is available as a specified resource type.
     * @remarks
     * Here are some examples using <b>CheckDeviceFormat</b> to check for hardware support of:
     * 
     * <ul>
     * <li>An off-screen plain surface format - Specify Usage = 0 and RType = D3DRTYPE_SURFACE.</li>
     * <li>A depth-stencil format - The following snippet tests for the passed in depth-stencil format:
     *     
     * 
     * ```
     * 
     * BOOL IsDepthFormatExisting( D3DFORMAT DepthFormat, D3DFORMAT AdapterFormat ) 
     * {
     *     HRESULT hr = pD3D->CheckDeviceFormat( D3DADAPTER_DEFAULT,
     *                                           D3DDEVTYPE_HAL,
     *                                           AdapterFormat,
     *                                           D3DUSAGE_DEPTHSTENCIL,
     *                                           D3DRTYPE_SURFACE,
     *                                           DepthFormat);
     *     
     *     return SUCCEEDED( hr );
     * }
     * ```
     * 
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/selecting-a-device">Selecting a Device (Direct3D 9)</a> for more detail on the enumeration process.
     * 
     * </li>
     * <li>Can this texture be rendered in a particular format - Given the current display mode, this example shows how to verify that the texture format is compatible with the specific back-buffer format:
     *     
     *     
     *     
     * 
     * ```
     * 
     * BOOL IsTextureFormatOk( D3DFORMAT TextureFormat, D3DFORMAT AdapterFormat ) 
     * {
     *     HRESULT hr = pD3D->CheckDeviceFormat( D3DADAPTER_DEFAULT,
     *                                           D3DDEVTYPE_HAL,
     *                                           AdapterFormat,
     *                                           0,
     *                                           D3DRTYPE_TEXTURE,
     *                                           TextureFormat);
     *     
     *     return SUCCEEDED( hr );
     * }
     * ```
     * 
     * 
     * </li>
     * <li>Alpha blending in a pixel shader - Set Usage to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_QUERY_POSTPIXELSHADER_BLENDING</a>. Expect this to fail for all floating-point render targets.</li>
     * <li>Autogeneration of mipmaps - Set Usage to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_AUTOGENMIPMAP</a>. If the mipmap automatic generation fails, the application will get a non-mipmapped texture. Calling this method is considered a hint, so this method can return D3DOK_NOAUTOGEN (a valid success code) if the only thing that fails is the mipmap generation. For more information about mipmap generation, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/automatic-generation-of-mipmaps">Automatic Generation of Mipmaps (Direct3D 9)</a>.</li>
     * </ul>
     * When migrating code from Direct3D 9 to Direct3D 10, the Direct3D 10 equivalent to CheckDeviceFormat is <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-checkformatsupport">CheckFormatSupport</a>.
     * @param {Integer} _Adapter 
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type, identifying the device type.
     * @param {Integer} AdapterFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, identifying the format of the display mode into which the adapter will be placed.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Requested usage options for the surface. Usage options are any combination of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage-query">D3DUSAGE_QUERY</a> constants (only a subset of the D3DUSAGE constants are valid for <b>CheckDeviceFormat</b>; see the table on the D3DUSAGE page).
     * @param {Integer} RType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dresourcetype">D3DRESOURCETYPE</a></b>
     * 
     * Resource type requested for use with the queried format. Member of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dresourcetype">D3DRESOURCETYPE</a>.
     * @param {Integer} CheckFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Format of the surfaces which may be used, as defined by Usage. Member of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the format is compatible with the specified device for the requested usage, this method returns D3D_OK.
     * 
     * D3DERR_INVALIDCALL is returned if Adapter equals or exceeds the number of display adapters in the system, or if DeviceType is unsupported.
     * 
     * D3DERR_NOTAVAILABLE is returned if the format is not acceptable to the device for this usage.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformat
     */
    CheckDeviceFormat(_Adapter, DeviceType, AdapterFormat, Usage, RType, CheckFormat) {
        result := ComCall(10, this, "uint", _Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", Usage, "int", RType, "uint", CheckFormat, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::CheckDeviceMultiSampleType method (d3d9.h) determines if a multisampling technique is available on this device.
     * @remarks
     * This method is intended for use with both render-target and depth-stencil surfaces because you must create both surfaces multisampled if you want to use them together.
     * 
     * The following code fragment shows how you could use <b>CheckDeviceMultiSampleType</b> to test for devices that support a specific multisampling method.
     * 
     * 
     * ```
     * 
     * if( SUCCEEDED(pD3D->CheckDeviceMultiSampleType( pCaps->AdapterOrdinal, 
     *                                 pCaps->DeviceType, BackBufferFormat, 
     *                                 FALSE, D3DMULTISAMPLE_3_SAMPLES, NULL ) ) &&
     *          SUCCEEDED(pD3D->CheckDeviceMultiSampleType( pCaps->AdapterOrdinal, 
     *                                 pCaps->DeviceType, DepthBufferFormat, 
     *                                 FALSE, D3DMULTISAMPLE_3_SAMPLES, NULL ) ) )
     *     return S_OK;
     * 
     * ```
     * 
     * 
     * The preceding code will return S_OK if the device supports the full-screen D3DMULTISAMPLE_3_SAMPLES multisampling method with the surface format.
     * 
     * See the remarks in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a> for additional information on working with and setting multisample types and quality levels.
     * @param {Integer} _Adapter 
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type, identifying the device type.
     * @param {Integer} SurfaceFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type that specifies the format of the surface to be multisampled. For more information, see Remarks.
     * @param {BOOL} Windowed Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * bool value. Specify <b>TRUE</b> to inquire about windowed multisampling, and specify <b>FALSE</b> to inquire about full-screen multisampling.
     * @param {Integer} MultiSampleType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a> enumerated type, identifying the multisampling technique to test.
     * @param {Pointer<Integer>} pQualityLevels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * <b>pQualityLevels</b> returns the number of device-specific sampling variations available with the given sample type. For example, if the returned value is 3, then quality levels 0, 1 and 2 can be used when creating resources with the given sample count. The meanings of these quality levels are defined by the device manufacturer and cannot be queried through D3D. For example, for a particular device different quality levels at a fixed sample count might refer to different spatial layouts of the sample locations or different methods of resolving.  This can be <b>NULL</b> if it is not necessary to return the quality levels.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the device can perform the specified multisampling method, this method returns D3D_OK.
     *  D3DERR_INVALIDCALL is returned if the Adapter or MultiSampleType parameters are invalid. This method returns D3DERR_NOTAVAILABLE if the queried multisampling technique is not supported by this device. D3DERR_INVALIDDEVICE is returned if DeviceType does not apply to this adapter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype
     */
    CheckDeviceMultiSampleType(_Adapter, DeviceType, SurfaceFormat, Windowed, MultiSampleType, pQualityLevels) {
        pQualityLevelsMarshal := pQualityLevels is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", _Adapter, "int", DeviceType, "uint", SurfaceFormat, "int", Windowed, "int", MultiSampleType, pQualityLevelsMarshal, pQualityLevels, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::CheckDepthStencilMatch method (d3d9helper.h) determines whether a depth-stencil format is compatible with a render-target format in a particular display mode.
     * @remarks
     * This method is provided to enable applications to work with hardware requiring that certain depth formats can only work with certain render-target formats.
     * 
     * The behavior of this method has been changed for DirectX 8.1.  This method now pays attention to the D24x8 and D32 depth-stencil formats. The previous version assumed that these formats would always be usable with 32- or 16-bit render targets. This method will now return D3D_OK for these formats only if the device is capable of mixed-depth operations.
     * 
     * The following code fragment shows how you could use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformat">CheckDeviceFormat</a> to validate a depth stencil format.
     * 
     * 
     * ```
     * 
     * BOOL IsDepthFormatOk(D3DFORMAT DepthFormat, 
     *                           D3DFORMAT AdapterFormat, 
     *                           D3DFORMAT BackBufferFormat)
     * {
     *     
     *     // Verify that the depth format exists
     *     HRESULT hr = pD3D->CheckDeviceFormat(D3DADAPTER_DEFAULT,
     *                                          D3DDEVTYPE_HAL,
     *                                          AdapterFormat,
     *                                          D3DUSAGE_DEPTHSTENCIL,
     *                                          D3DRTYPE_SURFACE,
     *                                          DepthFormat);
     *     
     *     if(FAILED(hr)) return FALSE;
     *     
     *     // Verify that the depth format is compatible
     *     hr = pD3D->CheckDepthStencilMatch(D3DADAPTER_DEFAULT,
     *                                       D3DDEVTYPE_HAL,
     *                                       AdapterFormat,
     *                                       BackBufferFormat,
     *                                       DepthFormat);
     *     
     *     return SUCCEEDED(hr);
     *     
     * }
     * 
     * ```
     * 
     * 
     * The preceding call will return <b>FALSE</b> if DepthFormat cannot be used in conjunction with AdapterFormat and BackBufferFormat.
     * @param {Integer} _Adapter 
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type, identifying the device type.
     * @param {Integer} AdapterFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, identifying the format of the display mode into which the adapter will be placed.
     * @param {Integer} RenderTargetFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, identifying the format of the render-target surface to be tested.
     * @param {Integer} DepthStencilFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, identifying the format of the depth-stencil surface to be tested.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the depth-stencil format is compatible with the render-target format in the display mode, this method returns D3D_OK. D3DERR_INVALIDCALL can be returned if one or more of the parameters is invalid. If a depth-stencil format is not compatible with the render target in the display mode, then this method returns D3DERR_NOTAVAILABLE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdepthstencilmatch
     */
    CheckDepthStencilMatch(_Adapter, DeviceType, AdapterFormat, RenderTargetFormat, DepthStencilFormat) {
        result := ComCall(12, this, "uint", _Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", RenderTargetFormat, "uint", DepthStencilFormat, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::CheckDeviceFormatConversion method (d3d9helper.h) tests the device to see if it supports conversion from one display format to another.
     * @remarks
     * Using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdevicetype">CheckDeviceType</a> to test for compatibility between a back buffer that differs from the display format will return appropriate values. This means that the call will reflect device capabilities. If the device cannot render to the requested back buffer format, the call will still return D3DERR_NOTAVAILABLE. If the device can render to the format, but cannot perform the color-converting presentation, the return value will also be D3DERR_NOTAVAILABLE. Applications can discover hardware support for the presentation itself by calling <b>CheckDeviceFormatConversion</b>. No software emulation for the color-converting presentation itself will be offered.
     * 
     * <b>CheckDeviceFormatConversion</b> can also be used to determine which combinations of source surface formats and destination surface formats are permissible in calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">StretchRect</a>.
     *     
     * 
     * 
     * Color conversion is restricted to the following source and target formats.
     * 
     * <ul>
     * <li>The source format must be a FOURCC format or a valid back buffer format. For a list of these, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">FourCC Formats</a> and BackBuffer or Display Formats.</li>
     * <li>The target format must be one of these unsigned formats:
     *     
     *     
     *     
     * <table>
     * <tr>
     * <td>D3DFMT_X1R5G5B5</td>
     * <td>D3DFMT_A1R5G5B5</td>
     * <td>D3DFMT_R5G6B5</td>
     * </tr>
     * <tr>
     * <td>D3DFMT_R8G8B8</td>
     * <td>D3DFMT_X8R8G8B8</td>
     * <td>D3DFMT_A8R8G8B8</td>
     * </tr>
     * <tr>
     * <td>D3DFMT_A2R10G10B10</td>
     * <td>D3DFMT_A16B16G16R16</td>
     * <td>D3DFMT_A2B10G10R10</td>
     * </tr>
     * <tr>
     * <td>D3DFMT_A8B8G8R8</td>
     * <td>D3DFMT_X8B8G8R8</td>
     * <td>D3DFMT_A16B16G16R16F</td>
     * </tr>
     * <tr>
     * <td>D3DFMT_A32B32G32R32F</td>
     * <td></td>
     * <td></td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * </ul>
     * @param {Integer} _Adapter 
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Device type. Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type.
     * @param {Integer} SourceFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Source adapter format. Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type.
     * @param {Integer} TargetFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Target adapter format. Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value is D3DERR_INVALIDCALL.
     *  The method will return D3DERR_NOTAVAILABLE when the hardware does not support conversion between the two formats.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformatconversion
     */
    CheckDeviceFormatConversion(_Adapter, DeviceType, SourceFormat, TargetFormat) {
        result := ComCall(13, this, "uint", _Adapter, "int", DeviceType, "uint", SourceFormat, "uint", TargetFormat, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::GetDeviceCaps method (d3d9.h) retrieves device-specific information about a device.
     * @remarks
     * The application should not assume the persistence of vertex processing capabilities across Direct3D device objects. The particular capabilities that a physical device exposes may depend on parameters supplied to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">CreateDevice</a>. For example, the capabilities may yield different vertex processing capabilities before and after creating a Direct3D Device Object with hardware vertex processing enabled. For more information see the description of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>.
     * @param {Integer} _Adapter 
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type. Denotes the device type.
     * @param {Pointer<D3DCAPS9>} pCaps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure to be filled with information describing the capabilities of the device.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, D3DERR_INVALIDDEVICE, D3DERR_OUTOFVIDEOMEMORY, and D3DERR_NOTAVAILABLE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getdevicecaps
     */
    GetDeviceCaps(_Adapter, DeviceType, pCaps) {
        result := ComCall(14, this, "uint", _Adapter, "int", DeviceType, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * The IDirect3D9::GetAdapterMonitor method (d3d9.h) returns the handle of the monitor associated with the Direct3D object.
     * @remarks
     * As shown in the following code fragment, which illustrates how to obtain a handle to the monitor associated with a given device, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getdirect3d">GetDirect3D</a> to return the Direct3D enumerator from the device and use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getcreationparameters">GetCreationParameters</a> to retrieve the value for Adapter.
     * 
     * 
     * ```
     * 
     *     if( FAILED( pDevice->GetCreationParameters(  &Parameters ) ) )
     *         return D3DERR_INVALIDCALL;
     *     
     *     if( FAILED( pDevice->GetDirect3D(&pD3D) ) )
     *         return D3DERR_INVALIDCALL;
     *     
     *     hMonitor = pD3D->GetAdapterMonitor(Parameters.AdapterOrdinal);
     *     
     *     pD3D->Release();
     * 
     * ```
     * @param {Integer} _Adapter 
     * @returns {HMONITOR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMONITOR</a></b>
     * 
     * Handle of the monitor associated with the Direct3D object.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-getadaptermonitor
     */
    GetAdapterMonitor(_Adapter) {
        result := ComCall(15, this, "uint", _Adapter, "ptr")
        resultHandle := HMONITOR({Value: result}, True)
        return resultHandle
    }

    /**
     * The IDirect3D9::CreateDevice method (d3d9.h) creates a device to represent the display adapter.
     * @remarks
     * This method returns a fully working device interface, set to the required display mode (or windowed), and allocated with the appropriate back buffers. To begin rendering, the application needs only to create and set a depth buffer (assuming EnableAutoDepthStencil is <b>FALSE</b> in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>).
     * 
     * When you create a Direct3D device, you supply two different window parameters: a focus window (hFocusWindow) and a device window (the hDeviceWindow in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>). The purpose of each window is:
     * 
     * <ul>
     * <li>The focus window alerts Direct3D when an application switches from foreground mode to background mode (via Alt-Tab, a mouse click, or some other method). A single focus window is shared by each device created by an application.</li>
     * <li>The device window determines the location and size of the back buffer on screen. This is used by Direct3D when the back buffer contents are copied to the front buffer during <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">Present</a>.</li>
     * </ul>
     * This method should not be run during the handling of WM_CREATE. An application should never pass a window handle to Direct3D while handling WM_CREATE. 
     *     
     *     Any call to create, release, or reset the device must be done using the same thread as the window procedure of the focus window.
     * 
     * Note that D3DCREATE_HARDWARE_VERTEXPROCESSING, D3DCREATE_MIXED_VERTEXPROCESSING, and D3DCREATE_SOFTWARE_VERTEXPROCESSING are mutually exclusive flags, and at least one of these vertex processing flags must be specified when calling this method.
     * 
     * Back buffers created as part of the device are only lockable if D3DPRESENTFLAG_LOCKABLE_BACKBUFFER is specified in the presentation parameters. (Multisampled back buffers and depth surfaces are never lockable.)
     * 
     * The methods <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-reset">Reset</a>, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-testcooperativelevel">TestCooperativeLevel</a> must be called from the same thread that used this method to create a device.
     * 
     * D3DFMT_UNKNOWN can be specified for the windowed mode back buffer format when calling <b>CreateDevice</b>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-reset">Reset</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">CreateAdditionalSwapChain</a>. This means the application does not have to query the current desktop format before calling <b>CreateDevice</b> for windowed mode. For full-screen mode, the back buffer format must be specified.
     * 
     * If you attempt to create a device on a 0x0 sized window, <b>CreateDevice</b> will fail.
     * @param {Integer} _Adapter 
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type that denotes the desired device type. If the desired device type is not available, the method will fail.
     * @param {HWND} hFocusWindow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The focus window alerts Direct3D when an application switches from foreground mode to background mode. See Remarks. 	
     *     
     * 
     * 
     * <ul>
     * <li>For full-screen mode, the window specified must be a top-level window.</li>
     * <li>For windowed mode, this parameter may be <b>NULL</b> only if the hDeviceWindow member of <i>pPresentationParameters</i> is set to a valid, non-<b>NULL</b> value.</li>
     * </ul>
     * @param {Integer} BehaviorFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of one or more options that control device creation. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>.
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structure, describing the presentation parameters for the device to be created. If BehaviorFlags specifies <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE_ADAPTERGROUP_DEVICE</a>, pPresentationParameters is an array. Regardless of the number of heads that exist, only one depth/stencil surface is automatically created.
     * 
     * For Windows 2000 and Windows XP, the full-screen device display refresh rate is set in the following order: 
     * 
     * <ol>
     * <li>User-specified nonzero ForcedRefreshRate registry key, if supported by the device.</li>
     * <li>Application-specified nonzero refresh rate value in the presentation parameter.</li>
     * <li>Refresh rate of the latest desktop, if supported by the device.</li>
     * <li>75 hertz if supported by the device.</li>
     * <li>60 hertz if supported by the device.</li>
     * <li>Device default.</li>
     * </ol>
     * An unsupported refresh rate will default to the closest supported refresh rate below it.  For example, if the application specifies 63 hertz, 60 hertz will be used. There are no supported refresh rates below 57 hertz.
     * 
     * pPresentationParameters is both an input and an output parameter. Calling this method may change several members including:
     * 
     * <ul>
     * <li>If BackBufferCount, BackBufferWidth, and BackBufferHeight  are 0 before the method is called, they will be changed when the method returns.</li>
     * <li>If BackBufferFormat equals <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_UNKNOWN</a> before the method is called, it will be changed when the method returns.</li>
     * </ul>
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Address of a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface, which represents the created device.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9-createdevice
     */
    CreateDevice(_Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters) {
        hFocusWindow := hFocusWindow is Win32Handle ? NumGet(hFocusWindow, "ptr") : hFocusWindow

        result := ComCall(16, this, "uint", _Adapter, "int", DeviceType, "ptr", hFocusWindow, "uint", BehaviorFlags, "ptr", pPresentationParameters, "ptr*", &ppReturnedDeviceInterface := 0, "HRESULT")
        return IDirect3DDevice9(ppReturnedDeviceInterface)
    }
}

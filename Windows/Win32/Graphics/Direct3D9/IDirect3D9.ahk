#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Gdi\HMONITOR.ahk
#Include .\IDirect3DDevice9.ahk
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
     * Registers a pluggable software device. Software devices provide software rasterization enabling applications to access a variety of software rasterizers.
     * @param {Pointer<Void>} pInitializeFunction Type: <b>void*</b>
     * 
     * Pointer to the initialization function for the software device to be registered.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL. The method call is invalid. For example, a method's parameter may have an invalid value: D3DERR_OUTOFVIDEOMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-registersoftwaredevice
     */
    RegisterSoftwareDevice(pInitializeFunction) {
        pInitializeFunctionMarshal := pInitializeFunction is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pInitializeFunctionMarshal, pInitializeFunction, "HRESULT")
        return result
    }

    /**
     * Returns the number of adapters on the system.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A UINT value that denotes the number of adapters on the system at the time this <a href="/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface was instantiated.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-getadaptercount
     */
    GetAdapterCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Describes the physical display adapters present in the system when the IDirect3D9 interface was instantiated.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter. D3DADAPTER_DEFAULT is always the primary display adapter. The minimum value for this parameter is 0, and the maximum value for this parameter is one less than the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-getadaptercount">GetAdapterCount</a>.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if Adapter is out of range, if Flags contains unrecognized parameters, or if pIdentifier is <b>NULL</b> or points to unwriteable memory.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-getadapteridentifier
     */
    GetAdapterIdentifier(Adapter, Flags, pIdentifier) {
        result := ComCall(5, this, "uint", Adapter, "uint", Flags, "ptr", pIdentifier, "HRESULT")
        return result
    }

    /**
     * Returns the number of display modes available on this adapter.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter. D3DADAPTER_DEFAULT is always the primary display adapter.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Identifies the format of the surface type using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-enumadaptermodes">EnumAdapterModes</a> to see the valid formats.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * This method returns the number of display modes on this adapter or zero if Adapter is greater than or equal to the number of adapters on the system.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-getadaptermodecount
     */
    GetAdapterModeCount(Adapter, Format) {
        result := ComCall(6, this, "uint", Adapter, "uint", Format, "uint")
        return result
    }

    /**
     * Queries the device to determine whether the specified adapter supports the requested format and display mode. This method could be used in a loop to enumerate all the available adapter modes.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number denoting the display adapter to enumerate. <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-default">D3DADAPTER_DEFAULT</a> is always the primary display adapter. This method returns D3DERR_INVALIDCALL when this value equals or exceeds the number of display adapters in the system.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Allowable pixel formats. See Remarks.
     * @param {Integer} Mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Represents the display-mode index which is an unsigned integer between zero and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-getadaptermodecount">GetAdapterModeCount</a> minus one.
     * @param {Pointer<D3DDISPLAYMODE>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>*</b>
     * 
     * A pointer to the available display mode of type <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>. See Remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <ul>
     * <li>If the device can be used on this adapter, D3D_OK is returned.</li>
     * <li>If the Adapter equals or exceeds the number of display adapters in the system, D3DERR_INVALIDCALL is returned.</li>
     * <li>If either surface format is not supported or if hardware acceleration is not available for the specified formats, D3DERR_NOTAVAILABLE is returned.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-enumadaptermodes
     */
    EnumAdapterModes(Adapter, Format, Mode, pMode) {
        result := ComCall(7, this, "uint", Adapter, "uint", Format, "uint", Mode, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the current display mode of the adapter.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter to query. D3DADAPTER_DEFAULT is always the primary display adapter.
     * @param {Pointer<D3DDISPLAYMODE>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a> structure, to be filled with information describing the current adapter's mode.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. 
     * 
     * 
     * 
     * If Adapter is out of range or pMode is invalid, this method returns D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-getadapterdisplaymode
     */
    GetAdapterDisplayMode(Adapter, pMode) {
        result := ComCall(8, this, "uint", Adapter, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * Verifies whether a hardware accelerated device type can be used on this adapter.
     * @param {Integer} Adapter 
     * @param {Integer} DevType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type, indicating the device type to check.
     * @param {Integer} AdapterFormat 
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the device can be used on this adapter, D3D_OK is returned.
     * 
     *  D3DERR_INVALIDCALL is returned if Adapter equals or exceeds the number of display adapters in the system. D3DERR_INVALIDCALL is also returned if <b>CheckDeviceType</b> specified a device that does not exist.
     * 
     *  D3DERR_NOTAVAILABLE is returned if the requested back buffer format is not supported, or if hardware acceleration is not available for the specified formats.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-checkdevicetype
     */
    CheckDeviceType(Adapter, DevType, AdapterFormat, BackBufferFormat, bWindowed) {
        result := ComCall(9, this, "uint", Adapter, "int", DevType, "uint", AdapterFormat, "uint", BackBufferFormat, "int", bWindowed, "HRESULT")
        return result
    }

    /**
     * Determines whether a surface format is available as a specified resource type and can be used as a texture, depth-stencil buffer, or render target, or any combination of the three, on a device representing this adapter.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number denoting the display adapter to query. <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-default">D3DADAPTER_DEFAULT</a> is always the primary display adapter. This method returns D3DERR_INVALIDCALL when this value equals or exceeds the number of display adapters in the system.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the format is compatible with the specified device for the requested usage, this method returns D3D_OK.
     * 
     * D3DERR_INVALIDCALL is returned if Adapter equals or exceeds the number of display adapters in the system, or if DeviceType is unsupported.
     * 
     * D3DERR_NOTAVAILABLE is returned if the format is not acceptable to the device for this usage.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-checkdeviceformat
     */
    CheckDeviceFormat(Adapter, DeviceType, AdapterFormat, Usage, RType, CheckFormat) {
        result := ComCall(10, this, "uint", Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", Usage, "int", RType, "uint", CheckFormat, "HRESULT")
        return result
    }

    /**
     * Determines if a multisampling technique is available on this device.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number denoting the display adapter to query. D3DADAPTER_DEFAULT is always the primary display adapter. This method returns <b>FALSE</b> when this value equals or exceeds the number of display adapters in the system. See Remarks.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the device can perform the specified multisampling method, this method returns D3D_OK.
     *  D3DERR_INVALIDCALL is returned if the Adapter or MultiSampleType parameters are invalid. This method returns D3DERR_NOTAVAILABLE if the queried multisampling technique is not supported by this device. D3DERR_INVALIDDEVICE is returned if DeviceType does not apply to this adapter.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-checkdevicemultisampletype
     */
    CheckDeviceMultiSampleType(Adapter, DeviceType, SurfaceFormat, Windowed, MultiSampleType, pQualityLevels) {
        pQualityLevelsMarshal := pQualityLevels is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", Adapter, "int", DeviceType, "uint", SurfaceFormat, "int", Windowed, "int", MultiSampleType, pQualityLevelsMarshal, pQualityLevels, "HRESULT")
        return result
    }

    /**
     * Determines whether a depth-stencil format is compatible with a render-target format in a particular display mode.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number denoting the display adapter to query. D3DADAPTER_DEFAULT is always the primary display adapter.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the depth-stencil format is compatible with the render-target format in the display mode, this method returns D3D_OK. D3DERR_INVALIDCALL can be returned if one or more of the parameters is invalid. If a depth-stencil format is not compatible with the render target in the display mode, then this method returns D3DERR_NOTAVAILABLE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-checkdepthstencilmatch
     */
    CheckDepthStencilMatch(Adapter, DeviceType, AdapterFormat, RenderTargetFormat, DepthStencilFormat) {
        result := ComCall(12, this, "uint", Adapter, "int", DeviceType, "uint", AdapterFormat, "uint", RenderTargetFormat, "uint", DepthStencilFormat, "HRESULT")
        return result
    }

    /**
     * Tests the device to see if it supports conversion from one display format to another.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Display adapter ordinal number. D3DADAPTER_DEFAULT is always the primary display adapter. This method returns D3DERR_INVALIDCALL when this value equals or exceeds the number of display adapters in the system.
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Device type. Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type.
     * @param {Integer} SourceFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Source adapter format. Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type.
     * @param {Integer} TargetFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Target adapter format. Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value is D3DERR_INVALIDCALL.
     *  The method will return D3DERR_NOTAVAILABLE when the hardware does not support conversion between the two formats.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-checkdeviceformatconversion
     */
    CheckDeviceFormatConversion(Adapter, DeviceType, SourceFormat, TargetFormat) {
        result := ComCall(13, this, "uint", Adapter, "int", DeviceType, "uint", SourceFormat, "uint", TargetFormat, "HRESULT")
        return result
    }

    /**
     * Retrieves device-specific information about a device.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter. D3DADAPTER_DEFAULT is always the primary display adapter.
     * @param {Integer} DeviceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type. Denotes the device type.
     * @param {Pointer<D3DCAPS9>} pCaps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure to be filled with information describing the capabilities of the device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, D3DERR_INVALIDDEVICE, D3DERR_OUTOFVIDEOMEMORY, and D3DERR_NOTAVAILABLE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-getdevicecaps
     */
    GetDeviceCaps(Adapter, DeviceType, pCaps) {
        result := ComCall(14, this, "uint", Adapter, "int", DeviceType, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * Returns the handle of the monitor associated with the Direct3D object.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter. D3DADAPTER_DEFAULT is always the primary display adapter.
     * @returns {HMONITOR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HMONITOR</a></b>
     * 
     * Handle of the monitor associated with the Direct3D object.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-getadaptermonitor
     */
    GetAdapterMonitor(Adapter) {
        result := ComCall(15, this, "uint", Adapter, "ptr")
        return HMONITOR({Value: result}, True)
    }

    /**
     * Creates a device to represent the display adapter.
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Ordinal number that denotes the display adapter. <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dadapter-default">D3DADAPTER_DEFAULT</a> is always the primary display adapter.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3d9-createdevice
     */
    CreateDevice(Adapter, DeviceType, hFocusWindow, BehaviorFlags, pPresentationParameters) {
        hFocusWindow := hFocusWindow is Win32Handle ? NumGet(hFocusWindow, "ptr") : hFocusWindow

        result := ComCall(16, this, "uint", Adapter, "int", DeviceType, "ptr", hFocusWindow, "uint", BehaviorFlags, "ptr", pPresentationParameters, "ptr*", &ppReturnedDeviceInterface := 0, "HRESULT")
        return IDirect3DDevice9(ppReturnedDeviceInterface)
    }
}

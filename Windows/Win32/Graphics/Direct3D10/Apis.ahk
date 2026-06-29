#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\D3D10_DEVICE_STATE_TYPES.ahk" { D3D10_DEVICE_STATE_TYPES }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import ".\D3D10_DRIVER_TYPE.ahk" { D3D10_DRIVER_TYPE }
#Import "..\Dxgi\IDXGIAdapter.ahk" { IDXGIAdapter }
#Import ".\D3D10_STATE_BLOCK_MASK.ahk" { D3D10_STATE_BLOCK_MASK }
#Import ".\ID3D10EffectPool.ahk" { ID3D10EffectPool }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ID3D10Device.ahk" { ID3D10Device }
#Import "..\Dxgi\IDXGISwapChain.ahk" { IDXGISwapChain }
#Import ".\ID3D10ShaderReflection.ahk" { ID3D10ShaderReflection }
#Import ".\ID3D10Effect.ahk" { ID3D10Effect }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Direct3D\D3D_SHADER_MACRO.ahk" { D3D_SHADER_MACRO }
#Import "..\Dxgi\DXGI_SWAP_CHAIN_DESC.ahk" { DXGI_SWAP_CHAIN_DESC }
#Import ".\ID3D10Device1.ahk" { ID3D10Device1 }
#Import ".\D3D10_FEATURE_LEVEL1.ahk" { D3D10_FEATURE_LEVEL1 }
#Import "..\Direct3D\ID3DInclude.ahk" { ID3DInclude }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import ".\ID3D10StateBlock.ahk" { ID3D10StateBlock }

/**
 * @namespace Windows.Win32.Graphics.Direct3D10
 */

;@region Functions
/**
 * Create a Direct3D 10.0 device that represents the display adapter.
 * @remarks
 * This example creates a reference device.
 * 
 * 
 * ```
 * 
 * ID3D10Device* g_pd3dDevice = NULL;
 * D3D10CreateDevice( NULL, D3D10_DRIVER_TYPE_REFERENCE, NULL, 0, 
 *     D3D10_SDK_VERSION, &g_pd3dDevice );             
 *       
 * ```
 * 
 * 
 * To create a device and a swap chain at the same time, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdeviceandswapchain">D3D10CreateDeviceAndSwapChain</a>.
 * 
 * The object returned by D3D10CreateDevice implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface and can be queried for other 
 *       interfaces the object supports. To retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>  interface of the object the following code could be used.
 * 
 * 
 * ```
 * 
 * IDXGIDevice * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice), (void **)&pDXGIDevice);
 *       
 * ```
 * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
 * 
 * Pointer to the display adapter (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>) when creating a hardware device; otherwise set this parameter to <b>NULL</b>. 
 *         If <b>NULL</b> is specified when creating a hardware device, Direct3D will use the first adapter enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">EnumAdapters</a>.
 * @param {D3D10_DRIVER_TYPE} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
 * 
 * The device-driver type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>). The driver type determines the type of device you will create.
 * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
 * 
 * Reserved. Set to <b>NULL</b>.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that 
 *         enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Bit flag that indicates the version of the SDK. Should always be D3D10_SDK_VERSION.
 * @returns {ID3D10Device} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>**</b>
 * 
 * Address of a pointer to the device created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10misc/nf-d3d10misc-d3d10createdevice
 */
export D3D10CreateDevice(pAdapter, DriverType, Software, Flags, SDKVersion) {
    result := DllCall("d3d10.dll\D3D10CreateDevice", "ptr", pAdapter, D3D10_DRIVER_TYPE, DriverType, HMODULE, Software, "uint", Flags, "uint", SDKVersion, "ptr*", &ppDevice := 0, "HRESULT")
    return ID3D10Device(ppDevice)
}

/**
 * Create a Direct3D 10.0 device and a swap chain.
 * @remarks
 * To create a device without creating a swap chain, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdevice">D3D10CreateDevice</a>.
 * 
 * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
 * <div> </div>
 * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>.
 * @param {D3D10_DRIVER_TYPE} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
 * 
 * The type of driver for the device. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>.
 * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
 * 
 * A handle to the DLL that implements a software rasterizer. Must be <b>NULL</b> if DriverType is non-software. The HMODULE of a DLL can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Bit flag that indicates the version of the SDK. Should be D3D10_SDK_VERSION, defined in d3d10.h.
 * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pSwapChainDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
 * 
 * Description of the swap chain. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>.
 * @param {Pointer<IDXGISwapChain>} ppSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
 * 
 * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>.
 * @param {Pointer<ID3D10Device>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>**</b>
 * 
 * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> that will receive the newly created device.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10misc/nf-d3d10misc-d3d10createdeviceandswapchain
 */
export D3D10CreateDeviceAndSwapChain(pAdapter, DriverType, Software, Flags, SDKVersion, pSwapChainDesc, ppSwapChain, ppDevice) {
    result := DllCall("d3d10.dll\D3D10CreateDeviceAndSwapChain", "ptr", pAdapter, D3D10_DRIVER_TYPE, DriverType, HMODULE, Software, "uint", Flags, "uint", SDKVersion, DXGI_SWAP_CHAIN_DESC.Ptr, pSwapChainDesc, IDXGISwapChain.Ptr, ppSwapChain, ID3D10Device.Ptr, ppDevice, "HRESULT")
    return result
}

/**
 * Create a buffer.Note  Instead of using this function, we recommend that you use the D3DCreateBlob API.
 * @param {Pointer} NumBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Number of bytes in the blob.
 * @returns {ID3DBlob} Type: <b><a href="https://msdn.microsoft.com/d180fee0-1a69-4250-a0c4-d6e3754f063a">LPD3D10BLOB</a>*</b>
 * 
 * The address of a pointer to the buffer (see <a href="https://msdn.microsoft.com/d180fee0-1a69-4250-a0c4-d6e3754f063a">ID3D10Blob Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10misc/nf-d3d10misc-d3d10createblob
 */
export D3D10CreateBlob(NumBytes) {
    result := DllCall("d3d10.dll\D3D10CreateBlob", "ptr", NumBytes, "ptr*", &ppBuffer := 0, "HRESULT")
    return ID3DBlob(ppBuffer)
}

/**
 * Compile an HLSL shader.
 * @remarks
 * This function uses the version of the HLSL compiler released in the November 2006 DirectX SDK.
 * 
 * This function implements two ways to supply the input shader information. Either use <i>pSrcData</i> and <i>SrcDataLen</i> to specify a string that contains the shader HLSL code (and set <i>pFileName</i> to <b>NULL</b>) or use <i>pFileName</i> to specify the name of a shader or effect file (and set <i>pSrcData</i> to <b>NULL</b>).
 * 
 * To setup a programmable-pipeline stage, compile a shader and then bind the shader to the appropriate pipeline stage. For instance, here is an example compiling a geometry shader (see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-stream-stage-getting-started">Compile a Geometry Shader</a>).
 * 
 * This function, D3D10CompileShader, calls the version of the shader compiler that is shipped each time the operating system releases. A more up-to-date version of the shader compiler ships when the DirectX SDK ships, which can be accessed from D3DX by calling a version of the shader compiler entry-point function such as <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10compilefromfile">D3DX10CompileFromFile</a>.  It is preferable to use the D3DX entry-point functions to ensure the latest version of the shader compiler will be used if you will be redistributing the DirectX redistributable libraries.
 * @param {Integer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * Pointer to a string containing the shader source code.
 * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Size of pSrcData, in bytes.
 * @param {PSTR} pFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * The name of the file that contains the shader code.
 * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>*</b>
 * 
 * Optional. Pointer to an array of macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>). 
 *           The last structure in the array serves as a terminator and must have all members set to 0.  
 *           If not used, set <i>pDefines</i> to <b>NULL</b>.
 * @param {ID3DInclude} pInclude Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">LPD3D10INCLUDE</a>*</b>
 * 
 * Optional. Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include Interface</a> interface for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include.
 * @param {PSTR} pFunctionName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * Name of the shader-entry point function where shader execution begins.
 * @param {PSTR} pProfile Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * A string that specifies the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-models">shader profile</a> or shader model.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Shader <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-shader">compile options</a>.
 * @param {Pointer<ID3DBlob>} ppShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains the compiled shader, as well as any embedded debug and symbol-table information.
 * @param {Pointer<ID3DBlob>} ppErrorMsgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains a listing of errors and warnings that occurred during compilation. These errors and warnings are identical to the debug output from a debugger.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10compileshader
 */
export D3D10CompileShader(pSrcData, SrcDataSize, pFileName, pDefines, pInclude, pFunctionName, pProfile, Flags, ppShader, ppErrorMsgs) {
    pFileName := pFileName is String ? StrPtr(pFileName) : pFileName
    pFunctionName := pFunctionName is String ? StrPtr(pFunctionName) : pFunctionName
    pProfile := pProfile is String ? StrPtr(pProfile) : pProfile

    result := DllCall("d3d10.dll\D3D10CompileShader", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pFileName, D3D_SHADER_MACRO.Ptr, pDefines, "ptr", pInclude, "ptr", pFunctionName, "ptr", pProfile, "uint", Flags, ID3DBlob.Ptr, ppShader, ID3DBlob.Ptr, ppErrorMsgs, "HRESULT")
    return result
}

/**
 * This function -- which disassembles a compiled shader into a text string that contains assembly instructions and register assignments -- has been deprecated. Instead, use D3DDisassemble.
 * @param {Integer} pShader Type: <b>const void*</b>
 * 
 * A pointer to the compiled shader.
 * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * The size of pShader.
 * @param {BOOL} EnableColorCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Include HTML tags in the output to color code the result.
 * @param {PSTR} pComments Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * The comment string at the top of the shader that identifies the shader constants and variables.
 * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * Address of a buffer which contains the disassembled shader.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10disassembleshader
 */
export D3D10DisassembleShader(pShader, BytecodeLength, EnableColorCode, pComments) {
    pComments := pComments is String ? StrPtr(pComments) : pComments

    result := DllCall("d3d10.dll\D3D10DisassembleShader", "ptr", pShader, "ptr", BytecodeLength, BOOL, EnableColorCode, "ptr", pComments, "ptr*", &ppDisassembly := 0, "HRESULT")
    return ID3DBlob(ppDisassembly)
}

/**
 * Get the pixel shader profile best suited to a given device.
 * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
 * 
 * Pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
 * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * The shader profile.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10getpixelshaderprofile
 */
export D3D10GetPixelShaderProfile(pDevice) {
    result := DllCall("d3d10.dll\D3D10GetPixelShaderProfile", "ptr", pDevice, PSTR)
    return result
}

/**
 * Get the vertex shader profile best suited to a given device.
 * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
 * 
 * Pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
 * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * The shader profile.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10getvertexshaderprofile
 */
export D3D10GetVertexShaderProfile(pDevice) {
    result := DllCall("d3d10.dll\D3D10GetVertexShaderProfile", "ptr", pDevice, PSTR)
    return result
}

/**
 * Get the geometry shader profile best suited to a given device.
 * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
 * 
 * Pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
 * @returns {PSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * The shader profile.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10getgeometryshaderprofile
 */
export D3D10GetGeometryShaderProfile(pDevice) {
    result := DllCall("d3d10.dll\D3D10GetGeometryShaderProfile", "ptr", pDevice, PSTR)
    return result
}

/**
 * This function -- which creates a shader-reflection object for retrieving information about a compiled shader -- has been deprecated. Instead, use D3DReflect.
 * @param {Integer} pShaderBytecode Type: <b>const void*</b>
 * 
 * A pointer to the compiled shader.
 * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Length of pShaderBytecode.
 * @returns {ID3D10ShaderReflection} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflection">ID3D10ShaderReflection</a>**</b>
 * 
 * Address of a reflection interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10reflectshader
 */
export D3D10ReflectShader(pShaderBytecode, BytecodeLength) {
    result := DllCall("d3d10.dll\D3D10ReflectShader", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppReflector := 0, "HRESULT")
    return ID3D10ShaderReflection(ppReflector)
}

/**
 * Generate a shader-text string that contains the shader tokens that would be found in a compiled shader.
 * @remarks
 * Use this function to generate a shader-token stream, which is the compiled output of the shader compiler.
 * @param {Integer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * Pointer to a string containing the shader source code.
 * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Size of pSrcData, in bytes.
 * @param {PSTR} pFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * The name of the file that contains the shader code.
 * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>*</b>
 * 
 * Optional. Pointer to an array of macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>). 
 *           The last structure in the array serves as a terminator and must have all members set to 0.  
 *           If not used, set <i>pDefines</i> to <b>NULL</b>.
 * @param {ID3DInclude} pInclude Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">LPD3D10INCLUDE</a></b>
 * 
 * Optional. Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include Interface</a> interface for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include.
 * @param {Pointer<ID3DBlob>} ppShaderText Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * A pointer to a buffer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains a single string containing shader-tokens.
 * @param {Pointer<ID3DBlob>} ppErrorMsgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * A pointer to a buffer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains a listing of errors and warnings that occurred during compilation. These errors and warnings are identical to the debug output from a debugger.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10preprocessshader
 */
export D3D10PreprocessShader(pSrcData, SrcDataSize, pFileName, pDefines, pInclude, ppShaderText, ppErrorMsgs) {
    pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

    result := DllCall("d3d10.dll\D3D10PreprocessShader", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pFileName, D3D_SHADER_MACRO.Ptr, pDefines, "ptr", pInclude, ID3DBlob.Ptr, ppShaderText, ID3DBlob.Ptr, ppErrorMsgs, "HRESULT")
    return result
}

/**
 * Get a buffer that contains shader-input signatures.
 * @param {Integer} pShaderBytecode Type: <b>const void*</b>
 * 
 * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
 * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * The size of the shader bytecode in bytes.
 * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * The address of a pointer to the buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10getinputsignatureblob
 */
export D3D10GetInputSignatureBlob(pShaderBytecode, BytecodeLength) {
    result := DllCall("d3d10.dll\D3D10GetInputSignatureBlob", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppSignatureBlob := 0, "HRESULT")
    return ID3DBlob(ppSignatureBlob)
}

/**
 * Get a buffer that contains shader-output signatures.
 * @param {Integer} pShaderBytecode Type: <b>const void*</b>
 * 
 * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
 * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * The size of the shader bytecode in bytes.
 * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * The address of a pointer to the buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10getoutputsignatureblob
 */
export D3D10GetOutputSignatureBlob(pShaderBytecode, BytecodeLength) {
    result := DllCall("d3d10.dll\D3D10GetOutputSignatureBlob", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppSignatureBlob := 0, "HRESULT")
    return ID3DBlob(ppSignatureBlob)
}

/**
 * Get a buffer that contains shader signatures.
 * @param {Integer} pShaderBytecode Type: <b>const void*</b>
 * 
 * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
 * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * The size of the shader bytecode in bytes.
 * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * The address of a pointer to the buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10getinputandoutputsignatureblob
 */
export D3D10GetInputAndOutputSignatureBlob(pShaderBytecode, BytecodeLength) {
    result := DllCall("d3d10.dll\D3D10GetInputAndOutputSignatureBlob", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppSignatureBlob := 0, "HRESULT")
    return ID3DBlob(ppSignatureBlob)
}

/**
 * Get shader debug info. Debug info is generated by D3D10CompileShader and is embedded in the body of the shader.
 * @param {Integer} pShaderBytecode Type: <b>const void*</b>
 * 
 * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
 * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Length of the shader bytecode buffer.
 * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">ID3D10Blob Interface</a> used to return debug info.  For information about the layout of this buffer, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10shader/nf-d3d10shader-d3d10getshaderdebuginfo
 */
export D3D10GetShaderDebugInfo(pShaderBytecode, BytecodeLength) {
    result := DllCall("d3d10.dll\D3D10GetShaderDebugInfo", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", &ppDebugInfo := 0, "HRESULT")
    return ID3DBlob(ppDebugInfo)
}

/**
 * Combine two state-block masks with a bitwise OR.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pA Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * State block mask on the left side of the bitwise OR operation. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * State block mask on the right side of the bitwise OR operation.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * The result of the bitwise OR operation.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskunion
 */
export D3D10StateBlockMaskUnion(pA, pB, pResult) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskUnion", D3D10_STATE_BLOCK_MASK.Ptr, pA, D3D10_STATE_BLOCK_MASK.Ptr, pB, D3D10_STATE_BLOCK_MASK.Ptr, pResult, "HRESULT")
    return result
}

/**
 * Combine two state-block masks with a bitwise AND.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pA Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * State block mask on the left side of the bitwise AND operation. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * State block mask on the right side of the bitwise AND operation.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * The result of the bitwise AND operation.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskintersect
 */
export D3D10StateBlockMaskIntersect(pA, pB, pResult) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskIntersect", D3D10_STATE_BLOCK_MASK.Ptr, pA, D3D10_STATE_BLOCK_MASK.Ptr, pB, D3D10_STATE_BLOCK_MASK.Ptr, pResult, "HRESULT")
    return result
}

/**
 * Combine two state-block masks with a bitwise XOR.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pA Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * State block mask on the left side of the bitwise XOR operation. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * State block mask on the right side of the bitwise XOR operation.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * The result of the bitwise XOR operation.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskdifference
 */
export D3D10StateBlockMaskDifference(pA, pB, pResult) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskDifference", D3D10_STATE_BLOCK_MASK.Ptr, pA, D3D10_STATE_BLOCK_MASK.Ptr, pB, D3D10_STATE_BLOCK_MASK.Ptr, pResult, "HRESULT")
    return result
}

/**
 * Enable a range of state values in a state block mask.
 * @remarks
 * This is an example of how to call this function. It create a mask that can capture and apply to geometry-shader samplers in slots 2 ~ 13.
 * 
 * 
 * ```
 * 
 * D3D10_STATE_BLOCK_MASK stateBlockMask;
 * D3D10StateBlockMaskEnableCapture(&stateBlockMask, 
 *                                  D3D10_DST_GS_SAMPLERS, 
 *                                  2, 13);
 * 
 * ```
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * A state block mask (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
 * @param {D3D10_DEVICE_STATE_TYPES} StateType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a></b>
 * 
 * The type of device state to enable (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a>.
 * @param {Integer} RangeStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The lower end of the range of values to set to true.
 * @param {Integer} RangeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The upper end of the range of values to set to true.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskenablecapture
 */
export D3D10StateBlockMaskEnableCapture(pMask, StateType, RangeStart, RangeLength) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskEnableCapture", D3D10_STATE_BLOCK_MASK.Ptr, pMask, D3D10_DEVICE_STATE_TYPES, StateType, "uint", RangeStart, "uint", RangeLength, "HRESULT")
    return result
}

/**
 * Disable state capturing with a state-block mask.
 * @remarks
 * This is an example of how to call this function. It creates a mask that cannot capture and apply to geometry-shader samplers in slots 2 ~ 23.
 * 
 * 
 * ```
 * 
 * D3D10_STATE_BLOCK_MASK stateBlockMask;
 * D3D10StateBlockMaskDisableCapture(&stateBlockMask, 
 *                                  D3D10_DST_GS_SAMPLERS, 
 *                                  2, 23);
 * 
 * ```
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * A state block mask (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
 * @param {D3D10_DEVICE_STATE_TYPES} StateType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a></b>
 * 
 * The type of device state to disable (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a>).
 * @param {Integer} RangeStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The lower end of the range of values to set to false.
 * @param {Integer} RangeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The upper end of the range of values to set to false.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskdisablecapture
 */
export D3D10StateBlockMaskDisableCapture(pMask, StateType, RangeStart, RangeLength) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskDisableCapture", D3D10_STATE_BLOCK_MASK.Ptr, pMask, D3D10_DEVICE_STATE_TYPES, StateType, "uint", RangeStart, "uint", RangeLength, "HRESULT")
    return result
}

/**
 * Enable a state-block mask to capture and apply all state variables.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * A mask with everything turned on.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskenableall
 */
export D3D10StateBlockMaskEnableAll(pMask) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskEnableAll", D3D10_STATE_BLOCK_MASK.Ptr, pMask, "HRESULT")
    return result
}

/**
 * Disable all state capturing with a state-block mask.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * A mask filled with all zeroes (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskdisableall
 */
export D3D10StateBlockMaskDisableAll(pMask) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskDisableAll", D3D10_STATE_BLOCK_MASK.Ptr, pMask, "HRESULT")
    return result
}

/**
 * Get an element in a state-block mask; determine if an element is allowed by the mask for capturing and applying.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * State block mask. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
 * @param {D3D10_DEVICE_STATE_TYPES} StateType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a></b>
 * 
 * The type of device state. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a>.
 * @param {Integer} Entry Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The entry within the device state. This is only relevant for state types that have more than one entry, such as D3D10_DST_GS_SAMPLERS.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns true if the specified feature is allowed by the mask for capturing and applying, and false otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskgetsetting
 */
export D3D10StateBlockMaskGetSetting(pMask, StateType, Entry) {
    result := DllCall("d3d10.dll\D3D10StateBlockMaskGetSetting", D3D10_STATE_BLOCK_MASK.Ptr, pMask, D3D10_DEVICE_STATE_TYPES, StateType, "uint", Entry, BOOL)
    return result
}

/**
 * Create a state block.
 * @remarks
 * A state block is a collection of device state, and is used for saving and restoring device state. Use a state-block mask to enable subsets of state for saving and restoring.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a> structure can be filled manually or by using any of the D3D10StateBlockMaskXXX APIs. A state block mask can also be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effecttechnique-computestateblockmask">ID3D10EffectTechnique::ComputeStateBlockMask</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10effectpass-computestateblockmask">ID3D10EffectPass::ComputeStateBlockMask</a>.
 * 
 * <table>
 * <tr>
 * <td>
 * Differences between Direct3D 9 and Direct3D 10:
 * 
 * In Direct3D 10, a state block object does not contain any valid information about the state of the device until <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10stateblock-capture">ID3D10StateBlock::Capture</a> is called. In Direct3D 9, state is saved in a state block object, when it is created.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
 * 
 * The device for which the state block will be created.
 * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pStateBlockMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
 * 
 * Indicates which parts of the device state will be captured when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10stateblock-capture">ID3D10StateBlock::Capture</a> and reapplied when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10stateblock-apply">ID3D10StateBlock::Apply</a>. See remarks.
 * @returns {ID3D10StateBlock} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10stateblock">ID3D10StateBlock</a>**</b>
 * 
 * Address of a pointer to the buffer created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10stateblock">ID3D10StateBlock Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10createstateblock
 */
export D3D10CreateStateBlock(pDevice, pStateBlockMask) {
    result := DllCall("d3d10.dll\D3D10CreateStateBlock", "ptr", pDevice, D3D10_STATE_BLOCK_MASK.Ptr, pStateBlockMask, "ptr*", &ppStateBlock := 0, "HRESULT")
    return ID3D10StateBlock(ppStateBlock)
}

/**
 * Compile an effect.
 * @remarks
 * This function uses the version of the HLSL compiler released in the November 2006 DirectX SDK.
 * 
 * For an example, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-compile">Compile an Effect (Direct3D 10)</a>.
 * @param {Integer} pData Type: <b>void*</b>
 * 
 * A pointer to effect data; either ASCII <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-reference">HLSL</a> code or a compiled effect.
 * @param {Pointer} DataLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Length of <i>pData</i>.
 * @param {PSTR} pSrcFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
 * 
 * The name of the effect file.
 * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>*</b>
 * 
 * Optional. An array of NULL-terminated macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>).
 * @param {ID3DInclude} pInclude Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include</a>*</b>
 * 
 * Optional. A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include Interface</a> for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include.
 * @param {Integer} HLSLFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Shader <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-shader">compile options</a>.
 * @param {Integer} FXFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Effect <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-effect-constants">compile options</a>.
 * @param {Pointer<ID3DBlob>} ppCompiledEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains the compiled effect.
 * @param {Pointer<ID3DBlob>} ppErrors Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * Optional. A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains compiler error messages, or <b>NULL</b> if there were no errors.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10compileeffectfrommemory
 */
export D3D10CompileEffectFromMemory(pData, DataLength, pSrcFileName, pDefines, pInclude, HLSLFlags, FXFlags, ppCompiledEffect, ppErrors) {
    pSrcFileName := pSrcFileName is String ? StrPtr(pSrcFileName) : pSrcFileName

    result := DllCall("d3d10.dll\D3D10CompileEffectFromMemory", "ptr", pData, "ptr", DataLength, "ptr", pSrcFileName, D3D_SHADER_MACRO.Ptr, pDefines, "ptr", pInclude, "uint", HLSLFlags, "uint", FXFlags, ID3DBlob.Ptr, ppCompiledEffect, ID3DBlob.Ptr, ppErrors, "HRESULT")
    return result
}

/**
 * Creates an ID3D10Effect from a buffer containing a compiled effect.
 * @remarks
 * This method is used to create an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect Interface</a> object from an effect that has been compiled before runtime and loaded into memory.  
 *       For help precompiling an effect, see <a href="https://docs.microsoft.com/windows/desktop/direct3dtools/dx-graphics-tools-fxc-using">Offline Compiling</a>.  
 *       To load and compile an ASCII .fx file see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-compile">Compile an Effect (Direct3D 10)</a>.
 * @param {Integer} pData Type: <b>void*</b>
 * 
 * A pointer to a compiled effect.
 * @param {Pointer} DataLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Length of <i>pData</i>.
 * @param {Integer} FXFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Effect <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-effect-constants">compile options</a>.
 * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
 * 
 * A pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
 * @param {ID3D10EffectPool} pEffectPool Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool</a>*</b>
 * 
 * Optional. A pointer to a memory space for effect variables that are shared across effects (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool Interface</a>).
 * @returns {ID3D10Effect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect</a>**</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect Interface</a> which contains the created effect.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10createeffectfrommemory
 */
export D3D10CreateEffectFromMemory(pData, DataLength, FXFlags, pDevice, pEffectPool) {
    result := DllCall("d3d10.dll\D3D10CreateEffectFromMemory", "ptr", pData, "ptr", DataLength, "uint", FXFlags, "ptr", pDevice, "ptr", pEffectPool, "ptr*", &ppEffect := 0, "HRESULT")
    return ID3D10Effect(ppEffect)
}

/**
 * Create an effect pool (or shared memory location), to enable sharing variables between effects.
 * @remarks
 * A pool is a shared location in memory. Effect variables that are located in a pool can be updated once, and the effect system will take care of updating each effect that uses that variable. To pool an effect variable, tell the effect to locate the variable in a pool when the effect is created, using a helper function such as <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10createeffectfromfile">D3DX10CreateEffectFromFile</a>.
 * 
 * For help compiling an effect, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-compile">Compile an Effect (Direct3D 10)</a>.
 * @param {Integer} pData Type: <b>void*</b>
 * 
 * A pointer to a compiled effect.
 * @param {Pointer} DataLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * Length of <i>pData</i>.
 * @param {Integer} FXFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Effect <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-effect-constants">compile options</a>.
 * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
 * 
 * A pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
 * @returns {ID3D10EffectPool} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool</a>**</b>
 * 
 * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool Interface</a> that contains the effect pool.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10createeffectpoolfrommemory
 */
export D3D10CreateEffectPoolFromMemory(pData, DataLength, FXFlags, pDevice) {
    result := DllCall("d3d10.dll\D3D10CreateEffectPoolFromMemory", "ptr", pData, "ptr", DataLength, "uint", FXFlags, "ptr", pDevice, "ptr*", &ppEffectPool := 0, "HRESULT")
    return ID3D10EffectPool(ppEffectPool)
}

/**
 * This function -- which disassembles a compiled effect into a text string that contains assembly instructions and register assignments -- has been deprecated. Instead, use D3DDisassemble10Effect.
 * @remarks
 * This returned text includes a header with the version of the HLSL compiler used to generate this object, comments describing the memory layout of the constant buffers used by the shader, input and output signatures, and resource binding points.
 * 
 * Here is an example of disassembling a compiled effect. The example assumes you start with a compiled effect (shown as <i>l_pBlob_Effect</i> which you can see in <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-compile">Compile an Effect (Direct3D 10)</a>).
 * 
 * 
 * ```
 * 
 * LPCSTR commentString = NULL;
 * ID3D10Blob* pIDisassembly = NULL;
 * char* pDisassembly = NULL;
 * if( pVSBuf )
 * {
 *     D3D10DisassembleEffect( (UINT*) l_pBlob_Effect->GetBufferPointer(),
 *         l_pBlob_Effect->GetBufferSize(), TRUE, commentString, &pIDisassembly );
 *     if( pIDisassembly )
 *     {
 *         FILE* pFile = fopen( "effect.htm", "w" );
 *         if( pFile)
 *         {
 *             fputs( (char*)pIDisassembly->GetBufferPointer(), pFile );
 *             fclose( pFile );
 *         }
 *     }
 * }
 * 
 * ```
 * @param {ID3D10Effect} pEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect</a>*</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect Interface</a>, which contains the compiled effect.
 * @param {BOOL} EnableColorCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Include HTML tags in the output to color code the result.
 * @returns {ID3DBlob} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> which contains the disassembled shader.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-d3d10disassembleeffect
 */
export D3D10DisassembleEffect(pEffect, EnableColorCode) {
    result := DllCall("d3d10.dll\D3D10DisassembleEffect", "ptr", pEffect, BOOL, EnableColorCode, "ptr*", &ppDisassembly := 0, "HRESULT")
    return ID3DBlob(ppDisassembly)
}

/**
 * Create a Direct3D 10.1 device that represents the display adapter.
 * @remarks
 * To create a device and a swap chain at the same time, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nf-d3d10_1-d3d10createdeviceandswapchain1">D3D10CreateDeviceAndSwapChain1</a>.
 * 
 * This method requires Windows Vista Service Pack 1, Windows Server 2008, or later release of Windows.
 * 
 * The object returned by D3D10CreateDevice1 implements the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface 
 *       and can be queried for other 
 *       interfaces the object supports. To retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>  interface of the object the following code could be used.
 * 
 * 
 * ```
 * 
 * IDXGIDevice * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice), (void **)&pDXGIDevice);
 *       
 * ```
 * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
 * 
 * Pointer to the display adapter (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>) when creating a hardware device; otherwise set this parameter to 
 *         <b>NULL</b>. If <b>NULL</b> is specified when creating a hardware device, Direct3D will use the first adapter enumerated 
 *         by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">EnumAdapters</a>.
 * @param {D3D10_DRIVER_TYPE} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
 * 
 * The device-driver type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>). The driver type determines the type of device you will create.
 * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
 * 
 * This is set to <b>NULL</b> except for D3D10_DRIVER_TYPE_SOFTWARE driver types.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that 
 *         enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
 * @param {D3D10_FEATURE_LEVEL1} HardwareLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a></b>
 * 
 * The version of hardware that is available for acceleration (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a>).
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Bit flag that indicates the version of the SDK. Should be D3D10_1_SDK_VERSION, defined in D3D10.h.
 * @returns {ID3D10Device1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>**</b>
 * 
 * Address of a pointer to the device created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1 Interface</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nf-d3d10_1-d3d10createdevice1
 */
export D3D10CreateDevice1(pAdapter, DriverType, Software, Flags, HardwareLevel, SDKVersion) {
    result := DllCall("d3d10_1.dll\D3D10CreateDevice1", "ptr", pAdapter, D3D10_DRIVER_TYPE, DriverType, HMODULE, Software, "uint", Flags, D3D10_FEATURE_LEVEL1, HardwareLevel, "uint", SDKVersion, "ptr*", &ppDevice := 0, "HRESULT")
    return ID3D10Device1(ppDevice)
}

/**
 * Create a Direct3D 10.1 device and a swap chain.
 * @remarks
 * To create a device without creating a swap chain, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nf-d3d10_1-d3d10createdevice1">D3D10CreateDevice1</a>.
 * 
 * This method requires Windows Vista Service Pack 1, Windows Server 2008, or later release of Windows.
 * 
 * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
 * <div> </div>
 * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>.
 * @param {D3D10_DRIVER_TYPE} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
 * 
 * The type of driver for the device. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>.
 * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
 * 
 * A handle to the DLL that implements a software rasterizer. Must be <b>NULL</b> if DriverType is non-software. 
 *         The HMODULE of a DLL can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, 
 *           <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, 
 *           or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>.
 * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that 
 *         enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
 * @param {D3D10_FEATURE_LEVEL1} HardwareLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a></b>
 * 
 * The version of hardware that is available for acceleration (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a>).
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Bit flag that indicates the version of the SDK. Should be D3D10_1_SDK_VERSION, defined in D3D10.h.
 * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pSwapChainDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
 * 
 * Description of the swap chain. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>.
 * @param {Pointer<IDXGISwapChain>} ppSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
 * 
 * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>.
 * @param {Pointer<ID3D10Device1>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>**</b>
 * 
 * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1 Interface</a> that will receive the newly created device.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10_1/nf-d3d10_1-d3d10createdeviceandswapchain1
 */
export D3D10CreateDeviceAndSwapChain1(pAdapter, DriverType, Software, Flags, HardwareLevel, SDKVersion, pSwapChainDesc, ppSwapChain, ppDevice) {
    result := DllCall("d3d10_1.dll\D3D10CreateDeviceAndSwapChain1", "ptr", pAdapter, D3D10_DRIVER_TYPE, DriverType, HMODULE, Software, "uint", Flags, D3D10_FEATURE_LEVEL1, HardwareLevel, "uint", SDKVersion, DXGI_SWAP_CHAIN_DESC.Ptr, pSwapChainDesc, IDXGISwapChain.Ptr, ppSwapChain, ID3D10Device1.Ptr, ppDevice, "HRESULT")
    return result
}

;@endregion Functions

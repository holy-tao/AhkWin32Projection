#Requires AutoHotkey v2.0.0 64-bit

/**
 * Strip flag options.
 * @remarks
 * 
 * These flags are used by <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dstripshader">D3DStripShader</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/ne-d3dcompiler-d3dcompiler_strip_flags
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 * @version v4.0.30319
 */
class D3DCOMPILER_STRIP_FLAGS{

    /**
     * Remove reflection data.
     * @type {Integer (Int32)}
     */
    static D3DCOMPILER_STRIP_REFLECTION_DATA => 1

    /**
     * Remove debug information.
     * @type {Integer (Int32)}
     */
    static D3DCOMPILER_STRIP_DEBUG_INFO => 2

    /**
     * Remove test blob data.
     * @type {Integer (Int32)}
     */
    static D3DCOMPILER_STRIP_TEST_BLOBS => 4

    /**
     * <div class="alert"><b>Note</b>  This value is supported by the D3dcompiler_44.dll or later version of the file.</div>
     * <div> </div>
     * Remove private data.
     * @type {Integer (Int32)}
     */
    static D3DCOMPILER_STRIP_PRIVATE_DATA => 8

    /**
     * <div class="alert"><b>Note</b>  This value is supported by the D3dcompiler_47.dll or later version of the file.</div>
     * <div> </div>
     * Remove the root signature. Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/specifying-root-signatures-in-hlsl">Specifying Root Signatures in HLSL</a> for more information on using Direct3D12 with HLSL.
     * @type {Integer (Int32)}
     */
    static D3DCOMPILER_STRIP_ROOT_SIGNATURE => 16
}

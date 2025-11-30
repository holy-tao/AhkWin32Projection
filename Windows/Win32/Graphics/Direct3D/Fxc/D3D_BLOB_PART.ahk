#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Values that identify parts of the content of an arbitrary length data buffer.
 * @remarks
 * 
 * These values are passed to the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dgetblobpart">D3DGetBlobPart</a> or  <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dsetblobpart">D3DSetBlobPart</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/ne-d3dcompiler-d3d_blob_part
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 * @version v4.0.30319
 */
class D3D_BLOB_PART extends Win32Enum{

    /**
     * The blob part is an input signature.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_INPUT_SIGNATURE_BLOB => 0

    /**
     * The blob part is an output signature.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_OUTPUT_SIGNATURE_BLOB => 1

    /**
     * The blob part is an input and output signature.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB => 2

    /**
     * The blob part is a patch constant signature.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB => 3

    /**
     * The blob part is all signature.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_ALL_SIGNATURE_BLOB => 4

    /**
     * The blob part is debug information.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_DEBUG_INFO => 5

    /**
     * The blob part is a legacy shader.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_LEGACY_SHADER => 6

    /**
     * The blob part is an XNA prepass shader.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_XNA_PREPASS_SHADER => 7

    /**
     * The blob part is an XNA shader.
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_XNA_SHADER => 8

    /**
     * The blob part is program database (PDB) information.
     * 
     * <div class="alert"><b>Note</b>  This value is supported by the D3dcompiler_44.dll or later version of the file.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_PDB => 9

    /**
     * The blob part is private data.
     * 
     * <div class="alert"><b>Note</b>  This value is supported by the D3dcompiler_44.dll or later version of the file.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_PRIVATE_DATA => 10

    /**
     * The blob part is a root signature. Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/specifying-root-signatures-in-hlsl">Specifying Root Signatures in HLSL</a> for more information on using Direct3D12 with HLSL.
     * 
     * <div class="alert"><b>Note</b>  This value is supported by the D3dcompiler_47.dll or later version of the file.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_ROOT_SIGNATURE => 11

    /**
     * The blob part is the debug name of the shader. If the application does not specify the debug name itself, an auto-generated name matching the PDB file of the shader is provided instead.
     * 
     * <div class="alert"><b>Note</b>  This value is supported by the D3dcompiler_47.dll as available on the Windows 10 Fall Creators Update and its SDK, or later version of the file.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_DEBUG_NAME => 12

    /**
     * The blob part is a test alternate shader.
     * 
     * <div class="alert"><b>Note</b>  This value identifies a test part and is only produced by special compiler versions. Therefore, this part type is typically not present in shaders.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_TEST_ALTERNATE_SHADER => 32768

    /**
     * The blob part is test compilation details.
     * 
     * <div class="alert"><b>Note</b>  This value identifies a test part and is only produced by special compiler versions. Therefore, this part type is typically not present in shaders.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_TEST_COMPILE_DETAILS => 32769

    /**
     * The blob part is test compilation performance.
     * 
     * <div class="alert"><b>Note</b>  This value identifies a test part and is only produced by special compiler versions. Therefore, this part type is typically not present in shaders.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_TEST_COMPILE_PERF => 32770

    /**
     * The blob part is a test compilation report.
     * 
     * <div class="alert"><b>Note</b>  This value identifies a test part and is only produced by special compiler versions. Therefore, this part type is typically not present in shaders.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  This value is supported by the D3dcompiler_44.dll or later version of the file.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_BLOB_TEST_COMPILE_REPORT => 32771
}

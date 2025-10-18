#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 * @version v4.0.30319
 */
class Fxc {

;@region Constants

    /**
     * @type {String}
     */
    static D3DCOMPILER_DLL_W => "d3dcompiler_47.dll"

    /**
     * @type {String}
     */
    static D3DCOMPILER_DLL_A => "d3dcompiler_47.dll"

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_COMPILER_VERSION => 47

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_SKIP_VALIDATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_SKIP_OPTIMIZATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_PACK_MATRIX_ROW_MAJOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_PARTIAL_PRECISION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_NO_PRESHADER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_AVOID_FLOW_CONTROL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_PREFER_FLOW_CONTROL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_ENABLE_STRICTNESS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_IEEE_STRICTNESS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_OPTIMIZATION_LEVEL0 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_OPTIMIZATION_LEVEL1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_OPTIMIZATION_LEVEL3 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_RESERVED16 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_RESERVED17 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_WARNINGS_ARE_ERRORS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_RESOURCES_MAY_ALIAS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_ALL_RESOURCES_BOUND => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_DEBUG_NAME_FOR_SOURCE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_DEBUG_NAME_FOR_BINARY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_EFFECT_CHILD_EFFECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_ENABLE_COLOR_CODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_ENABLE_INSTRUCTION_CYCLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_DISABLE_DEBUG_INFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_ENABLE_INSTRUCTION_OFFSET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_INSTRUCTION_ONLY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_DISASM_PRINT_HEX_LITERALS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_COMPRESS_SHADER_KEEP_ALL_PARTS => 1
;@endregion Constants

;@region Methods
    /**
     * Reads a file that is on disk into memory.
     * @param {PWSTR} pFileName A pointer to a constant null-terminated string that contains  the name of the file to read into memory.
     * @param {Pointer<ID3DBlob>} ppContents A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that contains information that <b>D3DReadFileToBlob</b> read from the <i>pFileName</i> file. You can use this <b>ID3DBlob</b> interface to access the file information and pass it to other compiler functions.
     * @returns {HRESULT} Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dreadfiletoblob
     */
    static D3DReadFileToBlob(pFileName, ppContents) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        result := DllCall("D3DCOMPILER_47.dll\D3DReadFileToBlob", "ptr", pFileName, "ptr", ppContents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a memory blob to a file on disk.
     * @param {Pointer<ID3DBlob>} pBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that contains the memory blob to write to the file that the <i>pFileName</i> parameter specifies.
     * @param {PWSTR} pFileName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a constant null-terminated string that contains  the name of the file to which to write.
     * @param {BOOL} bOverwrite Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that specifies whether to overwrite information in the <i>pFileName</i> file. TRUE specifies to overwrite information and FALSE specifies not to overwrite information.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dwriteblobtofile
     */
    static D3DWriteBlobToFile(pBlob, pFileName, bOverwrite) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        result := DllCall("D3DCOMPILER_47.dll\D3DWriteBlobToFile", "ptr", pBlob, "ptr", pFileName, "int", bOverwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compile HLSL code or an effect file into bytecode for a given target.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to uncompiled shader data; either ASCII HLSL code or a compiled effect.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {PSTR} pSourceName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     *  You can use this parameter for strings that specify  error messages. If not used, set to <b>NULL</b>.
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D_SHADER_MACRO</a>*</b>
     * 
     *  An array of NULL-terminated macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D_SHADER_MACRO</a>).
     * @param {Pointer<ID3DInclude>} pInclude Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a>*</b>
     * 
     * Optional. A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a> for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include. You can pass the <b>D3D_COMPILE_STANDARD_FILE_INCLUDE</b> macro, which is a pointer to a default include handler. This default include handler includes files that are relative to the current directory and files that are relative to the directory of the initial source file. When you use <b>D3D_COMPILE_STANDARD_FILE_INCLUDE</b>, you must specify the source file name in the <i>pSourceName</i> parameter; the compiler will derive the initial relative directory from <i>pSourceName</i>.
     * 
     * 
     * ```cpp
     * @param {PSTR} pEntrypoint Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the shader entry point function where shader execution begins. When you compile using a fx profile (for example, fx_4_0, fx_5_0, and so on), <b>D3DCompile</b> ignores <i>pEntrypoint</i>. In this case, we recommend that you set <i>pEntrypoint</i> to <b>NULL</b> because it is good programming practice to set a pointer parameter to <b>NULL</b> if the called function will not use it. For all other shader profiles, a valid <i>pEntrypoint</i> is required.
     * @param {PSTR} pTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that specifies the shader target or set of shader features to compile against. The shader target can be shader model 2, shader model 3, shader model 4, or shader model 5. The target can also be an effect type (for example, fx_4_1). For info about the targets that various profiles support, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/specifying-compiler-targets">Specifying Compiler Targets</a>.
     * @param {Integer} Flags1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags defined by <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-constants">D3D compile constants</a>.
     * @param {Integer} Flags2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags defined by <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-effect-constants">D3D compile effect constants</a>. When you compile a shader and not an effect file, <b>D3DCompile</b> ignores <i>Flags2</i>; we recommend that you set <i>Flags2</i> to zero because it is good programming practice to set a nonpointer parameter to zero if the called function will not use it.
     * @param {Pointer<ID3DBlob>} ppCode Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the compiled code.
     * @param {Pointer<ID3DBlob>} ppErrorMsgs Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access compiler error messages, or <b>NULL</b> if there are no errors.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dcompile
     */
    static D3DCompile(pSrcData, SrcDataSize, pSourceName, pDefines, pInclude, pEntrypoint, pTarget, Flags1, Flags2, ppCode, ppErrorMsgs) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntrypoint := pEntrypoint is String ? StrPtr(pEntrypoint) : pEntrypoint
        pTarget := pTarget is String ? StrPtr(pTarget) : pTarget

        result := DllCall("D3DCOMPILER_47.dll\D3DCompile", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pSourceName, "ptr", pDefines, "ptr", pInclude, "ptr", pEntrypoint, "ptr", pTarget, "uint", Flags1, "uint", Flags2, "ptr", ppCode, "ptr", ppErrorMsgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compiles Microsoft High Level Shader Language (HLSL) code into bytecode for a given target.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to uncompiled shader data (ASCII HLSL code).
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {PSTR} pSourceName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * An optional pointer to a constant null-terminated string containing the name that identifies the source data to use in error messages. If not used, set to <b>NULL</b>.
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D_SHADER_MACRO</a>*</b>
     * 
     * An optional array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D_SHADER_MACRO</a> structures that define shader macros. Each macro definition contains a name and a NULL-terminated definition. If not used, set to <b>NULL</b>.
     * @param {Pointer<ID3DInclude>} pInclude Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a>*</b>
     * 
     *  A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a> interface that the compiler uses to handle include files. If you set this parameter to <b>NULL</b> and the shader contains a #include, a compile error occurs. You can pass the <b>D3D_COMPILE_STANDARD_FILE_INCLUDE</b> macro, which is a pointer to a default include handler. This default include handler includes files that are relative to the current directory and files that are relative to the directory of the initial source file. When you use <b>D3D_COMPILE_STANDARD_FILE_INCLUDE</b>, you must specify the source file name in the <i>pSourceName</i> parameter; the compiler will derive the initial relative directory from <i>pSourceName</i>.
     * 
     * 
     * ```
     * @param {PSTR} pEntrypoint Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A pointer to a constant null-terminated string that contains  the name of the shader entry point function where shader execution begins. When you compile an effect, <b>D3DCompile2</b> ignores <i>pEntrypoint</i>; we recommend that you set <i>pEntrypoint</i> to <b>NULL</b> because it is good programming practice to set a pointer parameter to <b>NULL</b> if the called function will not use it.
     * @param {PSTR} pTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A pointer to a constant null-terminated string that specifies the shader target or set of shader features to compile against. The shader target can be a shader model (for example, shader model 2, shader model 3, shader model 4, or shader model 5). The target can also be an effect type (for example, fx_4_1). For info about the targets that various profiles support, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/specifying-compiler-targets">Specifying Compiler Targets</a>.
     * @param {Integer} Flags1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of shader <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-constants">D3D compile constants</a> that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how the compiler compiles the HLSL code.
     * @param {Integer} Flags2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of effect <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-effect-constants">D3D compile effect constants</a> that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how the compiler compiles the effect. When you compile a shader and not an effect file, <b>D3DCompile2</b> ignores <i>Flags2</i>; we recommend that you set <i>Flags2</i> to zero because it is good programming practice to set a nonpointer parameter to zero if the called function will not use it.
     * @param {Integer} SecondaryDataFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of the following flags that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how the compiler compiles the HLSL code. 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS (0x01)</td>
     * <td>Merge unordered access view (UAV) slots in the secondary data that the <i>pSecondaryData</i> parameter points to.</td>
     * </tr>
     * <tr>
     * <td>D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS (0x02)</td>
     * <td>Preserve template slots in the secondary data that the <i>pSecondaryData</i> parameter points to.</td>
     * </tr>
     * <tr>
     * <td>D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH (0x04)</td>
     * <td>Require that templates in the secondary data that the <i>pSecondaryData</i> parameter points to match when the compiler compiles the HLSL code.</td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>pSecondaryData</i> is <b>NULL</b>, set to zero.
     * @param {Pointer} pSecondaryData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to secondary data. If you don't pass secondary data, set to <b>NULL</b>. Use this secondary data  to align UAV slots in two shaders. Suppose shader A has UAVs and they are bound to some slots. To compile shader B such that UAVs with the same names are mapped in B to the same slots as in A, pass A’s byte code to <b>D3DCompile2</b> as the secondary data.
     * @param {Pointer} SecondaryDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size, in bytes, of the block of memory that <i>pSecondaryData</i> points to. If <i>pSecondaryData</i> is <b>NULL</b>, set to zero.
     * @param {Pointer<ID3DBlob>} ppCode Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the compiled code.
     * @param {Pointer<ID3DBlob>} ppErrorMsgs Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access compiler error messages, or <b>NULL</b> if there are no errors.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dcompile2
     */
    static D3DCompile2(pSrcData, SrcDataSize, pSourceName, pDefines, pInclude, pEntrypoint, pTarget, Flags1, Flags2, SecondaryDataFlags, pSecondaryData, SecondaryDataSize, ppCode, ppErrorMsgs) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName
        pEntrypoint := pEntrypoint is String ? StrPtr(pEntrypoint) : pEntrypoint
        pTarget := pTarget is String ? StrPtr(pTarget) : pTarget

        result := DllCall("D3DCOMPILER_47.dll\D3DCompile2", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pSourceName, "ptr", pDefines, "ptr", pInclude, "ptr", pEntrypoint, "ptr", pTarget, "uint", Flags1, "uint", Flags2, "uint", SecondaryDataFlags, "ptr", pSecondaryData, "ptr", SecondaryDataSize, "ptr", ppCode, "ptr", ppErrorMsgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compiles Microsoft High Level Shader Language (HLSL) code into bytecode for a given target.
     * @param {PWSTR} pFileName A pointer to a constant null-terminated string that contains  the name of the file that contains the shader code.
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines An optional array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D_SHADER_MACRO</a> structures that define shader macros. Each macro definition contains a name and a NULL-terminated definition. If not used, set to <b>NULL</b>.
     * @param {Pointer<ID3DInclude>} pInclude An optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a> interface that the compiler uses to handle include files. If you set this parameter to <b>NULL</b> and the shader contains a #include, a compile error occurs. You can pass the <b>D3D_COMPILE_STANDARD_FILE_INCLUDE</b> macro, which is a pointer to a default include handler. This default include handler includes files that are relative to the current directory.
     * 
     * 
     * ```
     * @param {PSTR} pEntrypoint A pointer to a constant null-terminated string that contains  the name of the shader entry point function where shader execution begins. When you compile an effect, <b>D3DCompileFromFile</b> ignores <i>pEntrypoint</i>; we recommend that you set <i>pEntrypoint</i> to <b>NULL</b> because it is good programming practice to set a pointer parameter to <b>NULL</b> if the called function will not use it.
     * @param {PSTR} pTarget A pointer to a constant null-terminated string that specifies the shader target or set of shader features to compile against. The shader target can be a shader model (for example, shader model 2, shader model 3, shader model 4, or shader model 5 and later). The target can also be an effect type (for example, fx_4_1). For info about the targets that various profiles support, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/specifying-compiler-targets">Specifying Compiler Targets</a>.
     * @param {Integer} Flags1 A combination of shader <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-constants">compile options</a> that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how the compiler compiles the HLSL code.
     * @param {Integer} Flags2 A combination of effect <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompile-effect-constants">compile options</a> that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how the compiler compiles the effect. When you compile a shader and not an effect file, <b>D3DCompileFromFile</b> ignores <i>Flags2</i>; we recommend that you set <i>Flags2</i> to zero because it is good programming practice to set a nonpointer parameter to zero if the called function will not use it.
     * @param {Pointer<ID3DBlob>} ppCode A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the compiled code.
     * @param {Pointer<ID3DBlob>} ppErrorMsgs An optional pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access compiler error messages, or <b>NULL</b> if there are no errors.
     * @returns {HRESULT} Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dcompilefromfile
     */
    static D3DCompileFromFile(pFileName, pDefines, pInclude, pEntrypoint, pTarget, Flags1, Flags2, ppCode, ppErrorMsgs) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName
        pEntrypoint := pEntrypoint is String ? StrPtr(pEntrypoint) : pEntrypoint
        pTarget := pTarget is String ? StrPtr(pTarget) : pTarget

        result := DllCall("D3DCOMPILER_47.dll\D3DCompileFromFile", "ptr", pFileName, "ptr", pDefines, "ptr", pInclude, "ptr", pEntrypoint, "ptr", pTarget, "uint", Flags1, "uint", Flags2, "ptr", ppCode, "ptr", ppErrorMsgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Preprocesses uncompiled HLSL code.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to uncompiled shader data; either ASCII HLSL code or a compiled effect.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {PSTR} pSourceName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     *  The name of the file that contains the uncompiled HLSL code.
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D_SHADER_MACRO</a>*</b>
     * 
     *  An array of NULL-terminated macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D_SHADER_MACRO</a>).
     * @param {Pointer<ID3DInclude>} pInclude Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a>*</b>
     * 
     *  A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3dinclude">ID3DInclude</a> for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include. You can pass the <b>D3D_COMPILE_STANDARD_FILE_INCLUDE</b> macro, which is a pointer to a default include handler. This default include handler includes files that are relative to the current directory and files that are relative to the directory of the initial source file. When you use <b>D3D_COMPILE_STANDARD_FILE_INCLUDE</b>, you must specify the source file name in the <i>pSourceName</i> parameter; the compiler will derive the initial relative directory from <i>pSourceName</i>.
     * 
     * 
     * ```cpp
     * @param {Pointer<ID3DBlob>} ppCodeText Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> that contains the compiled code.
     * @param {Pointer<ID3DBlob>} ppErrorMsgs Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     *  A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> that contains compiler error messages, or <b>NULL</b> if there were no errors.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dpreprocess
     */
    static D3DPreprocess(pSrcData, SrcDataSize, pSourceName, pDefines, pInclude, ppCodeText, ppErrorMsgs) {
        pSourceName := pSourceName is String ? StrPtr(pSourceName) : pSourceName

        result := DllCall("D3DCOMPILER_47.dll\D3DPreprocess", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pSourceName, "ptr", pDefines, "ptr", pInclude, "ptr", ppCodeText, "ptr", ppErrorMsgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Note  You can use this API to develop your Windows Store apps, but you can't use it in apps that you submit to the Windows Store. Gets shader debug information.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data; either uncompiled or compiled HLSL code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {Pointer<ID3DBlob>} ppDebugInfo Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that contains debug information.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dgetdebuginfo
     */
    static D3DGetDebugInfo(pSrcData, SrcDataSize, ppDebugInfo) {
        result := DllCall("D3DCOMPILER_47.dll\D3DGetDebugInfo", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", ppDebugInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a pointer to a reflection interface.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data as compiled HLSL code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {Pointer<Guid>} pInterface Type: <b>REFIID</b>
     * 
     * The reference GUID of the COM interface to use. For example, <b>IID_ID3D11ShaderReflection</b>.
     * @param {Pointer<Void>} ppReflector Type: <b>void**</b>
     * 
     * A pointer to a reflection interface.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dreflect
     */
    static D3DReflect(pSrcData, SrcDataSize, pInterface, ppReflector) {
        result := DllCall("D3DCOMPILER_47.dll\D3DReflect", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pInterface, "ptr", ppReflector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a library-reflection interface from source data that contains an HLSL library of functions.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data as an HLSL library of functions.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The reference GUID of the COM interface to use. For example, <b>IID_ID3D11LibraryReflection</b>.
     * @param {Pointer<Void>} ppReflector Type: <b>LPVOID*</b>
     * 
     * A pointer to a variable that receives a pointer to a library-reflection interface, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11libraryreflection">ID3D11LibraryReflection</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dreflectlibrary
     */
    static D3DReflectLibrary(pSrcData, SrcDataSize, riid, ppReflector) {
        result := DllCall("D3DCOMPILER_47.dll\D3DReflectLibrary", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", riid, "ptr", ppReflector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Disassembles compiled HLSL code.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data as compiled HLSL code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @param {PSTR} szComments Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The comment string at the top of the shader that identifies the shader constants and variables.
     * @param {Pointer<ID3DBlob>} ppDisassembly Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that accesses assembly text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3ddisassemble
     */
    static D3DDisassemble(pSrcData, SrcDataSize, Flags, szComments, ppDisassembly) {
        szComments := szComments is String ? StrPtr(szComments) : szComments

        result := DllCall("D3DCOMPILER_47.dll\D3DDisassemble", "ptr", pSrcData, "ptr", SrcDataSize, "uint", Flags, "ptr", szComments, "ptr", ppDisassembly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Disassembles a specific region of compiled Microsoft High Level Shader Language (HLSL) code.
     * @param {Pointer} pSrcData A pointer to compiled shader data.
     * @param {Pointer} SrcDataSize The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Integer} Flags A combination of zero or more of the following flags that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how <b>D3DDisassembleRegion</b> disassembles the compiled shader data.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D3D_DISASM_ENABLE_COLOR_CODE (0x01)</td>
     * <td>Enable the output of color codes.</td>
     * </tr>
     * <tr>
     * <td>D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS (0x02)</td>
     * <td>Enable the output of default values.</td>
     * </tr>
     * <tr>
     * <td>D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING (0x04)</td>
     * <td>Enable instruction numbering.</td>
     * </tr>
     * <tr>
     * <td>D3D_DISASM_ENABLE_INSTRUCTION_CYCLE (0x08)</td>
     * <td>No effect.</td>
     * </tr>
     * <tr>
     * <td>D3D_DISASM_DISABLE_DEBUG_INFO (0x10)</td>
     * <td>Disable the output of debug information.</td>
     * </tr>
     * <tr>
     * <td>D3D_DISASM_ENABLE_INSTRUCTION_OFFSET (0x20)</td>
     * <td>Enable the output of instruction offsets.</td>
     * </tr>
     * <tr>
     * <td>D3D_DISASM_INSTRUCTION_ONLY (0x40)</td>
     * <td>This flag has no effect in <b>D3DDisassembleRegion</b>. Cycle information comes from the trace; therefore, cycle information is available only in <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3ddisassemble11trace">D3DDisassemble11Trace</a>'s trace disassembly.</td>
     * </tr>
     * </table>
     * @param {PSTR} szComments A pointer to a constant null-terminated string at the top of the shader that identifies the shader constants and variables.
     * @param {Pointer} StartByteOffset The number of bytes offset into the compiled shader data where <b>D3DDisassembleRegion</b> starts the disassembly.
     * @param {Pointer} NumInsts The number of instructions to disassemble.
     * @param {Pointer<UIntPtr>} pFinishByteOffset A pointer to a variable that receives the number of bytes offset into the compiled shader data where <b>D3DDisassembleRegion</b> finishes the disassembly.
     * @param {Pointer<ID3DBlob>} ppDisassembly A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that accesses the disassembled HLSL code.
     * @returns {HRESULT} Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3ddisassembleregion
     */
    static D3DDisassembleRegion(pSrcData, SrcDataSize, Flags, szComments, StartByteOffset, NumInsts, pFinishByteOffset, ppDisassembly) {
        szComments := szComments is String ? StrPtr(szComments) : szComments

        result := DllCall("D3DCOMPILER_47.dll\D3DDisassembleRegion", "ptr", pSrcData, "ptr", SrcDataSize, "uint", Flags, "ptr", szComments, "ptr", StartByteOffset, "ptr", NumInsts, "ptr*", pFinishByteOffset, "ptr", ppDisassembly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a linker interface. Note  This function is part of the HLSL shader linking technology that you can use on all Direct3D 11 platforms to create precompiled HLSL functions, package them into libraries, and link them into full shaders at run time.  .
     * @param {Pointer<ID3D11Linker>} ppLinker Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linker">ID3D11Linker</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11linker">ID3D11Linker</a> interface that is used to link a shader module.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dcreatelinker
     */
    static D3DCreateLinker(ppLinker) {
        result := DllCall("D3DCOMPILER_47.dll\D3DCreateLinker", "ptr", ppLinker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a shader module interface from source data for the shader module.
     * @param {Pointer<Void>} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to the source data for the shader module.
     * @param {Pointer} cbSrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Pointer<ID3D11Module>} ppModule Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11module">ID3D11Module</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11module">ID3D11Module</a> interface that is used for shader resource re-binding.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dloadmodule
     */
    static D3DLoadModule(pSrcData, cbSrcDataSize, ppModule) {
        result := DllCall("D3DCOMPILER_47.dll\D3DLoadModule", "ptr", pSrcData, "ptr", cbSrcDataSize, "ptr", ppModule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a function-linking-graph interface.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved
     * @param {Pointer<ID3D11FunctionLinkingGraph>} ppFunctionLinkingGraph Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11functionlinkinggraph">ID3D11FunctionLinkingGraph</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nn-d3d11shader-id3d11functionlinkinggraph">ID3D11FunctionLinkingGraph</a> interface that is used for constructing shaders that consist of a sequence of precompiled function calls.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dcreatefunctionlinkinggraph
     */
    static D3DCreateFunctionLinkingGraph(uFlags, ppFunctionLinkingGraph) {
        result := DllCall("D3DCOMPILER_47.dll\D3DCreateFunctionLinkingGraph", "uint", uFlags, "ptr", ppFunctionLinkingGraph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the byte offsets for instructions within a section of shader code.
     * @param {Pointer} pSrcData A pointer to the compiled shader data.
     * @param {Pointer} SrcDataSize The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Integer} Flags A combination of the following flags that are combined by using a bitwise <b>OR</b> operation. The resulting value specifies how <b>D3DGetTraceInstructionOffsets</b> retrieves the instruction offsets.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE (0x01)</td>
     * <td>Include non-executable code in the retrieved information.</td>
     * </tr>
     * </table>
     * @param {Pointer} StartInstIndex The index of the instruction in the compiled shader data for which <b>D3DGetTraceInstructionOffsets</b> starts to retrieve the byte offsets.
     * @param {Pointer} NumInsts The number of instructions for which <b>D3DGetTraceInstructionOffsets</b> retrieves the byte offsets.
     * @param {Pointer<UIntPtr>} pOffsets A pointer to a variable that receives the actual number of offsets.
     * @param {Pointer<UIntPtr>} pTotalInsts A pointer to a variable that receives the total number of instructions in the section of shader code.
     * @returns {HRESULT} Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dgettraceinstructionoffsets
     */
    static D3DGetTraceInstructionOffsets(pSrcData, SrcDataSize, Flags, StartInstIndex, NumInsts, pOffsets, pTotalInsts) {
        result := DllCall("D3DCOMPILER_47.dll\D3DGetTraceInstructionOffsets", "ptr", pSrcData, "ptr", SrcDataSize, "uint", Flags, "ptr", StartInstIndex, "ptr", NumInsts, "ptr*", pOffsets, "ptr*", pTotalInsts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Note  D3DGetInputSignatureBlob may be altered or unavailable for releases after Windows 8.1. Instead use D3DGetBlobPart with the D3D_BLOB_INPUT_SIGNATURE_BLOB value.  Gets the input signature from a compilation result.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data as compiled HLSL code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {Pointer<ID3DBlob>} ppSignatureBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that contains a compiled shader.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dgetinputsignatureblob
     */
    static D3DGetInputSignatureBlob(pSrcData, SrcDataSize, ppSignatureBlob) {
        result := DllCall("D3DCOMPILER_47.dll\D3DGetInputSignatureBlob", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", ppSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Note  D3DGetOutputSignatureBlob may be altered or unavailable for releases after Windows 8.1. Instead use D3DGetBlobPart with the D3D_BLOB_OUTPUT_SIGNATURE_BLOB value.  Gets the output signature from a compilation result.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data as compiled HLSL code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {Pointer<ID3DBlob>} ppSignatureBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that contains a compiled shader.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dgetoutputsignatureblob
     */
    static D3DGetOutputSignatureBlob(pSrcData, SrcDataSize, ppSignatureBlob) {
        result := DllCall("D3DCOMPILER_47.dll\D3DGetOutputSignatureBlob", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", ppSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Note  D3DGetInputAndOutputSignatureBlob may be altered or unavailable for releases after Windows 8.1. Instead use D3DGetBlobPart with the D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB value.  Gets the input and output signatures from a compilation result.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data as compiled HLSL code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {Pointer<ID3DBlob>} ppSignatureBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that contains a compiled shader.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dgetinputandoutputsignatureblob
     */
    static D3DGetInputAndOutputSignatureBlob(pSrcData, SrcDataSize, ppSignatureBlob) {
        result := DllCall("D3DCOMPILER_47.dll\D3DGetInputAndOutputSignatureBlob", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", ppSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes unwanted blobs from a compilation result.
     * @param {Pointer} pShaderBytecode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to source data as compiled HLSL code.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pSrcData</i>.
     * @param {Integer} uStripFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Strip flag options, represented by <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3dcompiler-strip-flags">D3DCOMPILER_STRIP_FLAGS</a>.
     * @param {Pointer<ID3DBlob>} ppStrippedBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the unwanted stripped out shader code.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dstripshader
     */
    static D3DStripShader(pShaderBytecode, BytecodeLength, uStripFlags, ppStrippedBlob) {
        result := DllCall("D3DCOMPILER_47.dll\D3DStripShader", "ptr", pShaderBytecode, "ptr", BytecodeLength, "uint", uStripFlags, "ptr", ppStrippedBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a specific part from a compilation result.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to uncompiled shader data; either ASCII HLSL code or a compiled effect.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of uncompiled shader data that <i>pSrcData</i> points to.
     * @param {Integer} Part Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3d-blob-part">D3D_BLOB_PART</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3d-blob-part">D3D_BLOB_PART</a>-typed value that specifies the part of the buffer to retrieve.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags that indicate how to retrieve the blob part. Currently, no flags are defined.
     * @param {Pointer<ID3DBlob>} ppPart Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that is used to retrieve the specified part of the buffer.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dgetblobpart
     */
    static D3DGetBlobPart(pSrcData, SrcDataSize, Part, Flags, ppPart) {
        result := DllCall("D3DCOMPILER_47.dll\D3DGetBlobPart", "ptr", pSrcData, "ptr", SrcDataSize, "int", Part, "uint", Flags, "ptr", ppPart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets information in a compilation result.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to compiled shader data.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The length of the compiled shader data that <i>pSrcData</i> points to.
     * @param {Integer} Part Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3d-blob-part">D3D_BLOB_PART</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3d-blob-part">D3D_BLOB_PART</a>-typed value that specifies the part to set. Currently, you can update only private data; that is, <b>D3DSetBlobPart</b> currently only supports the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/d3d-blob-part">D3D_BLOB_PRIVATE_DATA</a> value.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags that indicate how to set the blob part. Currently, no flags are defined; therefore, set to zero.
     * @param {Pointer} pPart Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to data to set in the compilation result.
     * @param {Pointer} PartSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The length of the data that <i>pPart</i> points to.
     * @param {Pointer<ID3DBlob>} ppNewShader Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface for the new shader in which the new part data is set.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dsetblobpart
     */
    static D3DSetBlobPart(pSrcData, SrcDataSize, Part, Flags, pPart, PartSize, ppNewShader) {
        result := DllCall("D3DCOMPILER_47.dll\D3DSetBlobPart", "ptr", pSrcData, "ptr", SrcDataSize, "int", Part, "uint", Flags, "ptr", pPart, "ptr", PartSize, "ptr", ppNewShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a buffer.
     * @param {Pointer} Size Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Number of bytes in the blob.
     * @param {Pointer<ID3DBlob>} ppBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that is used to retrieve the buffer.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dcreateblob
     */
    static D3DCreateBlob(Size, ppBlob) {
        result := DllCall("D3DCOMPILER_47.dll\D3DCreateBlob", "ptr", Size, "ptr", ppBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compresses a set of shaders into a more compact form.
     * @param {Integer} uNumShaders Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of shaders to compress.
     * @param {Pointer<D3D_SHADER_DATA>} pShaderData Type: [D3D_SHADER_DATA](./ns-d3dcompiler-d3d_shader_data.md)*</b>
     * 
     * An array of [D3D_SHADER_DATA](./ns-d3dcompiler-d3d_shader_data.md) structures that describe the set of shaders to compress.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags that indicate how to compress the shaders. Currently, only the  D3D_COMPRESS_SHADER_KEEP_ALL_PARTS (0x00000001) flag is defined.
     * @param {Pointer<ID3DBlob>} ppCompressedData Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that is used to retrieve the compressed shader data.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3dcompressshaders
     */
    static D3DCompressShaders(uNumShaders, pShaderData, uFlags, ppCompressedData) {
        result := DllCall("D3DCOMPILER_47.dll\D3DCompressShaders", "uint", uNumShaders, "ptr", pShaderData, "uint", uFlags, "ptr", ppCompressedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decompresses one or more shaders from a compressed set.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCVOID</a></b>
     * 
     * A pointer to uncompiled shader data; either ASCII HLSL code or a compiled effect.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of uncompiled shader data that <i>pSrcData</i> points to.
     * @param {Integer} uNumShaders Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of shaders to decompress.
     * @param {Integer} uStartIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first shader to decompress.
     * @param {Pointer<UInt32>} pIndices Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of indexes that represent the shaders to decompress.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags that indicate how to decompress. Currently, no flags are defined.
     * @param {Pointer<ID3DBlob>} ppShaders Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that is used to retrieve the decompressed shader data.
     * @param {Pointer<UInt32>} pTotalShaders Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives the total number of shaders that  <b>D3DDecompressShaders</b> decompressed.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3ddecompressshaders
     */
    static D3DDecompressShaders(pSrcData, SrcDataSize, uNumShaders, uStartIndex, pIndices, uFlags, ppShaders, pTotalShaders) {
        result := DllCall("D3DCOMPILER_47.dll\D3DDecompressShaders", "ptr", pSrcData, "ptr", SrcDataSize, "uint", uNumShaders, "uint", uStartIndex, "uint*", pIndices, "uint", uFlags, "ptr", ppShaders, "uint*", pTotalShaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Disassembles compiled HLSL code from a Direct3D10 effect.
     * @param {Pointer<ID3D10Effect>} pEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect</a>*</b>
     * 
     * A pointer to source data as compiled HLSL code.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Shader <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-shader">compile options</a>.
     * @param {Pointer<ID3DBlob>} ppDisassembly Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a buffer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that contains disassembly text.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 return codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcompiler/nf-d3dcompiler-d3ddisassemble10effect
     */
    static D3DDisassemble10Effect(pEffect, Flags, ppDisassembly) {
        result := DllCall("D3DCOMPILER_47.dll\D3DDisassemble10Effect", "ptr", pEffect, "uint", Flags, "ptr", ppDisassembly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}

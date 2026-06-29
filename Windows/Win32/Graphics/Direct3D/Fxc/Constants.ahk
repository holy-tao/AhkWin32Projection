#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 */

;@region Constants

/**
 * @type {String}
 */
export global D3DCOMPILER_DLL_W := "d3dcompiler_47.dll"

/**
 * @type {String}
 */
export global D3DCOMPILER_DLL_A := "d3dcompiler_47.dll"

/**
 * @type {Integer (UInt32)}
 */
export global D3D_COMPILER_VERSION := 47

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_DEBUG := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_SKIP_VALIDATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_SKIP_OPTIMIZATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_PACK_MATRIX_ROW_MAJOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_PARTIAL_PRECISION := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_NO_PRESHADER := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_AVOID_FLOW_CONTROL := 512

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_PREFER_FLOW_CONTROL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_ENABLE_STRICTNESS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_IEEE_STRICTNESS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_OPTIMIZATION_LEVEL0 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_OPTIMIZATION_LEVEL1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_OPTIMIZATION_LEVEL3 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_RESERVED16 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_RESERVED17 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_WARNINGS_ARE_ERRORS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_RESOURCES_MAY_ALIAS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_ALL_RESOURCES_BOUND := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_DEBUG_NAME_FOR_SOURCE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_DEBUG_NAME_FOR_BINARY := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_EFFECT_CHILD_EFFECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_ENABLE_COLOR_CODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_ENABLE_INSTRUCTION_CYCLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_DISABLE_DEBUG_INFO := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_ENABLE_INSTRUCTION_OFFSET := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_INSTRUCTION_ONLY := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D_DISASM_PRINT_HEX_LITERALS := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D_COMPRESS_SHADER_KEEP_ALL_PARTS := 1
;@endregion Constants

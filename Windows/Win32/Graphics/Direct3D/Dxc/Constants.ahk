#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */

;@region Constants

/**
 * @type {Guid}
 */
export global CLSID_DxcUtils := Guid("{6245d6af-66e0-48fd-80b4-4d271796748c}")

/**
 * @type {Integer (UInt32)}
 */
export global DXC_HASHFLAG_INCLUDES_SOURCE := 1

/**
 * @type {String}
 */
export global DXC_ARG_DEBUG := "-Zi"

/**
 * @type {String}
 */
export global DXC_ARG_SKIP_VALIDATION := "-Vd"

/**
 * @type {String}
 */
export global DXC_ARG_SKIP_OPTIMIZATIONS := "-Od"

/**
 * @type {String}
 */
export global DXC_ARG_PACK_MATRIX_ROW_MAJOR := "-Zpr"

/**
 * @type {String}
 */
export global DXC_ARG_PACK_MATRIX_COLUMN_MAJOR := "-Zpc"

/**
 * @type {String}
 */
export global DXC_ARG_AVOID_FLOW_CONTROL := "-Gfa"

/**
 * @type {String}
 */
export global DXC_ARG_PREFER_FLOW_CONTROL := "-Gfp"

/**
 * @type {String}
 */
export global DXC_ARG_ENABLE_STRICTNESS := "-Ges"

/**
 * @type {String}
 */
export global DXC_ARG_ENABLE_BACKWARDS_COMPATIBILITY := "-Gec"

/**
 * @type {String}
 */
export global DXC_ARG_IEEE_STRICTNESS := "-Gis"

/**
 * @type {String}
 */
export global DXC_ARG_OPTIMIZATION_LEVEL0 := "-O0"

/**
 * @type {String}
 */
export global DXC_ARG_OPTIMIZATION_LEVEL1 := "-O1"

/**
 * @type {String}
 */
export global DXC_ARG_OPTIMIZATION_LEVEL2 := "-O2"

/**
 * @type {String}
 */
export global DXC_ARG_OPTIMIZATION_LEVEL3 := "-O3"

/**
 * @type {String}
 */
export global DXC_ARG_WARNINGS_ARE_ERRORS := "-WX"

/**
 * @type {String}
 */
export global DXC_ARG_RESOURCES_MAY_ALIAS := "-res_may_alias"

/**
 * @type {String}
 */
export global DXC_ARG_ALL_RESOURCES_BOUND := "-all_resources_bound"

/**
 * @type {String}
 */
export global DXC_ARG_DEBUG_NAME_FOR_SOURCE := "-Zss"

/**
 * @type {String}
 */
export global DXC_ARG_DEBUG_NAME_FOR_BINARY := "-Zsb"

/**
 * @type {String}
 */
export global DXC_EXTRA_OUTPUT_NAME_STDOUT := "*stdout*"

/**
 * @type {String}
 */
export global DXC_EXTRA_OUTPUT_NAME_STDERR := "*stderr*"

/**
 * @type {Integer (UInt32)}
 */
export global DxcValidatorFlags_Default := 0

/**
 * @type {Integer (UInt32)}
 */
export global DxcValidatorFlags_InPlaceEdit := 1

/**
 * @type {Integer (UInt32)}
 */
export global DxcValidatorFlags_RootSignatureOnly := 2

/**
 * @type {Integer (UInt32)}
 */
export global DxcValidatorFlags_ModuleOnly := 4

/**
 * @type {Integer (UInt32)}
 */
export global DxcValidatorFlags_ValidMask := 7

/**
 * @type {Integer (UInt32)}
 */
export global DxcVersionInfoFlags_None := 0

/**
 * @type {Integer (UInt32)}
 */
export global DxcVersionInfoFlags_Debug := 1

/**
 * @type {Integer (UInt32)}
 */
export global DxcVersionInfoFlags_Internal := 2

/**
 * @type {Guid}
 */
export global CLSID_DxcCompiler := Guid("{73e22d93-e6ce-47f3-b5bf-f0664f39c1b0}")

/**
 * @type {Guid}
 */
export global CLSID_DxcLinker := Guid("{ef6a8087-b0ea-4d56-9e45-d07e1a8b7806}")

/**
 * @type {Guid}
 */
export global CLSID_DxcDiaDataSource := Guid("{cd1f6b73-2ab0-484d-8edc-ebe7a43ca09f}")

/**
 * @type {Guid}
 */
export global CLSID_DxcCompilerArgs := Guid("{3e56ae82-224d-470f-a1a1-fe3016ee9f9d}")

/**
 * @type {Guid}
 */
export global CLSID_DxcLibrary := Guid("{6245d6af-66e0-48fd-80b4-4d271796748c}")

/**
 * @type {Guid}
 */
export global CLSID_DxcValidator := Guid("{8ca3e215-f728-4cf3-8cdd-88af917587a1}")

/**
 * @type {Guid}
 */
export global CLSID_DxcAssembler := Guid("{d728db68-f903-4f80-94cd-dccf76ec7151}")

/**
 * @type {Guid}
 */
export global CLSID_DxcContainerReflection := Guid("{b9f54489-55b8-400c-ba3a-1675e4728b91}")

/**
 * @type {Guid}
 */
export global CLSID_DxcOptimizer := Guid("{ae2cd79f-cc22-453f-9b6b-b124e7a5204c}")

/**
 * @type {Guid}
 */
export global CLSID_DxcContainerBuilder := Guid("{94134294-411f-4574-b4d0-8741e25240d2}")

/**
 * @type {Guid}
 */
export global CLSID_DxcPdbUtils := Guid("{54621dfb-f2ce-457e-ae8c-ec355faeec7c}")
;@endregion Constants

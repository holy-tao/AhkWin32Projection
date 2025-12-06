#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class Dxc {

;@region Constants

    /**
     * @type {Guid}
     */
    static CLSID_DxcUtils => Guid("{6245d6af-66e0-48fd-80b4-4d271796748c}")

    /**
     * @type {Integer (UInt32)}
     */
    static DXC_HASHFLAG_INCLUDES_SOURCE => 1

    /**
     * @type {String}
     */
    static DXC_ARG_DEBUG => "-Zi"

    /**
     * @type {String}
     */
    static DXC_ARG_SKIP_VALIDATION => "-Vd"

    /**
     * @type {String}
     */
    static DXC_ARG_SKIP_OPTIMIZATIONS => "-Od"

    /**
     * @type {String}
     */
    static DXC_ARG_PACK_MATRIX_ROW_MAJOR => "-Zpr"

    /**
     * @type {String}
     */
    static DXC_ARG_PACK_MATRIX_COLUMN_MAJOR => "-Zpc"

    /**
     * @type {String}
     */
    static DXC_ARG_AVOID_FLOW_CONTROL => "-Gfa"

    /**
     * @type {String}
     */
    static DXC_ARG_PREFER_FLOW_CONTROL => "-Gfp"

    /**
     * @type {String}
     */
    static DXC_ARG_ENABLE_STRICTNESS => "-Ges"

    /**
     * @type {String}
     */
    static DXC_ARG_ENABLE_BACKWARDS_COMPATIBILITY => "-Gec"

    /**
     * @type {String}
     */
    static DXC_ARG_IEEE_STRICTNESS => "-Gis"

    /**
     * @type {String}
     */
    static DXC_ARG_OPTIMIZATION_LEVEL0 => "-O0"

    /**
     * @type {String}
     */
    static DXC_ARG_OPTIMIZATION_LEVEL1 => "-O1"

    /**
     * @type {String}
     */
    static DXC_ARG_OPTIMIZATION_LEVEL2 => "-O2"

    /**
     * @type {String}
     */
    static DXC_ARG_OPTIMIZATION_LEVEL3 => "-O3"

    /**
     * @type {String}
     */
    static DXC_ARG_WARNINGS_ARE_ERRORS => "-WX"

    /**
     * @type {String}
     */
    static DXC_ARG_RESOURCES_MAY_ALIAS => "-res_may_alias"

    /**
     * @type {String}
     */
    static DXC_ARG_ALL_RESOURCES_BOUND => "-all_resources_bound"

    /**
     * @type {String}
     */
    static DXC_ARG_DEBUG_NAME_FOR_SOURCE => "-Zss"

    /**
     * @type {String}
     */
    static DXC_ARG_DEBUG_NAME_FOR_BINARY => "-Zsb"

    /**
     * @type {String}
     */
    static DXC_EXTRA_OUTPUT_NAME_STDOUT => "*stdout*"

    /**
     * @type {String}
     */
    static DXC_EXTRA_OUTPUT_NAME_STDERR => "*stderr*"

    /**
     * @type {Integer (UInt32)}
     */
    static DxcValidatorFlags_Default => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DxcValidatorFlags_InPlaceEdit => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DxcValidatorFlags_RootSignatureOnly => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DxcValidatorFlags_ModuleOnly => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DxcValidatorFlags_ValidMask => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DxcVersionInfoFlags_None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DxcVersionInfoFlags_Debug => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DxcVersionInfoFlags_Internal => 2

    /**
     * @type {Guid}
     */
    static CLSID_DxcCompiler => Guid("{73e22d93-e6ce-47f3-b5bf-f0664f39c1b0}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcLinker => Guid("{ef6a8087-b0ea-4d56-9e45-d07e1a8b7806}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcDiaDataSource => Guid("{cd1f6b73-2ab0-484d-8edc-ebe7a43ca09f}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcCompilerArgs => Guid("{3e56ae82-224d-470f-a1a1-fe3016ee9f9d}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcLibrary => Guid("{6245d6af-66e0-48fd-80b4-4d271796748c}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcValidator => Guid("{8ca3e215-f728-4cf3-8cdd-88af917587a1}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcAssembler => Guid("{d728db68-f903-4f80-94cd-dccf76ec7151}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcContainerReflection => Guid("{b9f54489-55b8-400c-ba3a-1675e4728b91}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcOptimizer => Guid("{ae2cd79f-cc22-453f-9b6b-b124e7a5204c}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcContainerBuilder => Guid("{94134294-411f-4574-b4d0-8741e25240d2}")

    /**
     * @type {Guid}
     */
    static CLSID_DxcPdbUtils => Guid("{54621dfb-f2ce-457e-ae8c-ec355faeec7c}")
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    static DxcCreateInstance(rclsid, riid) {
        result := DllCall("dxcompiler.dll\DxcCreateInstance", "ptr", rclsid, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @param {IMalloc} pMalloc 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    static DxcCreateInstance2(pMalloc, rclsid, riid) {
        result := DllCall("dxcompiler.dll\DxcCreateInstance2", "ptr", pMalloc, "ptr", rclsid, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

;@endregion Methods
}

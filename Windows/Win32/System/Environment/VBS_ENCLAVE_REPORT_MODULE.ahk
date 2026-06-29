#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBS_ENCLAVE_REPORT_VARDATA_HEADER.ahk" { VBS_ENCLAVE_REPORT_VARDATA_HEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes a module loaded for the enclave.
 * @see https://learn.microsoft.com/windows/win32/api/ntenclv/ns-ntenclv-vbs_enclave_report_module
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_ENCLAVE_REPORT_MODULE {
    #StructPack 4

    /**
     * The variable data header for the report.
     */
    Header : VBS_ENCLAVE_REPORT_VARDATA_HEADER

    /**
     * The enclave unique identifier of the module.
     */
    UniqueId : Int8[32]

    /**
     * The author identifier of the module.
     */
    AuthorId : Int8[32]

    /**
     * The family identifier of the module.
     */
    FamilyId : Int8[16]

    /**
     * The image identifier of the module.
     */
    ImageId : Int8[16]

    /**
     * The security version number of the module.
     */
    Svn : UInt32

    /**
     * A NULL-terminated string that contains the name of the module as it was loaded into the enclave.
     */
    ModuleName : WCHAR[1]

}

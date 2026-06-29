#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA {
    #StructPack 8

    lpInformation : IntPtr

    lpSectionBase : IntPtr

    ulSectionLength : UInt32

    lpSectionGlobalDataBase : IntPtr

    ulSectionGlobalDataLength : UInt32

}

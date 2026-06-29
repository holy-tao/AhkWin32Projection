#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_ClientFT_V1 structure. Use the functions with the name prefix &quot;MI_Utilities_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_utilitiesft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_UtilitiesFT {
    #StructPack 8

    /**
     * This function has been deprecated. See 
     *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_utilities_maperrortomierrorcategory">MI_Utilities_MapErrorToMiErrorCategory</a>.
     */
    MapErrorToMiErrorCategory : IntPtr

    /**
     * Maps an operating-system specific error code to a CIM error instance. See 
     *    <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_utilities_cimerrorfromerrorcode">MI_Utilities_CimErrorFromErrorCode</a>.
     */
    CimErrorFromErrorCode : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HELPER_ATTRIBUTE.ahk" { HELPER_ATTRIBUTE }

/**
 * The HYPOTHESIS structure contains data used to submit a hypothesis to NDF for another helper class.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-hypothesis
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct HYPOTHESIS {
    #StructPack 8

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * A pointer to a null-terminated string that contains the name of the helper class.
     */
    pwszClassName : PWSTR

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * A  pointer to a null-terminated string that contains a user-friendly description of the data being passed to the helper class..
     */
    pwszDescription : PWSTR

    /**
     * Type: <b>ULONG</b>
     * 
     * The count of attributes in this hypothesis.
     */
    celt : UInt32

    /**
     * Type: <b>[size_is(celt)]PHELPER_ATTRIBUTE[ ]</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a> structures that contains key attributes for this hypothesis.
     */
    rgAttributes : HELPER_ATTRIBUTE.Ptr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSA_INFO_STATE.ahk" { MSA_INFO_STATE }

/**
 * Specifies information about a managed service account.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-msa_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct MSA_INFO_0 {
    #StructPack 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ne-lmaccess-msa_info_state">MSA_INFO_STATE</a> enumeration that indicates the state of the service account specified in the call to the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netqueryserviceaccount">NetQueryServiceAccount</a> function.
     */
    State : MSA_INFO_STATE

}

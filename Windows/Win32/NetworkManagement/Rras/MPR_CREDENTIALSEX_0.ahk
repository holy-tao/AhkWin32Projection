#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPR_CREDENTIALSEX_0 structure contains extended credentials information such as the information used by Extensible Authentication Protocols (EAPs).
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_credentialsex_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_CREDENTIALSEX_0 {
    #StructPack 8

    /**
     * Specifies the size of the data pointed to by the <b>lpbCredentialsInfo</b> member.
     */
    dwSize : UInt32

    /**
     * Pointer to the extended credentials information.
     */
    lpbCredentialsInfo : IntPtr

}

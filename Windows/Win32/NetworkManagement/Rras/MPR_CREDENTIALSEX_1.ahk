#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPR_CREDENTIALSEX_1 structure contains a pre-shared key used by a demand-dial interface.
 * @remarks
 * To a delete a pre-shared key, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacesetcredentials">MprAdminInterfaceSetCredentials</a> with the <b>MPR_CREDENTIALSEX_1.dwSize</b> member set to zero.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_credentialsex_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_CREDENTIALSEX_1 {
    #StructPack 8

    /**
     * Specifies the size of the data pointed to by the <b>lpbCredentialsInfo</b> member.
     */
    dwSize : UInt32

    /**
     * Pointer to the pre-shared key.
     */
    lpbCredentialsInfo : IntPtr

}

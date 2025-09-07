#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the state of a managed service account.
 * @remarks
 * Service accounts  can be group managed and are called group managed service accounts (gMSA). Standalone managed service accounts (sMSA) are limited to being deployed to a single computer.
  * 
  * <b>Windows Server 2008 R2 and Windows 7:  </b> The managed service account (MSA) is limited to being deployed to a single computer.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ne-lmaccess-msa_info_state
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class MSA_INFO_STATE{

    /**
     * The account does not exist.
     * @type {Integer (Int32)}
     */
    static MsaInfoNotExist => 1

    /**
     * The account exists, but it is not a group managed service account (gMSA) or a Windows Server 2008 R2 or Windows 7 managed service account.
 * 
 * <b>Windows Server 2008 R2 and Windows 7:  </b> The account is not a managed service account.
     * @type {Integer (Int32)}
     */
    static MsaInfoNotService => 2

    /**
     * If the managed service account is a gMSA, the credentials cannot be fetched from the active directory or the Kerberos encryption types did not match.
 * 
 * <b>Windows Server 2008 R2 and Windows 7:  </b> The managed service account cannot be installed.
     * @type {Integer (Int32)}
     */
    static MsaInfoCannotInstall => 3

    /**
     * The sMSA can be installed. This constant will never be returned for a gMSA. 
 * 
 * <b>Windows Server 2008 R2 and Windows 7:  </b> The managed service account can be installed.
     * @type {Integer (Int32)}
     */
    static MsaInfoCanInstall => 4

    /**
     * The gMSA managed service account is installed.
 * 
 * <b>Windows Server 2008 R2 and Windows 7:  </b> The managed service account is installed.
     * @type {Integer (Int32)}
     */
    static MsaInfoInstalled => 5
}

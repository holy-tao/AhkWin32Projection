#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * If the caller requires account creation by privilege, this option will cause a retry on failure using account creation functions enabling interoperability with domain controllers running on earlier versions of Windows. 
  * 
  * The <i>lpMachineAccountOU</i> is not supported when using downlevel privilege support.
 * @see https://learn.microsoft.com/windows/win32/api//content/lmjoin/nf-lmjoin-netprovisioncomputeraccount
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETSETUP_PROVISION extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_DOWNLEVEL_PRIV_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_REUSE_ACCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_USE_DEFAULT_PASSWORD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_SKIP_ACCOUNT_SEARCH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_ROOT_CA_CERTS => 16
}

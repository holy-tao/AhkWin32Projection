#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the level of a managed service account.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ne-lmaccess-msa_info_level
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class MSA_INFO_LEVEL{

    /**
     * The default level.
     * @type {Integer (Int32)}
     */
    static MsaInfoLevel0 => 0

    /**
     * The maximum level.
     * @type {Integer (Int32)}
     */
    static MsaInfoLevelMax => 1
}

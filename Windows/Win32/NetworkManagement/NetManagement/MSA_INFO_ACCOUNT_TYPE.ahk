#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class MSA_INFO_ACCOUNT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MsaAccountFalse => 0

    /**
     * @type {Integer (Int32)}
     */
    static StandAloneManagedServiceAccount => 1

    /**
     * @type {Integer (Int32)}
     */
    static GroupManagedServiceAccount => 2

    /**
     * @type {Integer (Int32)}
     */
    static DelegatedManagedServiceAccount => 3
}

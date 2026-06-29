#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTIONMANAGER_RECOVERY_INFORMATION {
    #StructPack 8

    LastRecoveredLsn : Int64

}

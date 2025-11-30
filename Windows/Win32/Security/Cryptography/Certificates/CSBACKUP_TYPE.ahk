#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CSBACKUP_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CSBACKUP_TYPE_FULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSBACKUP_TYPE_LOGS_ONLY => 2
}

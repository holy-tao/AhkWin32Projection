#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class CSBACKUP_TYPE extends Win32Enum {

    /**
     * Native name: CSBACKUP_TYPE_FULL
     * @type {Integer (UInt32)}
     */
    static FULL => 1

    /**
     * Native name: CSBACKUP_TYPE_LOGS_ONLY
     * @type {Integer (UInt32)}
     */
    static LOGS_ONLY => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class SECURITY_MESSAGE_MSG_ID extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITYMSG_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITYMSG_FAILURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITYMSG_ERROR => 3
}

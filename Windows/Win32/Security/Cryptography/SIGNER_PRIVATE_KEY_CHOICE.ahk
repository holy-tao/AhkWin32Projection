#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_PRIVATE_KEY_CHOICE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PVK_TYPE_FILE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PVK_TYPE_KEYCONTAINER => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/card-directory-access-condition
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CARD_DIRECTORY_ACCESS_CONDITION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InvalidDirAc => 0

    /**
     * @type {Integer (Int32)}
     */
    static UserCreateDeleteDirAc => 1

    /**
     * @type {Integer (Int32)}
     */
    static AdminCreateDeleteDirAc => 2
}

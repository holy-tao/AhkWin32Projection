#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents information about a target algorithm.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.capi1kdftargetalgorithm
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class Capi1KdfTargetAlgorithm extends Win32Enum{

    /**
     * The target algorithm is not AES.
     * @type {Integer (Int32)}
     */
    static NotAes => 0

    /**
     * The target algorithm is AES.
     * @type {Integer (Int32)}
     */
    static Aes => 1
}

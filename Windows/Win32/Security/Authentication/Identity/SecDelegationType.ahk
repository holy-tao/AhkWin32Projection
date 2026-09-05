#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The type of delegation used.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-secdelegationtype
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecDelegationType extends Win32Enum {

    /**
     * Native name: SecFull
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * Native name: SecService
     * @type {Integer (Int32)}
     */
    static Service => 1

    /**
     * Native name: SecTree
     * @type {Integer (Int32)}
     */
    static Tree => 2

    /**
     * Native name: SecDirectory
     * @type {Integer (Int32)}
     */
    static Directory => 3

    /**
     * Native name: SecObject
     * @type {Integer (Int32)}
     */
    static Object => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.AppLocker
 */
class SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SAFER_TOKEN_NULL_IF_EQUAL
     * @type {Integer (UInt32)}
     */
    static NULL_IF_EQUAL => 1

    /**
     * Native name: SAFER_TOKEN_COMPARE_ONLY
     * @type {Integer (UInt32)}
     */
    static COMPARE_ONLY => 2

    /**
     * Native name: SAFER_TOKEN_MAKE_INERT
     * @type {Integer (UInt32)}
     */
    static MAKE_INERT => 4

    /**
     * Native name: SAFER_TOKEN_WANT_FLAGS
     * @type {Integer (UInt32)}
     */
    static WANT_FLAGS => 8
}

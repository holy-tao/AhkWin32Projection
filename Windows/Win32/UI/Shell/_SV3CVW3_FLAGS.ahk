#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class _SV3CVW3_FLAGS extends Win32Enum {

    /**
     * Native name: SV3CVW3_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: SV3CVW3_NONINTERACTIVE
     * @type {Integer (Int32)}
     */
    static NONINTERACTIVE => 1

    /**
     * Native name: SV3CVW3_FORCEVIEWMODE
     * @type {Integer (Int32)}
     */
    static FORCEVIEWMODE => 2

    /**
     * Native name: SV3CVW3_FORCEFOLDERFLAGS
     * @type {Integer (Int32)}
     */
    static FORCEFOLDERFLAGS => 4
}

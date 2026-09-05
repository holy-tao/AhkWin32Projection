#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SECPKG_PACKAGE_CHANGE_TYPE extends Win32Enum {

    /**
     * Native name: SECPKG_PACKAGE_CHANGE_LOAD
     * @type {Integer (UInt32)}
     */
    static LOAD => 0

    /**
     * Native name: SECPKG_PACKAGE_CHANGE_UNLOAD
     * @type {Integer (UInt32)}
     */
    static UNLOAD => 1

    /**
     * Native name: SECPKG_PACKAGE_CHANGE_SELECT
     * @type {Integer (UInt32)}
     */
    static SELECT => 2
}

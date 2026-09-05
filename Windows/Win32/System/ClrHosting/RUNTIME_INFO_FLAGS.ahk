#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class RUNTIME_INFO_FLAGS extends Win32Enum {

    /**
     * Native name: RUNTIME_INFO_UPGRADE_VERSION
     * @type {Integer (Int32)}
     */
    static UPGRADE_VERSION => 1

    /**
     * Native name: RUNTIME_INFO_REQUEST_IA64
     * @type {Integer (Int32)}
     */
    static REQUEST_IA64 => 2

    /**
     * Native name: RUNTIME_INFO_REQUEST_AMD64
     * @type {Integer (Int32)}
     */
    static REQUEST_AMD64 => 4

    /**
     * Native name: RUNTIME_INFO_REQUEST_X86
     * @type {Integer (Int32)}
     */
    static REQUEST_X86 => 8

    /**
     * Native name: RUNTIME_INFO_DONT_RETURN_DIRECTORY
     * @type {Integer (Int32)}
     */
    static DONT_RETURN_DIRECTORY => 16

    /**
     * Native name: RUNTIME_INFO_DONT_RETURN_VERSION
     * @type {Integer (Int32)}
     */
    static DONT_RETURN_VERSION => 32

    /**
     * Native name: RUNTIME_INFO_DONT_SHOW_ERROR_DIALOG
     * @type {Integer (Int32)}
     */
    static DONT_SHOW_ERROR_DIALOG => 64

    /**
     * Native name: RUNTIME_INFO_IGNORE_ERROR_MODE
     * @type {Integer (Int32)}
     */
    static IGNORE_ERROR_MODE => 4096

    /**
     * Native name: RUNTIME_INFO_REQUEST_ARM64
     * @type {Integer (Int32)}
     */
    static REQUEST_ARM64 => 8192
}

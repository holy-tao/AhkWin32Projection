#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class RUNTIME_INFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_UPGRADE_VERSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_IA64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_AMD64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_X86 => 8

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_DONT_RETURN_DIRECTORY => 16

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_DONT_RETURN_VERSION => 32

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_DONT_SHOW_ERROR_DIALOG => 64

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_IGNORE_ERROR_MODE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_ARM64 => 8192
}

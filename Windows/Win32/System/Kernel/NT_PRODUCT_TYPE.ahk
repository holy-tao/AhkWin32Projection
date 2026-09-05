#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 */
class NT_PRODUCT_TYPE extends Win32Enum {

    /**
     * Native name: NtProductWinNt
     * @type {Integer (Int32)}
     */
    static WinNt => 1

    /**
     * Native name: NtProductLanManNt
     * @type {Integer (Int32)}
     */
    static LanManNt => 2

    /**
     * Native name: NtProductServer
     * @type {Integer (Int32)}
     */
    static Server => 3
}

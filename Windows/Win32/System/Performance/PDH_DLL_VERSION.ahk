#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_DLL_VERSION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CVERSION_WIN50 => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_VERSION => 1283
}

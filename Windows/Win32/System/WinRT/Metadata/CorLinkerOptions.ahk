#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorLinkerOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MDAssembly => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDNetModule => 1
}

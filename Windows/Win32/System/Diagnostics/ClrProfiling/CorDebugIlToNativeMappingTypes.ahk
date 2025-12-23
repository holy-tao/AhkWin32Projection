#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class CorDebugIlToNativeMappingTypes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NO_MAPPING => -1

    /**
     * @type {Integer (Int32)}
     */
    static PROLOG => -2

    /**
     * @type {Integer (Int32)}
     */
    static EPILOG => -3
}

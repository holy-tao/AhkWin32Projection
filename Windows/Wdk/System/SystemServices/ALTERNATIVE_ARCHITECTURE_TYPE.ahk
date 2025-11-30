#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class ALTERNATIVE_ARCHITECTURE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StandardDesign => 0

    /**
     * @type {Integer (Int32)}
     */
    static NEC98x86 => 1

    /**
     * @type {Integer (Int32)}
     */
    static EndAlternatives => 2
}

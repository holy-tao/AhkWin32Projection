#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ACENUMOPTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ACEO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ACEO_MOSTRECENTFIRST => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACEO_FIRSTUNUSED => 65536
}

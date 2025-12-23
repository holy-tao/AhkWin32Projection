#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVPRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPVPRI_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPVPRI_ALERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPVPRI_OVER => 2
}

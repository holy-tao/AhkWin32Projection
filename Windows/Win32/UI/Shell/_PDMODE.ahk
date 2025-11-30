#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _PDMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PDM_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PDM_RUN => 1

    /**
     * @type {Integer (Int32)}
     */
    static PDM_PREFLIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static PDM_UNDOING => 4

    /**
     * @type {Integer (Int32)}
     */
    static PDM_ERRORSBLOCKING => 8

    /**
     * @type {Integer (Int32)}
     */
    static PDM_INDETERMINATE => 16
}

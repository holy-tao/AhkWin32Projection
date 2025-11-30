#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SERVICE_ERROR_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IgnoreError => 0

    /**
     * @type {Integer (Int32)}
     */
    static NormalError => 1

    /**
     * @type {Integer (Int32)}
     */
    static SevereError => 2

    /**
     * @type {Integer (Int32)}
     */
    static CriticalError => 3
}

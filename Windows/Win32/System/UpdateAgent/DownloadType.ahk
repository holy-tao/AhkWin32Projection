#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class DownloadType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static downloadTypeFull => 0

    /**
     * @type {Integer (Int32)}
     */
    static downloadTypeUpdateBootstrapper => 1
}

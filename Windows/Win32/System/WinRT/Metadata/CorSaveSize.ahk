#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorSaveSize extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static cssAccurate => 0

    /**
     * @type {Integer (Int32)}
     */
    static cssQuick => 1

    /**
     * @type {Integer (Int32)}
     */
    static cssDiscardTransientCAs => 2
}

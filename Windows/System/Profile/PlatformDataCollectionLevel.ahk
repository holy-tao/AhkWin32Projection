#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the diagnostics data collection level.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.platformdatacollectionlevel
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class PlatformDataCollectionLevel extends Win32Enum{

    /**
     * Security data
     * @type {Integer (Int32)}
     */
    static Security => 0

    /**
     * Basic data
     * @type {Integer (Int32)}
     */
    static Basic => 1

    /**
     * Enhanced data
     * @type {Integer (Int32)}
     */
    static Enhanced => 2

    /**
     * All data
     * @type {Integer (Int32)}
     */
    static Full => 3
}

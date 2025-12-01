#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what kind of PRI file(s) should be created by MrmCreateResourceFile and MrmCreateResourceFileInMemory.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmpackagingmode
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MrmPackagingMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MrmPackagingModeStandaloneFile => 0

    /**
     * @type {Integer (Int32)}
     */
    static MrmPackagingModeAutoSplit => 1

    /**
     * @type {Integer (Int32)}
     */
    static MrmPackagingModeResourcePack => 2
}

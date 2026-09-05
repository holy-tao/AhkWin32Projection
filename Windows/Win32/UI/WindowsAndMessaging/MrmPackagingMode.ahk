#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what kind of PRI file(s) should be created by MrmCreateResourceFile and MrmCreateResourceFileInMemory.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmpackagingmode
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class MrmPackagingMode extends Win32Enum {

    /**
     * Native name: MrmPackagingModeStandaloneFile
     * @type {Integer (Int32)}
     */
    static StandaloneFile => 0

    /**
     * Native name: MrmPackagingModeAutoSplit
     * @type {Integer (Int32)}
     */
    static AutoSplit => 1

    /**
     * Native name: MrmPackagingModeResourcePack
     * @type {Integer (Int32)}
     */
    static ResourcePack => 2
}

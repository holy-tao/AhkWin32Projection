#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the type of PRI file dump to produce. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmdumptype
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class MrmDumpType extends Win32Enum {

    /**
     * Native name: MrmDumpType_Basic
     * @type {Integer (Int32)}
     */
    static Basic => 0

    /**
     * Native name: MrmDumpType_Detailed
     * @type {Integer (Int32)}
     */
    static Detailed => 1

    /**
     * Native name: MrmDumpType_Schema
     * @type {Integer (Int32)}
     */
    static Schema => 2
}

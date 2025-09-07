#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the type of PRI file dump to produce. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmdumptype
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MrmDumpType{

    /**
     * @type {Integer (Int32)}
     */
    static MrmDumpType_Basic => 0

    /**
     * @type {Integer (Int32)}
     */
    static MrmDumpType_Detailed => 1

    /**
     * @type {Integer (Int32)}
     */
    static MrmDumpType_Schema => 2
}

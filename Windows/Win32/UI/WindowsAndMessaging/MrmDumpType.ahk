#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the type of PRI file dump to produce. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmdumptype
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MrmDumpType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

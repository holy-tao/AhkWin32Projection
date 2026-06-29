#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify what kind of PRI file(s) should be created by MrmCreateResourceFile and MrmCreateResourceFileInMemory.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmpackagingmode
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MrmPackagingMode {
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

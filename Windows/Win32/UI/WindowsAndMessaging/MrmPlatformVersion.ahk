#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a platform version. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmplatformversion
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MrmPlatformVersion {
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
    static MrmPlatformVersion_Default => 0

    /**
     * @type {Integer (Int32)}
     */
    static MrmPlatformVersion_Windows10_0_0_0 => 17432576

    /**
     * @type {Integer (Int32)}
     */
    static MrmPlatformVersion_Windows10_0_0_5 => 17432581
}

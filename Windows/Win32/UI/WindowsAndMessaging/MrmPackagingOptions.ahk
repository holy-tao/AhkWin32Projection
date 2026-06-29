#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify options for the PRI file created by MrmCreateResourceFile and MrmCreateResourceFileInMemory.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmpackagingoptions
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MrmPackagingOptions {
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
    static MrmPackagingOptionsNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MrmPackagingOptionsOmitSchemaFromResourcePacks => 1

    /**
     * @type {Integer (Int32)}
     */
    static MrmPackagingOptionsSplitLanguageVariants => 2
}

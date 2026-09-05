#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify options for the PRI file created by MrmCreateResourceFile and MrmCreateResourceFileInMemory.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmpackagingoptions
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class MrmPackagingOptions extends Win32Enum {

    /**
     * Native name: MrmPackagingOptionsNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: MrmPackagingOptionsOmitSchemaFromResourcePacks
     * @type {Integer (Int32)}
     */
    static OmitSchemaFromResourcePacks => 1

    /**
     * Native name: MrmPackagingOptionsSplitLanguageVariants
     * @type {Integer (Int32)}
     */
    static SplitLanguageVariants => 2
}

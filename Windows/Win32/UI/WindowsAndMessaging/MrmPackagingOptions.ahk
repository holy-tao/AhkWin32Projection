#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmpackagingoptions
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MrmPackagingOptions extends Win32Enum{

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

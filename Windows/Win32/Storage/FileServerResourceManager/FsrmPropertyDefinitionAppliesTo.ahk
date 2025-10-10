#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that indicate what a FSRM classification property can be applied to.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmpropertydefinitionappliesto
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyDefinitionAppliesTo{

    /**
     * Indicates if a classification property can be applied to a file.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionAppliesTo_Files => 1

    /**
     * Indicates if a classification property can be applied to a folder.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionAppliesTo_Folders => 2
}

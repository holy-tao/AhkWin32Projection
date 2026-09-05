#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags that indicate what a FSRM classification property can be applied to.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertydefinitionappliesto
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmPropertyDefinitionAppliesTo extends Win32Enum {

    /**
     * Indicates if a classification property can be applied to a file.
     * Native name: FsrmPropertyDefinitionAppliesTo_Files
     * @type {Integer (Int32)}
     */
    static Files => 1

    /**
     * Indicates if a classification property can be applied to a folder.
     * Native name: FsrmPropertyDefinitionAppliesTo_Folders
     * @type {Integer (Int32)}
     */
    static Folders => 2
}

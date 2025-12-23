#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags the describe the type of classification property.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertydefinitionflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyDefinitionFlags extends Win32Enum{

    /**
     * The FSRM classification property definition is defined globally, using group policy.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionFlags_Global => 1

    /**
     * The FSRM classification property definition is deprecated.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionFlags_Deprecated => 2

    /**
     * The FSRM classification property definition is used for security purposes.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionFlags_Secure => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags the describe the type of classification property.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertydefinitionflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmPropertyDefinitionFlags extends Win32Enum {

    /**
     * The FSRM classification property definition is defined globally, using group policy.
     * Native name: FsrmPropertyDefinitionFlags_Global
     * @type {Integer (Int32)}
     */
    static Global => 1

    /**
     * The FSRM classification property definition is deprecated.
     * Native name: FsrmPropertyDefinitionFlags_Deprecated
     * @type {Integer (Int32)}
     */
    static Deprecated => 2

    /**
     * The FSRM classification property definition is used for security purposes.
     * Native name: FsrmPropertyDefinitionFlags_Secure
     * @type {Integer (Int32)}
     */
    static Secure => 4
}

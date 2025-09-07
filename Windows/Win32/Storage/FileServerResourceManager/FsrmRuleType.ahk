#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the types of rules that you can define.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmruletype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmRuleType{

    /**
     * The rule is unknown. Do not use this type.
     * @type {Integer (Int32)}
     */
    static FsrmRuleType_Unknown => 0

    /**
     * The rule defines how a classification module affects a file.
     * @type {Integer (Int32)}
     */
    static FsrmRuleType_Classification => 1

    /**
     * For internal use only.
     * @type {Integer (Int32)}
     */
    static FsrmRuleType_Generic => 2
}

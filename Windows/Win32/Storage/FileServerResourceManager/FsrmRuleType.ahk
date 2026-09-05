#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of rules that you can define.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmruletype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmRuleType extends Win32Enum {

    /**
     * The rule is unknown. Do not use this type.
     * Native name: FsrmRuleType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The rule defines how a classification module affects a file.
     * Native name: FsrmRuleType_Classification
     * @type {Integer (Int32)}
     */
    static Classification => 1

    /**
     * For internal use only.
     * Native name: FsrmRuleType_Generic
     * @type {Integer (Int32)}
     */
    static Generic => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class MergeFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MergeFlagsNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MergeManifest => 1

    /**
     * @type {Integer (Int32)}
     */
    static DropMemberRefCAs => 2

    /**
     * @type {Integer (Int32)}
     */
    static NoDupCheck => 4

    /**
     * @type {Integer (Int32)}
     */
    static MergeExportedTypes => 8
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class MergeFlags extends Win32Enum {

    /**
     * Native name: MergeFlagsNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: MergeManifest
     * @type {Integer (Int32)}
     */
    static Manifest => 1

    /**
     * @type {Integer (Int32)}
     */
    static DropMemberRefCAs => 2

    /**
     * @type {Integer (Int32)}
     */
    static NoDupCheck => 4

    /**
     * Native name: MergeExportedTypes
     * @type {Integer (Int32)}
     */
    static ExportedTypes => 8
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class PackageOrigin2 extends Win32Enum {

    /**
     * Native name: PackageOrigin2_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: PackageOrigin2_Unsigned
     * @type {Integer (Int32)}
     */
    static Unsigned => 1

    /**
     * Native name: PackageOrigin2_Inbox
     * @type {Integer (Int32)}
     */
    static Inbox => 2

    /**
     * Native name: PackageOrigin2_Store
     * @type {Integer (Int32)}
     */
    static Store => 3

    /**
     * Native name: PackageOrigin2_DeveloperUnsigned
     * @type {Integer (Int32)}
     */
    static DeveloperUnsigned => 4

    /**
     * Native name: PackageOrigin2_DeveloperSigned
     * @type {Integer (Int32)}
     */
    static DeveloperSigned => 5

    /**
     * Native name: PackageOrigin2_LineOfBusiness
     * @type {Integer (Int32)}
     */
    static LineOfBusiness => 6

    /**
     * Native name: PackageOrigin2_SignedSBOM
     * @type {Integer (Int32)}
     */
    static SignedSBOM => 7
}

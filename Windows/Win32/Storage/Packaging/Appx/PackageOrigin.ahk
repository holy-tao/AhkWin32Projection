#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the origin of a package.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packageorigin
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class PackageOrigin extends Win32Enum {

    /**
     * The package's origin is unknown.
     * Native name: PackageOrigin_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The package originated as unsigned.
     * Native name: PackageOrigin_Unsigned
     * @type {Integer (Int32)}
     */
    static Unsigned => 1

    /**
     * The package was included inbox.
     * Native name: PackageOrigin_Inbox
     * @type {Integer (Int32)}
     */
    static Inbox => 2

    /**
     * The package originated from the Windows Store.
     * Native name: PackageOrigin_Store
     * @type {Integer (Int32)}
     */
    static Store => 3

    /**
     * The package originated as developer unsigned.
     * Native name: PackageOrigin_DeveloperUnsigned
     * @type {Integer (Int32)}
     */
    static DeveloperUnsigned => 4

    /**
     * The package originated as developer signed.
     * Native name: PackageOrigin_DeveloperSigned
     * @type {Integer (Int32)}
     */
    static DeveloperSigned => 5

    /**
     * The package originated as a line-of-business app.
     * Native name: PackageOrigin_LineOfBusiness
     * @type {Integer (Int32)}
     */
    static LineOfBusiness => 6
}

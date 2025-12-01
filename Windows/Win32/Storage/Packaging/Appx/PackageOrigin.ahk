#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the origin of a package.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packageorigin
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PackageOrigin extends Win32Enum{

    /**
     * The package's origin is unknown.
     * @type {Integer (Int32)}
     */
    static PackageOrigin_Unknown => 0

    /**
     * The package originated as unsigned.
     * @type {Integer (Int32)}
     */
    static PackageOrigin_Unsigned => 1

    /**
     * The package was included inbox.
     * @type {Integer (Int32)}
     */
    static PackageOrigin_Inbox => 2

    /**
     * The package originated from the Windows Store.
     * @type {Integer (Int32)}
     */
    static PackageOrigin_Store => 3

    /**
     * The package originated as developer unsigned.
     * @type {Integer (Int32)}
     */
    static PackageOrigin_DeveloperUnsigned => 4

    /**
     * The package originated as developer signed.
     * @type {Integer (Int32)}
     */
    static PackageOrigin_DeveloperSigned => 5

    /**
     * The package originated as a line-of-business app.
     * @type {Integer (Int32)}
     */
    static PackageOrigin_LineOfBusiness => 6
}

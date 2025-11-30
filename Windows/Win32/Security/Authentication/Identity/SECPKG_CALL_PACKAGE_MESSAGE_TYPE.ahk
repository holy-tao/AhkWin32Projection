#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CALL_PACKAGE_MESSAGE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageMinMessage => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackagePinDcMessage => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageUnpinAllDcsMessage => 1025

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageTransferCredMessage => 1026

    /**
     * @type {Integer (Int32)}
     */
    static SecPkgCallPackageMaxMessage => 1026
}

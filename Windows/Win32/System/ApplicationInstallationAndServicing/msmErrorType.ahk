#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msmErrorType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorLanguageUnsupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorLanguageFailed => 2

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorExclusion => 3

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorTableMerge => 4

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorResequenceMerge => 5

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorFileCreate => 6

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorDirCreate => 7

    /**
     * @type {Integer (Int32)}
     */
    static msmErrorFeatureRequired => 8
}

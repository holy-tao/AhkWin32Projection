#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msmErrorType extends Win32Enum {

    /**
     * Native name: msmErrorLanguageUnsupported
     * @type {Integer (Int32)}
     */
    static LanguageUnsupported => 1

    /**
     * Native name: msmErrorLanguageFailed
     * @type {Integer (Int32)}
     */
    static LanguageFailed => 2

    /**
     * Native name: msmErrorExclusion
     * @type {Integer (Int32)}
     */
    static Exclusion => 3

    /**
     * Native name: msmErrorTableMerge
     * @type {Integer (Int32)}
     */
    static TableMerge => 4

    /**
     * Native name: msmErrorResequenceMerge
     * @type {Integer (Int32)}
     */
    static ResequenceMerge => 5

    /**
     * Native name: msmErrorFileCreate
     * @type {Integer (Int32)}
     */
    static FileCreate => 6

    /**
     * Native name: msmErrorDirCreate
     * @type {Integer (Int32)}
     */
    static DirCreate => 7

    /**
     * Native name: msmErrorFeatureRequired
     * @type {Integer (Int32)}
     */
    static FeatureRequired => 8
}

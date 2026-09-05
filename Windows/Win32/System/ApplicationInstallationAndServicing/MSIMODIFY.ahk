#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIMODIFY extends Win32Enum {

    /**
     * Native name: MSIMODIFY_SEEK
     * @type {Integer (Int32)}
     */
    static SEEK => -1

    /**
     * Native name: MSIMODIFY_REFRESH
     * @type {Integer (Int32)}
     */
    static REFRESH => 0

    /**
     * Native name: MSIMODIFY_INSERT
     * @type {Integer (Int32)}
     */
    static INSERT => 1

    /**
     * Native name: MSIMODIFY_UPDATE
     * @type {Integer (Int32)}
     */
    static UPDATE => 2

    /**
     * Native name: MSIMODIFY_ASSIGN
     * @type {Integer (Int32)}
     */
    static ASSIGN => 3

    /**
     * Native name: MSIMODIFY_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 4

    /**
     * Native name: MSIMODIFY_MERGE
     * @type {Integer (Int32)}
     */
    static MERGE => 5

    /**
     * Native name: MSIMODIFY_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 6

    /**
     * Native name: MSIMODIFY_INSERT_TEMPORARY
     * @type {Integer (Int32)}
     */
    static INSERT_TEMPORARY => 7

    /**
     * Native name: MSIMODIFY_VALIDATE
     * @type {Integer (Int32)}
     */
    static VALIDATE => 8

    /**
     * Native name: MSIMODIFY_VALIDATE_NEW
     * @type {Integer (Int32)}
     */
    static VALIDATE_NEW => 9

    /**
     * Native name: MSIMODIFY_VALIDATE_FIELD
     * @type {Integer (Int32)}
     */
    static VALIDATE_FIELD => 10

    /**
     * Native name: MSIMODIFY_VALIDATE_DELETE
     * @type {Integer (Int32)}
     */
    static VALIDATE_DELETE => 11
}

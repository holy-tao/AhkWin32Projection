#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Writes current data in the cursor to a table row. Updates record if the primary keys match an existing row and inserts if they do not match. Fails with a read-only database. This mode cannot be used with a view containing joins.
 * @see https://learn.microsoft.com/windows/win32/api//content/msiquery/nf-msiquery-msiviewmodify
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSIMODIFY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_SEEK => -1

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_REFRESH => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_INSERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_ASSIGN => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_REPLACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_MERGE => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_DELETE => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_INSERT_TEMPORARY => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE_NEW => 9

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE_FIELD => 10

    /**
     * @type {Integer (Int32)}
     */
    static MSIMODIFY_VALIDATE_DELETE => 11
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorImportOptions{

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAll => -1

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllTypeDefs => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllMethodDefs => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllFieldDefs => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllProperties => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllEvents => 16

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllCustomAttributes => 32

    /**
     * @type {Integer (Int32)}
     */
    static MDImportOptionAllExportedTypes => 64
}

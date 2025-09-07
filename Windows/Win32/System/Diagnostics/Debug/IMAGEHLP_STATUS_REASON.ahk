#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_STATUS_REASON{

    /**
     * @type {Integer (Int32)}
     */
    static BindOutOfMemory => 0

    /**
     * @type {Integer (Int32)}
     */
    static BindRvaToVaFailed => 1

    /**
     * @type {Integer (Int32)}
     */
    static BindNoRoomInImage => 2

    /**
     * @type {Integer (Int32)}
     */
    static BindImportModuleFailed => 3

    /**
     * @type {Integer (Int32)}
     */
    static BindImportProcedureFailed => 4

    /**
     * @type {Integer (Int32)}
     */
    static BindImportModule => 5

    /**
     * @type {Integer (Int32)}
     */
    static BindImportProcedure => 6

    /**
     * @type {Integer (Int32)}
     */
    static BindForwarder => 7

    /**
     * @type {Integer (Int32)}
     */
    static BindForwarderNOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static BindImageModified => 9

    /**
     * @type {Integer (Int32)}
     */
    static BindExpandFileHeaders => 10

    /**
     * @type {Integer (Int32)}
     */
    static BindImageComplete => 11

    /**
     * @type {Integer (Int32)}
     */
    static BindMismatchedSymbols => 12

    /**
     * @type {Integer (Int32)}
     */
    static BindSymbolsNotUpdated => 13

    /**
     * @type {Integer (Int32)}
     */
    static BindImportProcedure32 => 14

    /**
     * @type {Integer (Int32)}
     */
    static BindImportProcedure64 => 15

    /**
     * @type {Integer (Int32)}
     */
    static BindForwarder32 => 16

    /**
     * @type {Integer (Int32)}
     */
    static BindForwarder64 => 17

    /**
     * @type {Integer (Int32)}
     */
    static BindForwarderNOT32 => 18

    /**
     * @type {Integer (Int32)}
     */
    static BindForwarderNOT64 => 19
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Learn more about: JET_ERRCAT enumeration
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-errcat-enumeration
 * @namespace Windows.Win32.Storage.Jet
 */
class JET_ERRCAT extends Win32Enum {

    /**
     * Native name: JET_errcatUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: JET_errcatError
     * @type {Integer (Int32)}
     */
    static Error => 1

    /**
     * Native name: JET_errcatOperation
     * @type {Integer (Int32)}
     */
    static Operation => 2

    /**
     * Native name: JET_errcatFatal
     * @type {Integer (Int32)}
     */
    static Fatal => 3

    /**
     * Native name: JET_errcatIO
     * @type {Integer (Int32)}
     */
    static errcatIO => 4

    /**
     * Native name: JET_errcatResource
     * @type {Integer (Int32)}
     */
    static Resource => 5

    /**
     * Native name: JET_errcatMemory
     * @type {Integer (Int32)}
     */
    static Memory => 6

    /**
     * Native name: JET_errcatQuota
     * @type {Integer (Int32)}
     */
    static Quota => 7

    /**
     * Native name: JET_errcatDisk
     * @type {Integer (Int32)}
     */
    static Disk => 8

    /**
     * Native name: JET_errcatData
     * @type {Integer (Int32)}
     */
    static Data => 9

    /**
     * Native name: JET_errcatCorruption
     * @type {Integer (Int32)}
     */
    static Corruption => 10

    /**
     * Native name: JET_errcatInconsistent
     * @type {Integer (Int32)}
     */
    static Inconsistent => 11

    /**
     * Native name: JET_errcatFragmentation
     * @type {Integer (Int32)}
     */
    static Fragmentation => 12

    /**
     * Native name: JET_errcatApi
     * @type {Integer (Int32)}
     */
    static Api => 13

    /**
     * Native name: JET_errcatUsage
     * @type {Integer (Int32)}
     */
    static Usage => 14

    /**
     * Native name: JET_errcatState
     * @type {Integer (Int32)}
     */
    static State => 15

    /**
     * Native name: JET_errcatObsolete
     * @type {Integer (Int32)}
     */
    static Obsolete => 16

    /**
     * Native name: JET_errcatMax
     * @type {Integer (Int32)}
     */
    static Max => 17
}

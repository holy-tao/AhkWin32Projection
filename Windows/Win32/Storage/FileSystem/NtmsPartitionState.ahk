#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsPartitionState extends Win32Enum {

    /**
     * Native name: NTMS_PARTSTATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static PARTSTATE_UNKNOWN => 0

    /**
     * Native name: NTMS_PARTSTATE_UNPREPARED
     * @type {Integer (Int32)}
     */
    static PARTSTATE_UNPREPARED => 1

    /**
     * Native name: NTMS_PARTSTATE_INCOMPATIBLE
     * @type {Integer (Int32)}
     */
    static PARTSTATE_INCOMPATIBLE => 2

    /**
     * Native name: NTMS_PARTSTATE_DECOMMISSIONED
     * @type {Integer (Int32)}
     */
    static PARTSTATE_DECOMMISSIONED => 3

    /**
     * Native name: NTMS_PARTSTATE_AVAILABLE
     * @type {Integer (Int32)}
     */
    static PARTSTATE_AVAILABLE => 4

    /**
     * Native name: NTMS_PARTSTATE_ALLOCATED
     * @type {Integer (Int32)}
     */
    static PARTSTATE_ALLOCATED => 5

    /**
     * Native name: NTMS_PARTSTATE_COMPLETE
     * @type {Integer (Int32)}
     */
    static PARTSTATE_COMPLETE => 6

    /**
     * Native name: NTMS_PARTSTATE_FOREIGN
     * @type {Integer (Int32)}
     */
    static PARTSTATE_FOREIGN => 7

    /**
     * Native name: NTMS_PARTSTATE_IMPORT
     * @type {Integer (Int32)}
     */
    static PARTSTATE_IMPORT => 8

    /**
     * Native name: NTMS_PARTSTATE_RESERVED
     * @type {Integer (Int32)}
     */
    static PARTSTATE_RESERVED => 9
}

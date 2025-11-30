#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsPartitionState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_UNPREPARED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_INCOMPATIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_DECOMMISSIONED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_AVAILABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_ALLOCATED => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_COMPLETE => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_FOREIGN => 7

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_IMPORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_PARTSTATE_RESERVED => 9
}

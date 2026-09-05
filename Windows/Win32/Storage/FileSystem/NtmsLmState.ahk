#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsLmState extends Win32Enum {

    /**
     * Native name: NTMS_LM_QUEUED
     * @type {Integer (Int32)}
     */
    static QUEUED => 0

    /**
     * Native name: NTMS_LM_INPROCESS
     * @type {Integer (Int32)}
     */
    static INPROCESS => 1

    /**
     * Native name: NTMS_LM_PASSED
     * @type {Integer (Int32)}
     */
    static PASSED => 2

    /**
     * Native name: NTMS_LM_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 3

    /**
     * Native name: NTMS_LM_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 4

    /**
     * Native name: NTMS_LM_WAITING
     * @type {Integer (Int32)}
     */
    static WAITING => 5

    /**
     * Native name: NTMS_LM_DEFERRED
     * @type {Integer (Int32)}
     */
    static DEFERRED => 6

    /**
     * Native name: NTMS_LM_DEFFERED
     * @type {Integer (Int32)}
     */
    static DEFFERED => 6

    /**
     * Native name: NTMS_LM_CANCELLED
     * @type {Integer (Int32)}
     */
    static CANCELLED => 7

    /**
     * Native name: NTMS_LM_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 8
}

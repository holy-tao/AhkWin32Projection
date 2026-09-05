#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsAsyncStatus extends Win32Enum {

    /**
     * Native name: NTMS_ASYNCSTATE_QUEUED
     * @type {Integer (Int32)}
     */
    static ASYNCSTATE_QUEUED => 0

    /**
     * Native name: NTMS_ASYNCSTATE_WAIT_RESOURCE
     * @type {Integer (Int32)}
     */
    static ASYNCSTATE_WAIT_RESOURCE => 1

    /**
     * Native name: NTMS_ASYNCSTATE_WAIT_OPERATOR
     * @type {Integer (Int32)}
     */
    static ASYNCSTATE_WAIT_OPERATOR => 2

    /**
     * Native name: NTMS_ASYNCSTATE_INPROCESS
     * @type {Integer (Int32)}
     */
    static ASYNCSTATE_INPROCESS => 3

    /**
     * Native name: NTMS_ASYNCSTATE_COMPLETE
     * @type {Integer (Int32)}
     */
    static ASYNCSTATE_COMPLETE => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
class PIDMSI_STATUS_VALUE extends Win32Enum {

    /**
     * Native name: PIDMSI_STATUS_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: PIDMSI_STATUS_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 1

    /**
     * Native name: PIDMSI_STATUS_PRELIM
     * @type {Integer (Int32)}
     */
    static PRELIM => 2

    /**
     * Native name: PIDMSI_STATUS_DRAFT
     * @type {Integer (Int32)}
     */
    static DRAFT => 3

    /**
     * Native name: PIDMSI_STATUS_INPROGRESS
     * @type {Integer (Int32)}
     */
    static INPROGRESS => 4

    /**
     * Native name: PIDMSI_STATUS_EDIT
     * @type {Integer (Int32)}
     */
    static EDIT => 5

    /**
     * Native name: PIDMSI_STATUS_REVIEW
     * @type {Integer (Int32)}
     */
    static REVIEW => 6

    /**
     * Native name: PIDMSI_STATUS_PROOF
     * @type {Integer (Int32)}
     */
    static PROOF => 7

    /**
     * Native name: PIDMSI_STATUS_FINAL
     * @type {Integer (Int32)}
     */
    static FINAL => 8

    /**
     * Native name: PIDMSI_STATUS_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 32767
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class PrintJobStatus extends Win32Enum {

    /**
     * Native name: PrintJobStatus_Paused
     * @type {Integer (Int32)}
     */
    static Paused => 1

    /**
     * Native name: PrintJobStatus_Error
     * @type {Integer (Int32)}
     */
    static Error => 2

    /**
     * Native name: PrintJobStatus_Deleting
     * @type {Integer (Int32)}
     */
    static Deleting => 4

    /**
     * Native name: PrintJobStatus_Spooling
     * @type {Integer (Int32)}
     */
    static Spooling => 8

    /**
     * Native name: PrintJobStatus_Printing
     * @type {Integer (Int32)}
     */
    static Printing => 16

    /**
     * Native name: PrintJobStatus_Offline
     * @type {Integer (Int32)}
     */
    static Offline => 32

    /**
     * Native name: PrintJobStatus_PaperOut
     * @type {Integer (Int32)}
     */
    static PaperOut => 64

    /**
     * Native name: PrintJobStatus_Printed
     * @type {Integer (Int32)}
     */
    static Printed => 128

    /**
     * Native name: PrintJobStatus_Deleted
     * @type {Integer (Int32)}
     */
    static Deleted => 256

    /**
     * Native name: PrintJobStatus_BlockedDeviceQueue
     * @type {Integer (Int32)}
     */
    static BlockedDeviceQueue => 512

    /**
     * Native name: PrintJobStatus_UserIntervention
     * @type {Integer (Int32)}
     */
    static UserIntervention => 1024

    /**
     * Native name: PrintJobStatus_Restarted
     * @type {Integer (Int32)}
     */
    static Restarted => 2048

    /**
     * Native name: PrintJobStatus_Complete
     * @type {Integer (Int32)}
     */
    static Complete => 4096

    /**
     * Native name: PrintJobStatus_Retained
     * @type {Integer (Int32)}
     */
    static Retained => 8192
}

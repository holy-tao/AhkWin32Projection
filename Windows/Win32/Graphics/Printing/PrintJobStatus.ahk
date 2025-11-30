#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PrintJobStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Paused => 1

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Error => 2

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Deleting => 4

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Spooling => 8

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Printing => 16

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Offline => 32

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_PaperOut => 64

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Printed => 128

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Deleted => 256

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_BlockedDeviceQueue => 512

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_UserIntervention => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Restarted => 2048

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Complete => 4096

    /**
     * @type {Integer (Int32)}
     */
    static PrintJobStatus_Retained => 8192
}

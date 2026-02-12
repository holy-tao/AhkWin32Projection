#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of the [Print3DWorkflow](print3dworkflow.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.print3dworkflowstatus
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class Print3DWorkflowStatus extends Win32Enum{

    /**
     * The printing experience has been abandoned.
     * @type {Integer (Int32)}
     */
    static Abandoned => 0

    /**
     * The printing experience has been canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 1

    /**
     * The print request failed.
     * @type {Integer (Int32)}
     */
    static Failed => 2

    /**
     * The object is undergoing slicing in preparation for printing.
     * @type {Integer (Int32)}
     */
    static Slicing => 3

    /**
     * The print request has been submitted.
     * @type {Integer (Int32)}
     */
    static Submitted => 4
}

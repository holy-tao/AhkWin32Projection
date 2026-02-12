#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the completion status of a 3D print request.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtaskcompletion
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskCompletion extends Win32Enum{

    /**
     * The request has been abandoned.
     * @type {Integer (Int32)}
     */
    static Abandoned => 0

    /**
     * The request has been cancelled.
     * @type {Integer (Int32)}
     */
    static Canceled => 1

    /**
     * The request has failed.
     * @type {Integer (Int32)}
     */
    static Failed => 2

    /**
     * The driver is preparing layer by layer slices of the 3D model for the printer.
     * @type {Integer (Int32)}
     */
    static Slicing => 3

    /**
     * The request has been submitted successfully.
     * @type {Integer (Int32)}
     */
    static Submitted => 4
}

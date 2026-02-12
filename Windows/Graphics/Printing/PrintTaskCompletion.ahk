#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the completion status of a print task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskcompletion
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskCompletion extends Win32Enum{

    /**
     * An abandoned print task.
     * @type {Integer (Int32)}
     */
    static Abandoned => 0

    /**
     * A canceled print task.
     * @type {Integer (Int32)}
     */
    static Canceled => 1

    /**
     * A failed print task.
     * @type {Integer (Int32)}
     */
    static Failed => 2

    /**
     * A submitted print task.
     * @type {Integer (Int32)}
     */
    static Submitted => 3
}

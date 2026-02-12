#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the print task option states.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printoptionstates
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintOptionStates extends Win32BitflagEnum{

    /**
     * The UI for the print tasks has not been enabled.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The UI for the print tasks has been enabled.
     * @type {Integer (UInt32)}
     */
    static Enabled => 1

    /**
     * The UI for the print tasks is visible to the user.
     * @type {Integer (UInt32)}
     */
    static Constrained => 2
}

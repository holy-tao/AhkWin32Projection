#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the print task option types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.printoptiontype
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class PrintOptionType extends Win32Enum{

    /**
     * Unknown option type.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A type of option that is numerical.
     * @type {Integer (Int32)}
     */
    static Number => 1

    /**
     * A type of option that is a string or some text.
     * @type {Integer (Int32)}
     */
    static Text => 2

    /**
     * A type of option that is a list of items.
     * @type {Integer (Int32)}
     */
    static ItemList => 3

    /**
     * A type of option that is a toggle.
     * @type {Integer (Int32)}
     */
    static Toggle => 4
}

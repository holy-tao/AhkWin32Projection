#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The class of a Gip message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipmessageclass
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class GipMessageClass extends Win32Enum{

    /**
     * A command message.
     * @type {Integer (Int32)}
     */
    static Command => 0

    /**
     * A low latency message.
     * @type {Integer (Int32)}
     */
    static LowLatency => 1

    /**
     * A standard latency message.
     * @type {Integer (Int32)}
     */
    static StandardLatency => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the buffering method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolbufferingmethod
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class IOControlBufferingMethod extends Win32Enum{

    /**
     * Buffered.
     * @type {Integer (Int32)}
     */
    static Buffered => 0

    /**
     * Direct input.
     * @type {Integer (Int32)}
     */
    static DirectInput => 1

    /**
     * Direct output.
     * @type {Integer (Int32)}
     */
    static DirectOutput => 2

    /**
     * Neither.
     * @type {Integer (Int32)}
     */
    static Neither => 3
}

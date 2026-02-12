#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of dual tone multi-frequency (DTMF) used by a cellular phone.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.cellulardtmfmode
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class CellularDtmfMode extends Win32Enum{

    /**
     * Tones are sent in a continuous fashion, meaning the tone should only stop when the button is released.
     * @type {Integer (Int32)}
     */
    static Continuous => 0

    /**
     * Tones are sent in a burst fashion.
     * @type {Integer (Int32)}
     */
    static Burst => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether or not playback of dual tone multi-frequency (DTMF) audio on the local device is desired.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.dtmftoneaudioplayback
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class DtmfToneAudioPlayback extends Win32Enum{

    /**
     * Specifies that playback should happen.
     * @type {Integer (Int32)}
     */
    static Play => 0

    /**
     * Specifies that playback should *not* happen.
     * @type {Integer (Int32)}
     */
    static DoNotPlay => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the frequency of a TV tuner (cable or antenna). (TunerInputType)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-tunerinputtype
 * @namespace Windows.Win32.Media.DirectShow
 */
class TunerInputType extends Win32Enum {

    /**
     * Indicates cable frequency.
     * Native name: TunerInputCable
     * @type {Integer (Int32)}
     */
    static Cable => 0

    /**
     * Indicates broadcast antenna frequency.
     * Native name: TunerInputAntenna
     * @type {Integer (Int32)}
     */
    static Antenna => 1
}

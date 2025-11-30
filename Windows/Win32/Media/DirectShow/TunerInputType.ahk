#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the frequency of a TV tuner (cable or antenna).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-tunerinputtype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class TunerInputType extends Win32Enum{

    /**
     * Indicates cable frequency.
     * @type {Integer (Int32)}
     */
    static TunerInputCable => 0

    /**
     * Indicates broadcast antenna frequency.
     * @type {Integer (Int32)}
     */
    static TunerInputAntenna => 1
}

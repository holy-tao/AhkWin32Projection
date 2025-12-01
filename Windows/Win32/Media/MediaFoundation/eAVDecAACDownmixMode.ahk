#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether an AAC decoder uses standard MPEG-2/MPEG-4 stereo downmix equations.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecaacdownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecAACDownmixMode extends Win32Enum{

    /**
     * Use the standard ISO MPEG-2/MPEG-4 downmix equations.
     * @type {Integer (Int32)}
     */
    static eAVDecAACUseISODownmix => 0

    /**
     * Use the downmix equations defined by ARIB document STD-B21.
     * @type {Integer (Int32)}
     */
    static eAVDecAACUseARIBDownmix => 1
}

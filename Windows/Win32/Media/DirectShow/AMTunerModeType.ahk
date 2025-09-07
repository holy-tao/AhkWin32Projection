#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the frequency of a TV tuner (cable or antenna). (AMTunerModeType)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-amtunermodetype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMTunerModeType{

    /**
     * Indicates default tuner mode.
     * @type {Integer (Int32)}
     */
    static AMTUNER_MODE_DEFAULT => 0

    /**
     * Indicates TV tuner mode.
     * @type {Integer (Int32)}
     */
    static AMTUNER_MODE_TV => 1

    /**
     * Indicates FM radio tuner mode.
     * @type {Integer (Int32)}
     */
    static AMTUNER_MODE_FM_RADIO => 2

    /**
     * Indicates AM radio tuner mode.
     * @type {Integer (Int32)}
     */
    static AMTUNER_MODE_AM_RADIO => 4

    /**
     * Indicates Digital Satellite Service (DSS) tuner mode.
     * @type {Integer (Int32)}
     */
    static AMTUNER_MODE_DSS => 8
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the frequency of a TV tuner (cable or antenna). (AMTunerModeType)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-amtunermodetype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMTunerModeType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

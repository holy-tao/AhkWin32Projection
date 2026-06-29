#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the frequency of a TV tuner (cable or antenna). (TunerInputType)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-tunerinputtype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct TunerInputType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

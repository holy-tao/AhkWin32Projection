#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether an AAC decoder uses standard MPEG-2/MPEG-4 stereo downmix equations.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecaacdownmixmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecAACDownmixMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

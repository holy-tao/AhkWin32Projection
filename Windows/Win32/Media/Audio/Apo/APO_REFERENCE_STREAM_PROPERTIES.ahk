#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_REFERENCE_STREAM_PROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static APO_REFERENCE_STREAM_PROPERTIES_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static APO_REFERENCE_STREAM_PROPERTIES_POST_VOLUME_LOOPBACK => 1
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates one of several stock directivity patterns.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ne-hrtfapoapi-hrtfdirectivitytype
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfDirectivityType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The sound emission is in all directions.
     * @type {Integer (Int32)}
     */
    static OmniDirectional => 0

    /**
     * The sound emission is a cardioid shape.
     * @type {Integer (Int32)}
     */
    static Cardioid => 1

    /**
     * The sound emission is a cone.
     * @type {Integer (Int32)}
     */
    static Cone => 2
}

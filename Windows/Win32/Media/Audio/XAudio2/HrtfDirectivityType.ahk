#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates one of several stock directivity patterns.
 * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/ne-hrtfapoapi-hrtfdirectivitytype
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfDirectivityType{

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

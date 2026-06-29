#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the orientation of an HRTF directivity object.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtforientation
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfOrientation {
    #StructPack 4

    /**
     * The orientation. This is a row-major 3x3 rotation matrix.
     */
    element : Float32[9]

}

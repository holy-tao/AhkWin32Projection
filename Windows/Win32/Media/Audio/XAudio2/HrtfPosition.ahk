#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a position in 3D space, using a right-handed coordinate system.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfposition
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfPosition {
    #StructPack 4

    x : Float32

    y : Float32

    z : Float32

}

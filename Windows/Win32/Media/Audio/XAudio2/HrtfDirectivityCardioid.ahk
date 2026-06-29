#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HrtfDirectivityType.ahk" { HrtfDirectivityType }
#Import ".\HrtfDirectivity.ahk" { HrtfDirectivity }

/**
 * Describes a cardioid directivity pattern.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfdirectivitycardioid
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfDirectivityCardioid {
    #StructPack 4

    /**
     * Descriptor for the cardioid pattern. The type parameter must be set to HrtfDirectivityType.Cardioid.
     */
    directivity : HrtfDirectivity

    /**
     * Controls the shape of the cardioid. The higher order the shape, the narrower it is. Must be greater than 0 and less than or equal to 32.
     */
    order : Float32

}

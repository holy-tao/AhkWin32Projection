#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HrtfDirectivityType.ahk" { HrtfDirectivityType }
#Import ".\HrtfDirectivity.ahk" { HrtfDirectivity }

/**
 * Describes a cone directivity.
 * @remarks
 * Attenuation is 0 inside the inner cone.   Attenuation is linearly interpolated between the inner cone, which is defined by <i>innerAngle</i>, and the outer cone, which is defined by <i>outerAngle.</i>
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfdirectivitycone
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfDirectivityCone {
    #StructPack 4

    /**
     * Descriptor for the cone pattern. The type parameter must be set to HrtfDirectivityType.Cone.
     */
    directivity : HrtfDirectivity

    /**
     * Angle, in radians, that defines the inner cone. Must be between 0 and 2 * pi.
     */
    innerAngle : Float32

    /**
     * Angle, in radians, that defines the outer cone. Must be between 0 and 2 * pi.
     */
    outerAngle : Float32

}

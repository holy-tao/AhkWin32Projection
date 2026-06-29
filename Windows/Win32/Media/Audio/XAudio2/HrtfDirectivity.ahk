#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HrtfDirectivityType.ahk" { HrtfDirectivityType }

/**
 * Base directivity pattern descriptor. Describes the type of directivity applied to a sound.
 * @remarks
 * The scaling parameter is used to interpolate between directivity behavior and omnidirectional; it determines how much attenuation is applied to the source outside of the directivity pattern and controls how directional the source is.
 * 
 * For fully directional sources, while direct path signal outside the directivity pattern will be fully attenuated, any environmental reflections will still be audible.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfdirectivity
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfDirectivity {
    #StructPack 4

    /**
     * Indicates the type of directivity.
     */
    type : HrtfDirectivityType

    /**
     * A normalized value between zero and one. Specifies the amount of linear interpolation between omnidirectional sound and the full directivity pattern, where 0 is fully omnidirectional and 1 is fully directional.
     */
    scaling : Float32

}

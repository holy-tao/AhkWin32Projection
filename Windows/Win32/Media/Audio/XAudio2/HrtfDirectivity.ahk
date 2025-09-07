#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Base directivity pattern descriptor. Describes the type of directivity applied to a sound.
 * @remarks
 * The scaling parameter is used to interpolate between directivity behavior and omnidirectional; it determines how much attenuation is applied to the source outside of the directivity pattern and controls how directional the source is.
  * 
  * For fully directional sources, while direct path signal outside the directivity pattern will be fully attenuated, any environmental reflections will still be audible.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfdirectivity
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfDirectivity extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Indicates the type of directivity.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A normalized value between zero and one. Specifies the amount of linear interpolation between omnidirectional sound and the full directivity pattern, where 0 is fully omnidirectional and 1 is fully directional.
     * @type {Float}
     */
    scaling {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}

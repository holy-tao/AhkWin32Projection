#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\HrtfDirectivity.ahk

/**
 * Describes a cone directivity.
 * @remarks
 * 
 * Attenuation is 0 inside the inner cone.   Attenuation is linearly interpolated between the inner cone, which is defined by <i>innerAngle</i>, and the outer cone, which is defined by <i>outerAngle.</i>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/ns-hrtfapoapi-hrtfdirectivitycone
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfDirectivityCone extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Descriptor for the cone pattern. The type parameter must be set to HrtfDirectivityType.Cone.
     * @type {HrtfDirectivity}
     */
    directivity{
        get {
            if(!this.HasProp("__directivity"))
                this.__directivity := HrtfDirectivity(0, this)
            return this.__directivity
        }
    }

    /**
     * Angle, in radians, that defines the inner cone. Must be between 0 and 2 * pi.
     * @type {Float}
     */
    innerAngle {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Angle, in radians, that defines the outer cone. Must be between 0 and 2 * pi.
     * @type {Float}
     */
    outerAngle {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}

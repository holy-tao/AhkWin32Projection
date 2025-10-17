#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\HrtfDirectivity.ahk

/**
 * Describes a cardioid directivity pattern.
 * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/ns-hrtfapoapi-hrtfdirectivitycardioid
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfDirectivityCardioid extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Descriptor for the cardioid pattern. The type parameter must be set to HrtfDirectivityType.Cardioid.
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
     * Controls the shape of the cardioid. The higher order the shape, the narrower it is. Must be greater than 0 and less than or equal to 32.
     * @type {Float}
     */
    order {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}

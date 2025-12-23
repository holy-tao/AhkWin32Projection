#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SpatialAudioHrtfDirectivity.ahk
#Include .\SpatialAudioHrtfDirectivityCone.ahk
#Include .\SpatialAudioHrtfDirectivityCardioid.ahk

/**
 * Defines a spatial audio directivity model for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivityunion
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfDirectivityUnion extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * A cone-shaped directivity model
     * @type {SpatialAudioHrtfDirectivityCone}
     */
    Cone{
        get {
            if(!this.HasProp("__Cone"))
                this.__Cone := SpatialAudioHrtfDirectivityCone(0, this)
            return this.__Cone
        }
    }

    /**
     * @type {SpatialAudioHrtfDirectivityCardioid}
     */
    Cardiod{
        get {
            if(!this.HasProp("__Cardiod"))
                this.__Cardiod := SpatialAudioHrtfDirectivityCardioid(0, this)
            return this.__Cardiod
        }
    }

    /**
     * And omni-direction directivity model that can be interpolated linearly with one of the other directivity models.
     * @type {SpatialAudioHrtfDirectivity}
     */
    Omni{
        get {
            if(!this.HasProp("__Omni"))
                this.__Omni := SpatialAudioHrtfDirectivity(0, this)
            return this.__Omni
        }
    }
}

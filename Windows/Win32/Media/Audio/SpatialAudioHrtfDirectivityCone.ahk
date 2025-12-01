#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SpatialAudioHrtfDirectivity.ahk

/**
 * Represents a cone-shaped directivity model for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivitycone
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfDirectivityCone extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A structure that expresses the direction in which sound is emitted by an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a>.
     * @type {SpatialAudioHrtfDirectivity}
     */
    directivity{
        get {
            if(!this.HasProp("__directivity"))
                this.__directivity := SpatialAudioHrtfDirectivity(0, this)
            return this.__directivity
        }
    }

    /**
     * The inner angle of the cone.
     * @type {Float}
     */
    InnerAngle {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The outer angle of the cone.
     * @type {Float}
     */
    OuterAngle {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}

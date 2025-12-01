#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SpatialAudioHrtfDirectivity.ahk

/**
 * Represents a cardioid-shaped directivity model for an ISpatialAudioObjectForHrtf.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivitycardioid
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfDirectivityCardioid extends Win32Struct
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
     * The order of the cardioid.
     * @type {Float}
     */
    Order {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}

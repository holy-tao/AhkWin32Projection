#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an omnidirectional model for an ISpatialAudioObjectForHrtf. The omnidirectional emission is interpolated linearly with the directivity model specified in the Type field based on the value of the Scaling field.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdirectivity
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfDirectivity extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of shape in which sound is emitted by an <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf">ISpatialAudioObjectForHrtf</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The amount of linear interpolation applied between omnidirectional sound and the directivity specified in the <b>Type</b> field. This is a normalized value between 0 and 1.0 where 0 is omnidirectional and 1.0 is full directivity using the specified type.
     * @type {Float}
     */
    Scaling {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}

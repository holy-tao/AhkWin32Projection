#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the cross-slide threshold and its distance threshold.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ns-interactioncontext-cross_slide_parameter
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class CROSS_SLIDE_PARAMETER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-cross_slide_threshold">CROSS_SLIDE_THRESHOLD</a>.
     * @type {Integer}
     */
    threshold {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The <i>threshold</i> distance, in DIPs.
     * @type {Float}
     */
    distance {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the state of the cross-slide interaction.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ns-interactioncontext-interaction_arguments_cross_slide
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_ARGUMENTS_CROSS_SLIDE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-cross_slide_flags">CROSS_SLIDE_FLAGS</a>.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

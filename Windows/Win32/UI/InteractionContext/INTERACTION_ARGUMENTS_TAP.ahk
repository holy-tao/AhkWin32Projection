#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the state of the tap interaction.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ns-interactioncontext-interaction_arguments_tap
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_ARGUMENTS_TAP extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The number of taps detected.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

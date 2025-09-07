#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_stack_key32
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_STACK_KEY32 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A unique identifier that you use to match the kernel-mode calls to the user-mode calls; the kernel-mode calls and user-mode calls are captured in separate events if the environment prevents both from being captured in the same event. If the kernel-mode and user-mode calls were captured in the same event, the value is zero.
     * 
     * Typically, on 32-bit computers, you can always capture both the kernel-mode and user-mode calls in the same event. However, if you use the frame pointer optimization compiler option, the stack may not be captured, captured incorrectly, or truncated.
     * @type {Integer}
     */
    MatchId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The key.
     * @type {Integer}
     */
    StackKey {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The key padding.
     * @type {Integer}
     */
    Padding {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

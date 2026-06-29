#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_stack_key64
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_STACK_KEY64 {
    #StructPack 8

    /**
     * A unique identifier that you use to match the kernel-mode calls to the user-mode calls; the kernel-mode calls and user-mode calls are captured in separate events if the environment prevents both from being captured in the same event. If the kernel-mode and user-mode calls were captured in the same event, the value is zero.
     */
    MatchId : Int64

    /**
     * The key.
     */
    StackKey : Int64

}

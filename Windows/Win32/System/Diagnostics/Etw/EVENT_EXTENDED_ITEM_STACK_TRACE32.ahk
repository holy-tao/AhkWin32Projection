#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a call stack on a 32-bit computer.
 * @remarks
 * The <b>DataSize</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header_extended_data_item">EVENT_HEADER_EXTENDED_DATA_ITEM</a> contains the size of this structure. To determine the number of addresses in the array, subtract <c>sizeof(ULONG64)</code> from <b>DataSize</b> and then divide by <code>sizeof(ULONG)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_stack_trace32
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_STACK_TRACE32 {
    #StructPack 8

    /**
     * A unique identifier that you use to match the kernel-mode calls to the user-mode calls; the kernel-mode calls and user-mode calls are captured in separate events if the environment prevents both from being captured in the same event. If the kernel-mode and user-mode calls were captured in the same event, the value is zero.
     * 
     * Typically, on 32-bit computers, you can always capture both the kernel-mode and user-mode calls in the same event. However, if you use the frame pointer optimization compiler option, the stack may not be captured, captured incorrectly, or truncated.
     */
    MatchId : Int64

    /**
     * An array of call addresses on the stack.
     */
    Address : UInt32[1]

}

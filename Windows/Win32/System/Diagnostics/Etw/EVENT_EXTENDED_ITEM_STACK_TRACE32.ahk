#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines a call stack on a 32-bit computer.
 * @remarks
 * The <b>DataSize</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header_extended_data_item">EVENT_HEADER_EXTENDED_DATA_ITEM</a> contains the size of this structure. To determine the number of addresses in the array, subtract <c>sizeof(ULONG64)</code> from <b>DataSize</b> and then divide by <code>sizeof(ULONG)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_stack_trace32
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_STACK_TRACE32 extends Win32Struct
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
     * An array of call addresses on the stack.
     * @type {Array<UInt32>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__AddressProxyArray
        }
    }
}

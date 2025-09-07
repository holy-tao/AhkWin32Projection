#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Information that is used by kernel debuggers to trace through user-mode callbacks in a thread's kernel stack. (KDHELP)
 * @remarks
 * This structure supersedes the <b>KDHELP</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>KDHELP</b> is defined as follows in Dbghelp.h. 
  * 
  * 
  * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-kdhelp
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class KDHELP extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * The address of the kernel thread object, as provided in the WAIT_STATE_CHANGE packet.
     * @type {Integer}
     */
    Thread {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The offset in the thread object to the pointer to the current callback frame in the kernel stack.
     * @type {Integer}
     */
    ThCallbackStack {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The address of the next callback frame.
     * @type {Integer}
     */
    NextCallback {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The address of the saved frame pointer, if applicable.
     * @type {Integer}
     */
    FramePointer {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The address of the kernel function that calls out to user mode.
     * @type {Integer}
     */
    KiCallUserMode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The address of the user-mode dispatcher function.
     * @type {Integer}
     */
    KeUserCallbackDispatcher {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The lowest kernel-mode address.
     * @type {Integer}
     */
    SystemRangeStart {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <b>Intel Itanium:  </b>The offset in the thread object to a pointer to the current callback backing store frame in the kernel stack.
     * @type {Integer}
     */
    ThCallbackBStore {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The address of the user-mode exception dispatcher function.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     * @type {Integer}
     */
    KiUserExceptionDispatcher {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The address of the stack base.
     * @type {Integer}
     */
    StackBase {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The stack limit.
     * @type {Integer}
     */
    StackLimit {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * This member is reserved for use by the operating system.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 44, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}

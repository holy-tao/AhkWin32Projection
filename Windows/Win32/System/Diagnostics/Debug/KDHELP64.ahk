#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Information that is used by kernel debuggers to trace through user-mode callbacks in a thread's kernel stack. (KDHELP64)
 * @remarks
 * This structure supersedes the <b>KDHELP</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>KDHELP</b> is defined as follows in Dbghelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-kdhelp64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct KDHELP64 {
    #StructPack 8

    /**
     * The address of the kernel thread object, as provided in the WAIT_STATE_CHANGE packet.
     */
    Thread : Int64

    /**
     * The offset in the thread object to the pointer to the current callback frame in the kernel stack.
     */
    ThCallbackStack : UInt32

    /**
     * <b>Intel Itanium:  </b>The offset in the thread object to a pointer to the current callback backing store frame in the kernel stack.
     */
    ThCallbackBStore : UInt32

    /**
     * The address of the next callback frame.
     */
    NextCallback : UInt32

    /**
     * The address of the saved frame pointer, if applicable.
     */
    FramePointer : UInt32

    /**
     * The address of the kernel function that calls out to user mode.
     */
    KiCallUserMode : Int64

    /**
     * The address of the user-mode dispatcher function.
     */
    KeUserCallbackDispatcher : Int64

    /**
     * The lowest kernel-mode address.
     */
    SystemRangeStart : Int64

    /**
     * The address of the user-mode exception dispatcher function.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     */
    KiUserExceptionDispatcher : Int64

    /**
     * The address of the stack base.
     */
    StackBase : Int64

    /**
     * The stack limit.
     */
    StackLimit : Int64

    /**
     * TBD
     */
    BuildVersion : UInt32

    /**
     * TBD
     */
    RetpolineStubFunctionTableSize : UInt32

    /**
     * TBD
     */
    RetpolineStubFunctionTable : Int64

    /**
     * TBD
     */
    RetpolineStubOffset : UInt32

    /**
     * TBD
     */
    RetpolineStubSize : UInt32

    /**
     * This member is reserved for use by the operating system.
     */
    Reserved0 : Int64[2]

}

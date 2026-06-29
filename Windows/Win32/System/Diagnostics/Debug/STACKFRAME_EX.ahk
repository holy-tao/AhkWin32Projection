#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KDHELP64.ahk" { KDHELP64 }
#Import ".\ADDRESS64.ahk" { ADDRESS64 }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ADDRESS_MODE.ahk" { ADDRESS_MODE }

/**
 * Represents an extended stack frame.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-stackframe_ex
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct STACKFRAME_EX {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies the program 
     *       counter.
     *       
     * 
     * <b>x86:  </b>The program counter is EIP.
     * 
     * <b>Intel Itanium:  </b>The program counter is StIIP.
     * 
     * <b>x64:  </b>The program counter is RIP.
     */
    AddrPC : ADDRESS64

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies 
     *       the return address.
     */
    AddrReturn : ADDRESS64

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies 
     *       the frame pointer.
     *       
     * 
     * <b>x86:  </b>The frame pointer is EBP.
     * 
     * <b>Intel Itanium:  </b>There is no frame pointer, but <b>AddrBStore</b> is used.
     * 
     * <b>x64:  </b>The frame pointer is RBP or RDI. This value is not always used.
     */
    AddrFrame : ADDRESS64

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies 
     *       the stack pointer.
     *       
     * 
     * <b>x86:  </b>The stack pointer is ESP.
     * 
     * <b>Intel Itanium:  </b>The stack pointer is SP.
     * 
     * <b>x64:  </b>The stack pointer is RSP.
     */
    AddrStack : ADDRESS64

    /**
     * <b>Intel Itanium:  </b>An <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies 
     *         the backing store (RsBSP).
     */
    AddrBStore : ADDRESS64

    /**
     * On x86 computers, this member is an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> 
     *       structure. If there is no function table entry, this member is <b>NULL</b>.
     */
    FuncTableEntry : IntPtr

    /**
     * The possible arguments to the function.
     */
    Params : Int64[4]

    /**
     * This member is <b>TRUE</b> if this is a WOW far call.
     */
    Far : BOOL

    /**
     * This member is <b>TRUE</b> if this is a virtual frame.
     */
    Virtual : BOOL

    /**
     * This member is used internally by the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalkex">StackWalkEx</a> 
     *       function.
     */
    Reserved : Int64[3]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-kdhelp">KDHELP64</a> structure that specifies helper data for 
     *       walking kernel callback frames.
     */
    KdHelp : KDHELP64

    /**
     * Set to <c>sizeof(STACKFRAME_EX)</c>.
     */
    StackFrameSize : UInt32

    /**
     * Specifies the type of the inline frame context.
     */
    InlineFrameContext : UInt32

}

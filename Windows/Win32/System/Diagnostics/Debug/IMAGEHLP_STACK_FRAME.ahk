#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the stack frame information.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_stack_frame
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_STACK_FRAME {
    #StructPack 8

    /**
     * The program counter. 
     * 
     * 
     * 
     * 
     * <b>x86:  </b>The program counter is EIP.
     * 
     * <b>Intel Itanium:  </b>The program counter is a combination of the bundle address and a slot indicator of 0, 4, or 8 for the slot within the bundle.
     * 
     * <b>x64:  </b>The program counter is RIP.
     */
    InstructionOffset : Int64

    /**
     * The return address.
     */
    ReturnOffset : Int64

    /**
     * The frame pointer. 
     * 
     * 
     * 
     * 
     * <b>x86:  </b>The frame pointer is EBP.
     * 
     * <b>Intel Itanium:  </b>There is no frame pointer, but <b>AddrBStore</b> is used.
     * 
     * <b>x64:  </b>The frame pointer is RBP. AMD-64 does not always use this value.
     */
    FrameOffset : Int64

    /**
     * The stack pointer. 
     * 
     * 
     * 
     * 
     * <b>x86:  </b>The stack pointer is ESP.
     * 
     * <b>Intel Itanium:  </b>The stack pointer is SP.
     * 
     * <b>x64:  </b>The stack pointer is RSP.
     */
    StackOffset : Int64

    /**
     * <b>Intel Itanium:  </b>The backing store address.
     */
    BackingStoreOffset : Int64

    /**
     * <b>x86:  </b>An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> structure. If there is no function table entry, this member is <b>NULL</b>.
     */
    FuncTableEntry : Int64

    /**
     * The possible arguments to the function.
     */
    Params : Int64[4]

    /**
     * This member is reserved for system use.
     */
    Reserved : Int64[5]

    /**
     * If this is a virtual frame, this member is <b>TRUE</b>. Otherwise, this member is <b>FALSE</b>.
     */
    Virtual : BOOL

    /**
     * This member is reserved for system use.
     */
    Reserved2 : UInt32

}

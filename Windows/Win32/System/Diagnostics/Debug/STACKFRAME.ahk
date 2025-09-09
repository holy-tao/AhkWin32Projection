#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ADDRESS.ahk
#Include .\KDHELP.ahk

/**
 * Represents a stack frame. (STACKFRAME)
 * @remarks
 * This structure supersedes the <b>STACKFRAME</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>STACKFRAME</b> is defined as follows in Dbghelp.h. 
  * 
  * 
  * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-stackframe
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class STACKFRAME extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies the program counter. 
     * 
     * 
     * 
     * 
     * <b>x86:  </b>The program counter is EIP.
     * 
     * <b>Intel Itanium:  </b>The program counter is StIIP.
     * 
     * <b>x64:  </b>The program counter is RIP.
     * @type {ADDRESS}
     */
    AddrPC{
        get {
            if(!this.HasProp("__AddrPC"))
                this.__AddrPC := ADDRESS(this.ptr + 0)
            return this.__AddrPC
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies the return address.
     * @type {ADDRESS}
     */
    AddrReturn{
        get {
            if(!this.HasProp("__AddrReturn"))
                this.__AddrReturn := ADDRESS(this.ptr + 16)
            return this.__AddrReturn
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies the frame pointer. 
     * 
     * 
     * 
     * 
     * <b>x86:  </b>The frame pointer is EBP.
     * 
     * <b>Intel Itanium:  </b>There is no frame pointer, but <b>AddrBStore</b> is used.
     * 
     * <b>x64:  </b>The frame pointer is RBP or RDI. This value is not always used.
     * @type {ADDRESS}
     */
    AddrFrame{
        get {
            if(!this.HasProp("__AddrFrame"))
                this.__AddrFrame := ADDRESS(this.ptr + 32)
            return this.__AddrFrame
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies the stack pointer. 
     * 
     * 
     * 
     * 
     * <b>x86:  </b>The stack pointer is ESP.
     * 
     * <b>Intel Itanium:  </b>The stack pointer is SP.
     * 
     * <b>x64:  </b>The stack pointer is RSP.
     * @type {ADDRESS}
     */
    AddrStack{
        get {
            if(!this.HasProp("__AddrStack"))
                this.__AddrStack := ADDRESS(this.ptr + 48)
            return this.__AddrStack
        }
    }

    /**
     * On x86 computers, this member is an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> structure. If there is no function table entry, this member is <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    FuncTableEntry {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The possible arguments to the function.
     * @type {Array<UInt32>}
     */
    Params{
        get {
            if(!this.HasProp("__ParamsProxyArray"))
                this.__ParamsProxyArray := Win32FixedArray(this.ptr + 72, 4, Primitive, "uint")
            return this.__ParamsProxyArray
        }
    }

    /**
     * This member is <b>TRUE</b> if this is a WOW far call.
     * @type {Integer}
     */
    Far {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * This member is <b>TRUE</b> if this is a virtual frame.
     * @type {Integer}
     */
    Virtual {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * This member is used internally by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 96, 3, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-kdhelp">KDHELP64</a> structure that specifies helper data for walking kernel callback frames.
     * @type {KDHELP}
     */
    KdHelp{
        get {
            if(!this.HasProp("__KdHelp"))
                this.__KdHelp := KDHELP(this.ptr + 112)
            return this.__KdHelp
        }
    }

    /**
     * <b>Intel Itanium:  </b>An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies the backing store (RsBSP).
     * @type {ADDRESS}
     */
    AddrBStore{
        get {
            if(!this.HasProp("__AddrBStore"))
                this.__AddrBStore := ADDRESS(this.ptr + 176)
            return this.__AddrBStore
        }
    }
}

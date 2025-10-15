#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ADDRESS64.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include .\KDHELP64.ahk

/**
 * Represents an extended stack frame.
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-stackframe_ex
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class STACKFRAME_EX extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

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
     * @type {ADDRESS64}
     */
    AddrPC{
        get {
            if(!this.HasProp("__AddrPC"))
                this.__AddrPC := ADDRESS64(this.ptr + 0)
            return this.__AddrPC
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies 
     *       the return address.
     * @type {ADDRESS64}
     */
    AddrReturn{
        get {
            if(!this.HasProp("__AddrReturn"))
                this.__AddrReturn := ADDRESS64(this.ptr + 16)
            return this.__AddrReturn
        }
    }

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
     * @type {ADDRESS64}
     */
    AddrFrame{
        get {
            if(!this.HasProp("__AddrFrame"))
                this.__AddrFrame := ADDRESS64(this.ptr + 32)
            return this.__AddrFrame
        }
    }

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
     * @type {ADDRESS64}
     */
    AddrStack{
        get {
            if(!this.HasProp("__AddrStack"))
                this.__AddrStack := ADDRESS64(this.ptr + 48)
            return this.__AddrStack
        }
    }

    /**
     * <b>Intel Itanium:  </b>An <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-address">ADDRESS64</a> structure that specifies 
     *         the backing store (RsBSP).
     * @type {ADDRESS64}
     */
    AddrBStore{
        get {
            if(!this.HasProp("__AddrBStore"))
                this.__AddrBStore := ADDRESS64(this.ptr + 64)
            return this.__AddrBStore
        }
    }

    /**
     * On x86 computers, this member is an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> 
     *       structure. If there is no function table entry, this member is <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    FuncTableEntry {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The possible arguments to the function.
     * @type {Array<UInt64>}
     */
    Params{
        get {
            if(!this.HasProp("__ParamsProxyArray"))
                this.__ParamsProxyArray := Win32FixedArray(this.ptr + 88, 4, Primitive, "uint")
            return this.__ParamsProxyArray
        }
    }

    /**
     * This member is <b>TRUE</b> if this is a WOW far call.
     * @type {BOOL}
     */
    Far{
        get {
            if(!this.HasProp("__Far"))
                this.__Far := BOOL(this.ptr + 120)
            return this.__Far
        }
    }

    /**
     * This member is <b>TRUE</b> if this is a virtual frame.
     * @type {BOOL}
     */
    Virtual{
        get {
            if(!this.HasProp("__Virtual"))
                this.__Virtual := BOOL(this.ptr + 124)
            return this.__Virtual
        }
    }

    /**
     * This member is used internally by the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalkex">StackWalkEx</a> 
     *       function.
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 128, 3, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-kdhelp">KDHELP64</a> structure that specifies helper data for 
     *       walking kernel callback frames.
     * @type {KDHELP64}
     */
    KdHelp{
        get {
            if(!this.HasProp("__KdHelp"))
                this.__KdHelp := KDHELP64(this.ptr + 152)
            return this.__KdHelp
        }
    }

    /**
     * Set to <c>sizeof(STACKFRAME_EX)</c>.
     * @type {Integer}
     */
    StackFrameSize {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * Specifies the type of the inline frame context.
     * @type {Integer}
     */
    InlineFrameContext {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }
}

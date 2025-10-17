#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the stack frame information.
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-imagehlp_stack_frame
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_STACK_FRAME extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

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
     * @type {Integer}
     */
    InstructionOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The return address.
     * @type {Integer}
     */
    ReturnOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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
     * @type {Integer}
     */
    FrameOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

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
     * @type {Integer}
     */
    StackOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <b>Intel Itanium:  </b>The backing store address.
     * @type {Integer}
     */
    BackingStoreOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * <b>x86:  </b>An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> structure. If there is no function table entry, this member is <b>NULL</b>.
     * @type {Integer}
     */
    FuncTableEntry {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The possible arguments to the function.
     * @type {Array<UInt64>}
     */
    Params{
        get {
            if(!this.HasProp("__ParamsProxyArray"))
                this.__ParamsProxyArray := Win32FixedArray(this.ptr + 48, 4, Primitive, "uint")
            return this.__ParamsProxyArray
        }
    }

    /**
     * This member is reserved for system use.
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 80, 5, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * If this is a virtual frame, this member is <b>TRUE</b>. Otherwise, this member is <b>FALSE</b>.
     * @type {BOOL}
     */
    Virtual {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * This member is reserved for system use.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }
}

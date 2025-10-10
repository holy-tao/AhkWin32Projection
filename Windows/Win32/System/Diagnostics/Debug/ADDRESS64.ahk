#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents an address. It is used in the STACKFRAME64 structure.
 * @remarks
 * 
  * This structure supersedes the <b>ADDRESS</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>ADDRESS</b> is defined as follows in DbgHelp.h. 
  * 
  * 
  * ```cpp
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-address64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class ADDRESS64 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset into the segment, or a 32-bit virtual address. The interpretation of this value depends on the value contained in the <b>Mode</b> member.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The segment number. This value is used only for 16-bit addressing.
     * @type {Integer}
     */
    Segment {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}

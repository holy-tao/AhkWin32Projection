#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the stack frame layout for a function on an x86 computer when frame pointer omission (FPO) optimization is used. The structure is used to locate the base of the call frame.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-fpo_data
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class FPO_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The offset of the first byte of the function code.
     * @type {Integer}
     */
    ulOffStart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes in the function.
     * @type {Integer}
     */
    cbProcSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of local variables.
     * @type {Integer}
     */
    cdwLocals {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the parameters, in <b>DWORD</b>s.
     * @type {Integer}
     */
    cdwParams {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}

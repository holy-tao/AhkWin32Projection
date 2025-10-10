#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes an entry in the descriptor table. This structure is valid only on x86-based systems.
 * @remarks
 * 
  * The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getthreadselectorentry">GetThreadSelectorEntry</a> function fills this structure with information from an entry in the descriptor table. You can use this information to convert a segment-relative address to a linear virtual address.
  * 
  * The base address of a segment is the address of offset 0 in the segment. To calculate this value, combine the <b>BaseLow</b>, <b>BaseMid</b>, and <b>BaseHi</b> members.
  * 
  * The limit of a segment is the address of the last byte that can be addressed in the segment. To calculate this value, combine the <b>LimitLow</b> and <b>LimitHi</b> members.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-ldt_entry
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class LDT_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The low-order part of the address of the last byte in the segment.
     * @type {Integer}
     */
    LimitLow {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The low-order part of the base address of the segment.
     * @type {Integer}
     */
    BaseLow {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    class _Bytes extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        BaseMid {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Flags1 {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        Flags2 {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        BaseHi {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
    }

    /**
     * @type {_Bytes}
     */
    Bytes{
        get {
            if(!this.HasProp("__Bytes"))
                this.__Bytes := %this.__Class%._Bytes(this.ptr + 4)
            return this.__Bytes
        }
    }

    /**
     * @type {Integer}
     */
    Bits {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

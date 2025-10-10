#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is returned by GetSystemCpuSetInformation. It is used to enumerate the CPU Sets on the system and determine their current state.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-system_cpu_set_information
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class SYSTEM_CPU_SET_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * This is the size, in bytes, of this information structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This is the type of information in the structure. Applications should skip any structures with unrecognized types.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    class _CpuSet extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Id {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Group {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        LogicalProcessorIndex {
            get => NumGet(this, 6, "char")
            set => NumPut("char", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        CoreIndex {
            get => NumGet(this, 7, "char")
            set => NumPut("char", value, this, 7)
        }
    
        /**
         * @type {Integer}
         */
        LastLevelCacheIndex {
            get => NumGet(this, 8, "char")
            set => NumPut("char", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        NumaNodeIndex {
            get => NumGet(this, 9, "char")
            set => NumPut("char", value, this, 9)
        }
    
        /**
         * @type {Integer}
         */
        EfficiencyClass {
            get => NumGet(this, 10, "char")
            set => NumPut("char", value, this, 10)
        }
    
        /**
         * @type {Integer}
         */
        AllFlags {
            get => NumGet(this, 11, "char")
            set => NumPut("char", value, this, 11)
        }
    
        /**
         * @type {Integer}
         */
        Anonymous {
            get => NumGet(this, 11, "char")
            set => NumPut("char", value, this, 11)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 14, "uint")
            set => NumPut("uint", value, this, 14)
        }
    
        /**
         * @type {Integer}
         */
        SchedulingClass {
            get => NumGet(this, 14, "char")
            set => NumPut("char", value, this, 14)
        }
    
        /**
         * @type {Integer}
         */
        AllocationTag {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
    }

    /**
     * @type {_CpuSet}
     */
    CpuSet{
        get {
            if(!this.HasProp("__CpuSet"))
                this.__CpuSet := %this.__Class%._CpuSet(this.ptr + 8)
            return this.__CpuSet
        }
    }
}

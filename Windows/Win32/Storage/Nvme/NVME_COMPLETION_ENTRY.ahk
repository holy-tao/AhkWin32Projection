#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_COMMAND_STATUS.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_completion_entry
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMPLETION_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _DW2_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        SQHD {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SQID {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        AsUlong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _DW3_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Integer}
         */
        CID {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {NVME_COMMAND_STATUS}
         */
        Status{
            get {
                if(!this.HasProp("__Status"))
                    this.__Status := NVME_COMMAND_STATUS(4, this)
                return this.__Status
            }
        }
    
        /**
         * @type {Integer}
         */
        AsUlong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    DW0 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DW1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_DW2_e__Union}
     */
    DW2{
        get {
            if(!this.HasProp("__DW2"))
                this.__DW2 := %this.__Class%._DW2_e__Union(8, this)
            return this.__DW2
        }
    }

    /**
     * @type {_DW3_e__Union}
     */
    DW3{
        get {
            if(!this.HasProp("__DW3"))
                this.__DW3 := %this.__Class%._DW3_e__Union(16, this)
            return this.__DW3
        }
    }
}

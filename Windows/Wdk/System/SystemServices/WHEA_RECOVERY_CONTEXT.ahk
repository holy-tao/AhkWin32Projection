#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_RECOVERY_CONTEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _MemoryError extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        Address {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {BOOLEAN}
         */
        Consumed {
            get => NumGet(this, 8, "char")
            set => NumPut("char", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        ErrorCode {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
        }
    
        /**
         * @type {BOOLEAN}
         */
        ErrorIpValid {
            get => NumGet(this, 12, "char")
            set => NumPut("char", value, this, 12)
        }
    
        /**
         * @type {BOOLEAN}
         */
        RestartIpValid {
            get => NumGet(this, 13, "char")
            set => NumPut("char", value, this, 13)
        }
    
        /**
         * @type {BOOLEAN}
         */
        ClearPoison {
            get => NumGet(this, 14, "char")
            set => NumPut("char", value, this, 14)
        }
    
    }

    class _PmemError extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        PmemErrInfo {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {_MemoryError}
     */
    MemoryError{
        get {
            if(!this.HasProp("__MemoryError"))
                this.__MemoryError := %this.__Class%._MemoryError(0, this)
            return this.__MemoryError
        }
    }

    /**
     * @type {_PmemError}
     */
    PmemError{
        get {
            if(!this.HasProp("__PmemError"))
                this.__PmemError := %this.__Class%._PmemError(0, this)
            return this.__PmemError
        }
    }

    /**
     * @type {Integer}
     */
    PartitionId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VpIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ErrorType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}

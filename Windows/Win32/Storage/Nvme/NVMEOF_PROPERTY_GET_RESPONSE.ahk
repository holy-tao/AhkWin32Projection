#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_PROPERTY_GET_RESPONSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _VALUE_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        class _FourBytes extends Win32Struct {
            static sizeof => 8
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Value {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Reserved {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
        }
    
        /**
         * @type {_FourBytes}
         */
        FourBytes{
            get {
                if(!this.HasProp("__FourBytes"))
                    this.__FourBytes := %this.__Class%._FourBytes(0, this)
                return this.__FourBytes
            }
        }
    
        /**
         * @type {Integer}
         */
        EightBytes {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_VALUE_e__Union}
     */
    VALUE{
        get {
            if(!this.HasProp("__VALUE"))
                this.__VALUE := %this.__Class%._VALUE_e__Union(0, this)
            return this.__VALUE
        }
    }

    /**
     * @type {Integer}
     */
    SQHD {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    CID {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    STS {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}

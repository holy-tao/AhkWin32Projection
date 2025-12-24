#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MCA_EXCEPTION extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        class _Mca extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            BankNumber {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Array<Byte>}
             */
            Reserved2{
                get {
                    if(!this.HasProp("__Reserved2ProxyArray"))
                        this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 1, 7, Primitive, "char")
                    return this.__Reserved2ProxyArray
                }
            }
        
            /**
             * @type {Pointer<MCI_STATS>}
             */
            Status {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        
            /**
             * @type {Pointer<MCI_ADDR>}
             */
            Address {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            Misc {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        class _Mce extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Address {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Type {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        /**
         * @type {_Mca}
         */
        Mca{
            get {
                if(!this.HasProp("__Mca"))
                    this.__Mca := %this.__Class%._Mca(0, this)
                return this.__Mca
            }
        }
    
        /**
         * @type {_Mce}
         */
        Mce{
            get {
                if(!this.HasProp("__Mce"))
                    this.__Mce := %this.__Class%._Mce(0, this)
                return this.__Mce
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    VersionNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExceptionType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ProcessorNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(24, this)
            return this.__u
        }
    }

    /**
     * @type {Integer}
     */
    ExtCnt {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Array<UInt64>}
     */
    ExtReg{
        get {
            if(!this.HasProp("__ExtRegProxyArray"))
                this.__ExtRegProxyArray := Win32FixedArray(this.ptr + 64, 24, Primitive, "uint")
            return this.__ExtRegProxyArray
        }
    }
}

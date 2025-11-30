#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_COMMON_HEADER extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        class _PCI_HEADER_TYPE_0 extends Win32Struct {
            static sizeof => 48
            static packingSize => 4
    
            /**
             * @type {Array<UInt32>}
             */
            BaseAddresses{
                get {
                    if(!this.HasProp("__BaseAddressesProxyArray"))
                        this.__BaseAddressesProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "uint")
                    return this.__BaseAddressesProxyArray
                }
            }
        
            /**
             * @type {Integer}
             */
            CIS {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            SubVendorID {
                get => NumGet(this, 28, "ushort")
                set => NumPut("ushort", value, this, 28)
            }
        
            /**
             * @type {Integer}
             */
            SubSystemID {
                get => NumGet(this, 30, "ushort")
                set => NumPut("ushort", value, this, 30)
            }
        
            /**
             * @type {Integer}
             */
            ROMBaseAddress {
                get => NumGet(this, 32, "uint")
                set => NumPut("uint", value, this, 32)
            }
        
            /**
             * @type {Integer}
             */
            CapabilitiesPtr {
                get => NumGet(this, 36, "char")
                set => NumPut("char", value, this, 36)
            }
        
            /**
             * @type {Array<Byte>}
             */
            Reserved1{
                get {
                    if(!this.HasProp("__Reserved1ProxyArray"))
                        this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 37, 3, Primitive, "char")
                    return this.__Reserved1ProxyArray
                }
            }
        
            /**
             * @type {Integer}
             */
            Reserved2 {
                get => NumGet(this, 40, "uint")
                set => NumPut("uint", value, this, 40)
            }
        
            /**
             * @type {Integer}
             */
            InterruptLine {
                get => NumGet(this, 44, "char")
                set => NumPut("char", value, this, 44)
            }
        
            /**
             * @type {Integer}
             */
            InterruptPin {
                get => NumGet(this, 45, "char")
                set => NumPut("char", value, this, 45)
            }
        
            /**
             * @type {Integer}
             */
            MinimumGrant {
                get => NumGet(this, 46, "char")
                set => NumPut("char", value, this, 46)
            }
        
            /**
             * @type {Integer}
             */
            MaximumLatency {
                get => NumGet(this, 47, "char")
                set => NumPut("char", value, this, 47)
            }
        
        }
    
        class _PCI_HEADER_TYPE_1 extends Win32Struct {
            static sizeof => 48
            static packingSize => 4
    
            /**
             * @type {Array<UInt32>}
             */
            BaseAddresses{
                get {
                    if(!this.HasProp("__BaseAddressesProxyArray"))
                        this.__BaseAddressesProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "uint")
                    return this.__BaseAddressesProxyArray
                }
            }
        
            /**
             * @type {Integer}
             */
            PrimaryBus {
                get => NumGet(this, 8, "char")
                set => NumPut("char", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SecondaryBus {
                get => NumGet(this, 9, "char")
                set => NumPut("char", value, this, 9)
            }
        
            /**
             * @type {Integer}
             */
            SubordinateBus {
                get => NumGet(this, 10, "char")
                set => NumPut("char", value, this, 10)
            }
        
            /**
             * @type {Integer}
             */
            SecondaryLatency {
                get => NumGet(this, 11, "char")
                set => NumPut("char", value, this, 11)
            }
        
            /**
             * @type {Integer}
             */
            IOBase {
                get => NumGet(this, 12, "char")
                set => NumPut("char", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            IOLimit {
                get => NumGet(this, 13, "char")
                set => NumPut("char", value, this, 13)
            }
        
            /**
             * @type {Integer}
             */
            SecondaryStatus {
                get => NumGet(this, 14, "ushort")
                set => NumPut("ushort", value, this, 14)
            }
        
            /**
             * @type {Integer}
             */
            MemoryBase {
                get => NumGet(this, 16, "ushort")
                set => NumPut("ushort", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            MemoryLimit {
                get => NumGet(this, 18, "ushort")
                set => NumPut("ushort", value, this, 18)
            }
        
            /**
             * @type {Integer}
             */
            PrefetchBase {
                get => NumGet(this, 20, "ushort")
                set => NumPut("ushort", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            PrefetchLimit {
                get => NumGet(this, 22, "ushort")
                set => NumPut("ushort", value, this, 22)
            }
        
            /**
             * @type {Integer}
             */
            PrefetchBaseUpper32 {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            PrefetchLimitUpper32 {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
            /**
             * @type {Integer}
             */
            IOBaseUpper16 {
                get => NumGet(this, 32, "ushort")
                set => NumPut("ushort", value, this, 32)
            }
        
            /**
             * @type {Integer}
             */
            IOLimitUpper16 {
                get => NumGet(this, 34, "ushort")
                set => NumPut("ushort", value, this, 34)
            }
        
            /**
             * @type {Integer}
             */
            CapabilitiesPtr {
                get => NumGet(this, 36, "char")
                set => NumPut("char", value, this, 36)
            }
        
            /**
             * @type {Array<Byte>}
             */
            Reserved1{
                get {
                    if(!this.HasProp("__Reserved1ProxyArray"))
                        this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 37, 3, Primitive, "char")
                    return this.__Reserved1ProxyArray
                }
            }
        
            /**
             * @type {Integer}
             */
            ROMBaseAddress {
                get => NumGet(this, 40, "uint")
                set => NumPut("uint", value, this, 40)
            }
        
            /**
             * @type {Integer}
             */
            InterruptLine {
                get => NumGet(this, 44, "char")
                set => NumPut("char", value, this, 44)
            }
        
            /**
             * @type {Integer}
             */
            InterruptPin {
                get => NumGet(this, 45, "char")
                set => NumPut("char", value, this, 45)
            }
        
            /**
             * @type {Integer}
             */
            BridgeControl {
                get => NumGet(this, 46, "ushort")
                set => NumPut("ushort", value, this, 46)
            }
        
        }
    
        class _PCI_HEADER_TYPE_2 extends Win32Struct {
            static sizeof => 56
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            SocketRegistersBaseAddress {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            CapabilitiesPtr {
                get => NumGet(this, 4, "char")
                set => NumPut("char", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            Reserved {
                get => NumGet(this, 5, "char")
                set => NumPut("char", value, this, 5)
            }
        
            /**
             * @type {Integer}
             */
            SecondaryStatus {
                get => NumGet(this, 6, "ushort")
                set => NumPut("ushort", value, this, 6)
            }
        
            /**
             * @type {Integer}
             */
            PrimaryBus {
                get => NumGet(this, 8, "char")
                set => NumPut("char", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            SecondaryBus {
                get => NumGet(this, 9, "char")
                set => NumPut("char", value, this, 9)
            }
        
            /**
             * @type {Integer}
             */
            SubordinateBus {
                get => NumGet(this, 10, "char")
                set => NumPut("char", value, this, 10)
            }
        
            /**
             * @type {Integer}
             */
            SecondaryLatency {
                get => NumGet(this, 11, "char")
                set => NumPut("char", value, this, 11)
            }
        
            /**
             * @type {Integer}
             */
            Base {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            Limit {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            InterruptLine {
                get => NumGet(this, 48, "char")
                set => NumPut("char", value, this, 48)
            }
        
            /**
             * @type {Integer}
             */
            InterruptPin {
                get => NumGet(this, 49, "char")
                set => NumPut("char", value, this, 49)
            }
        
            /**
             * @type {Integer}
             */
            BridgeControl {
                get => NumGet(this, 50, "ushort")
                set => NumPut("ushort", value, this, 50)
            }
        
        }
    
        /**
         * @type {_PCI_HEADER_TYPE_0}
         */
        type0{
            get {
                if(!this.HasProp("__type0"))
                    this.__type0 := %this.__Class%._PCI_HEADER_TYPE_0(0, this)
                return this.__type0
            }
        }
    
        /**
         * @type {_PCI_HEADER_TYPE_1}
         */
        type1{
            get {
                if(!this.HasProp("__type1"))
                    this.__type1 := %this.__Class%._PCI_HEADER_TYPE_1(0, this)
                return this.__type1
            }
        }
    
        /**
         * @type {_PCI_HEADER_TYPE_2}
         */
        type2{
            get {
                if(!this.HasProp("__type2"))
                    this.__type2 := %this.__Class%._PCI_HEADER_TYPE_2(0, this)
                return this.__type2
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    VendorID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DeviceID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Command {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    RevisionID {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ProgIf {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    SubClass {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    BaseClass {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    CacheLineSize {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    LatencyTimer {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    HeaderType {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    BIST {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(16, this)
            return this.__u
        }
    }
}

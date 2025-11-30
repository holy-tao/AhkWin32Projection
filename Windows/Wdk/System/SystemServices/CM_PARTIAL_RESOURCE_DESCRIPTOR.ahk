#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class CM_PARTIAL_RESOURCE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 20
        static packingSize => 8

        class _Generic extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Start {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _Port extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Start {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _Interrupt extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Level {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Vector {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Pointer}
             */
            Affinity {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        
        }
    
        class _MessageInterrupt extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            class _Raw extends Win32Struct {
                static sizeof => 16
                static packingSize => 8
        
                /**
                 * @type {Integer}
                 */
                Reserved {
                    get => NumGet(this, 0, "ushort")
                    set => NumPut("ushort", value, this, 0)
                }
            
                /**
                 * @type {Integer}
                 */
                MessageCount {
                    get => NumGet(this, 2, "ushort")
                    set => NumPut("ushort", value, this, 2)
                }
            
                /**
                 * @type {Integer}
                 */
                Vector {
                    get => NumGet(this, 4, "uint")
                    set => NumPut("uint", value, this, 4)
                }
            
                /**
                 * @type {Pointer}
                 */
                Affinity {
                    get => NumGet(this, 8, "ptr")
                    set => NumPut("ptr", value, this, 8)
                }
            
            }
        
            class _Translated extends Win32Struct {
                static sizeof => 16
                static packingSize => 8
        
                /**
                 * @type {Integer}
                 */
                Level {
                    get => NumGet(this, 0, "uint")
                    set => NumPut("uint", value, this, 0)
                }
            
                /**
                 * @type {Integer}
                 */
                Vector {
                    get => NumGet(this, 4, "uint")
                    set => NumPut("uint", value, this, 4)
                }
            
                /**
                 * @type {Pointer}
                 */
                Affinity {
                    get => NumGet(this, 8, "ptr")
                    set => NumPut("ptr", value, this, 8)
                }
            
            }
        
            /**
             * @type {_Raw}
             */
            Raw{
                get {
                    if(!this.HasProp("__Raw"))
                        this.__Raw := %this.__Class%._Raw(0, this)
                    return this.__Raw
                }
            }
        
            /**
             * @type {_Translated}
             */
            Translated{
                get {
                    if(!this.HasProp("__Translated"))
                        this.__Translated := %this.__Class%._Translated(0, this)
                    return this.__Translated
                }
            }
        
        }
    
        class _Memory extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Start {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _Dma extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Channel {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Port {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            Reserved1 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _DmaV3 extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Channel {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            RequestLine {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            TransferWidth {
                get => NumGet(this, 8, "char")
                set => NumPut("char", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            Reserved1 {
                get => NumGet(this, 9, "char")
                set => NumPut("char", value, this, 9)
            }
        
            /**
             * @type {Integer}
             */
            Reserved2 {
                get => NumGet(this, 10, "char")
                set => NumPut("char", value, this, 10)
            }
        
            /**
             * @type {Integer}
             */
            Reserved3 {
                get => NumGet(this, 11, "char")
                set => NumPut("char", value, this, 11)
            }
        
        }
    
        class _DevicePrivate extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
            /**
             * @type {Array<UInt32>}
             */
            Data{
                get {
                    if(!this.HasProp("__DataProxyArray"))
                        this.__DataProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "uint")
                    return this.__DataProxyArray
                }
            }
        
        }
    
        class _BusNumber extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Start {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            Reserved {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _DeviceSpecificData extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            DataSize {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Reserved1 {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            Reserved2 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _Memory40 extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Start {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Length40 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _Memory48 extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Start {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Length48 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _Memory64 extends Win32Struct {
            static sizeof => 16
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Start {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Length64 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        class _Connection extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            Class {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Type {
                get => NumGet(this, 1, "char")
                set => NumPut("char", value, this, 1)
            }
        
            /**
             * @type {Integer}
             */
            Reserved1 {
                get => NumGet(this, 2, "char")
                set => NumPut("char", value, this, 2)
            }
        
            /**
             * @type {Integer}
             */
            Reserved2 {
                get => NumGet(this, 3, "char")
                set => NumPut("char", value, this, 3)
            }
        
            /**
             * @type {Integer}
             */
            IdLowPart {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            IdHighPart {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
        }
    
        /**
         * @type {_Generic}
         */
        Generic{
            get {
                if(!this.HasProp("__Generic"))
                    this.__Generic := %this.__Class%._Generic(0, this)
                return this.__Generic
            }
        }
    
        /**
         * @type {_Port}
         */
        Port{
            get {
                if(!this.HasProp("__Port"))
                    this.__Port := %this.__Class%._Port(0, this)
                return this.__Port
            }
        }
    
        /**
         * @type {_Interrupt}
         */
        Interrupt{
            get {
                if(!this.HasProp("__Interrupt"))
                    this.__Interrupt := %this.__Class%._Interrupt(0, this)
                return this.__Interrupt
            }
        }
    
        /**
         * @type {_MessageInterrupt}
         */
        MessageInterrupt{
            get {
                if(!this.HasProp("__MessageInterrupt"))
                    this.__MessageInterrupt := %this.__Class%._MessageInterrupt(0, this)
                return this.__MessageInterrupt
            }
        }
    
        /**
         * @type {_Memory}
         */
        Memory{
            get {
                if(!this.HasProp("__Memory"))
                    this.__Memory := %this.__Class%._Memory(0, this)
                return this.__Memory
            }
        }
    
        /**
         * @type {_Dma}
         */
        Dma{
            get {
                if(!this.HasProp("__Dma"))
                    this.__Dma := %this.__Class%._Dma(0, this)
                return this.__Dma
            }
        }
    
        /**
         * @type {_DmaV3}
         */
        DmaV3{
            get {
                if(!this.HasProp("__DmaV3"))
                    this.__DmaV3 := %this.__Class%._DmaV3(0, this)
                return this.__DmaV3
            }
        }
    
        /**
         * @type {_DevicePrivate}
         */
        DevicePrivate{
            get {
                if(!this.HasProp("__DevicePrivate"))
                    this.__DevicePrivate := %this.__Class%._DevicePrivate(0, this)
                return this.__DevicePrivate
            }
        }
    
        /**
         * @type {_BusNumber}
         */
        BusNumber{
            get {
                if(!this.HasProp("__BusNumber"))
                    this.__BusNumber := %this.__Class%._BusNumber(0, this)
                return this.__BusNumber
            }
        }
    
        /**
         * @type {_DeviceSpecificData}
         */
        DeviceSpecificData{
            get {
                if(!this.HasProp("__DeviceSpecificData"))
                    this.__DeviceSpecificData := %this.__Class%._DeviceSpecificData(0, this)
                return this.__DeviceSpecificData
            }
        }
    
        /**
         * @type {_Memory40}
         */
        Memory40{
            get {
                if(!this.HasProp("__Memory40"))
                    this.__Memory40 := %this.__Class%._Memory40(0, this)
                return this.__Memory40
            }
        }
    
        /**
         * @type {_Memory48}
         */
        Memory48{
            get {
                if(!this.HasProp("__Memory48"))
                    this.__Memory48 := %this.__Class%._Memory48(0, this)
                return this.__Memory48
            }
        }
    
        /**
         * @type {_Memory64}
         */
        Memory64{
            get {
                if(!this.HasProp("__Memory64"))
                    this.__Memory64 := %this.__Class%._Memory64(0, this)
                return this.__Memory64
            }
        }
    
        /**
         * @type {_Connection}
         */
        Connection{
            get {
                if(!this.HasProp("__Connection"))
                    this.__Connection := %this.__Class%._Connection(0, this)
                return this.__Connection
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ShareDisposition {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(8, this)
            return this.__u
        }
    }
}

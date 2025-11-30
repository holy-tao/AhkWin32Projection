#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_REMOTE_PROTOCOL_INFORMATION extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    class _GenericReserved extends Win32Struct {
        static sizeof => 32
        static packingSize => 4

        /**
         * @type {Array<UInt32>}
         */
        Reserved{
            get {
                if(!this.HasProp("__ReservedProxyArray"))
                    this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "uint")
                return this.__ReservedProxyArray
            }
        }
    
    }

    class _ProtocolSpecific_e__Union extends Win32Struct {
        static sizeof => 64
        static packingSize => 8

        class _Smb2 extends Win32Struct {
            static sizeof => 24
            static packingSize => 8
    
            class _Server extends Win32Struct {
                static sizeof => 4
                static packingSize => 4
        
                /**
                 * @type {Integer}
                 */
                Capabilities {
                    get => NumGet(this, 0, "uint")
                    set => NumPut("uint", value, this, 0)
                }
            
            }
        
            class _Share extends Win32Struct {
                static sizeof => 16
                static packingSize => 4
        
                /**
                 * @type {Integer}
                 */
                Capabilities {
                    get => NumGet(this, 0, "uint")
                    set => NumPut("uint", value, this, 0)
                }
            
                /**
                 * @type {Integer}
                 */
                ShareFlags {
                    get => NumGet(this, 4, "uint")
                    set => NumPut("uint", value, this, 4)
                }
            
                /**
                 * @type {Integer}
                 */
                ShareType {
                    get => NumGet(this, 8, "char")
                    set => NumPut("char", value, this, 8)
                }
            
                /**
                 * @type {Array<Byte>}
                 */
                Reserved0{
                    get {
                        if(!this.HasProp("__Reserved0ProxyArray"))
                            this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 9, 3, Primitive, "char")
                        return this.__Reserved0ProxyArray
                    }
                }
            
                /**
                 * @type {Integer}
                 */
                Reserved1 {
                    get => NumGet(this, 12, "uint")
                    set => NumPut("uint", value, this, 12)
                }
            
            }
        
            /**
             * @type {_Server}
             */
            Server{
                get {
                    if(!this.HasProp("__Server"))
                        this.__Server := %this.__Class%._Server(0, this)
                    return this.__Server
                }
            }
        
            /**
             * @type {_Share}
             */
            Share{
                get {
                    if(!this.HasProp("__Share"))
                        this.__Share := %this.__Class%._Share(8, this)
                    return this.__Share
                }
            }
        
        }
    
        /**
         * @type {_Smb2}
         */
        Smb2{
            get {
                if(!this.HasProp("__Smb2"))
                    this.__Smb2 := %this.__Class%._Smb2(0, this)
                return this.__Smb2
            }
        }
    
        /**
         * @type {Array<UInt32>}
         */
        Reserved{
            get {
                if(!this.HasProp("__ReservedProxyArray"))
                    this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "uint")
                return this.__ReservedProxyArray
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    StructureVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StructureSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Protocol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ProtocolMajorVersion {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ProtocolMinorVersion {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    ProtocolRevision {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {_GenericReserved}
     */
    GenericReserved{
        get {
            if(!this.HasProp("__GenericReserved"))
                this.__GenericReserved := %this.__Class%._GenericReserved(24, this)
            return this.__GenericReserved
        }
    }

    /**
     * @type {_ProtocolSpecific_e__Union}
     */
    ProtocolSpecific{
        get {
            if(!this.HasProp("__ProtocolSpecific"))
                this.__ProtocolSpecific := %this.__Class%._ProtocolSpecific_e__Union(56, this)
            return this.__ProtocolSpecific
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMP_MESSAGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    class _Data_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Array<UInt32>}
         */
        Data32{
            get {
                if(!this.HasProp("__Data32ProxyArray"))
                    this.__Data32ProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
                return this.__Data32ProxyArray
            }
        }
    
        /**
         * @type {Array<UInt16>}
         */
        Data16{
            get {
                if(!this.HasProp("__Data16ProxyArray"))
                    this.__Data16ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
                return this.__Data16ProxyArray
            }
        }
    
        /**
         * @type {Array<Byte>}
         */
        Data8{
            get {
                if(!this.HasProp("__Data8ProxyArray"))
                    this.__Data8ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
                return this.__Data8ProxyArray
            }
        }
    
    }

    /**
     * @type {ICMP_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := ICMP_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {_Data_e__Union}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := %this.__Class%._Data_e__Union(4, this)
            return this.__Data
        }
    }
}

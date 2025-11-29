#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines a resource attribute that is defined in continuous memory for persistence within a serialized security descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-claim_security_attribute_relative_v1
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    class _Values_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Array<UInt32>}
         */
        pInt64{
            get {
                if(!this.HasProp("__pInt64ProxyArray"))
                    this.__pInt64ProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
                return this.__pInt64ProxyArray
            }
        }
    
        /**
         * @type {Array<UInt32>}
         */
        pUint64{
            get {
                if(!this.HasProp("__pUint64ProxyArray"))
                    this.__pUint64ProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
                return this.__pUint64ProxyArray
            }
        }
    
        /**
         * @type {Array<UInt32>}
         */
        ppString{
            get {
                if(!this.HasProp("__ppStringProxyArray"))
                    this.__ppStringProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
                return this.__ppStringProxyArray
            }
        }
    
        /**
         * @type {Array<UInt32>}
         */
        pFqbn{
            get {
                if(!this.HasProp("__pFqbnProxyArray"))
                    this.__pFqbnProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
                return this.__pFqbnProxyArray
            }
        }
    
        /**
         * @type {Array<UInt32>}
         */
        pOctetString{
            get {
                if(!this.HasProp("__pOctetStringProxyArray"))
                    this.__pOctetStringProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
                return this.__pOctetStringProxyArray
            }
        }
    
    }

    /**
     * A value that indicates an offset from the beginning of the <b>CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1</b> structure to a string of Unicode characters that contain the name of the claim security attribute. The string must be at least 4 bytes in length.
     * @type {Integer}
     */
    Name {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    ValueType {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * This member is currently reserved and must be set to zero when sent and must be ignored when received.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of values contained in the <b>Values</b> member.
     * @type {Integer}
     */
    ValueCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An array of offsets from the beginning of the CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 structure. Each offset indicates the location of a claim security attribute value of the type specified in the <b>ValueType</b> member.
     * @type {_Values_e__Union}
     */
    Values{
        get {
            if(!this.HasProp("__Values"))
                this.__Values := %this.__Class%._Values_e__Union(16, this)
            return this.__Values
        }
    }
}

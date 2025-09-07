#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASPPPIPV6 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    bLocalInterfaceIdentifier{
        get {
            if(!this.HasProp("__bLocalInterfaceIdentifierProxyArray"))
                this.__bLocalInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__bLocalInterfaceIdentifierProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bPeerInterfaceIdentifier{
        get {
            if(!this.HasProp("__bPeerInterfaceIdentifierProxyArray"))
                this.__bPeerInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__bPeerInterfaceIdentifierProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bLocalCompressionProtocol{
        get {
            if(!this.HasProp("__bLocalCompressionProtocolProxyArray"))
                this.__bLocalCompressionProtocolProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__bLocalCompressionProtocolProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bPeerCompressionProtocol{
        get {
            if(!this.HasProp("__bPeerCompressionProtocolProxyArray"))
                this.__bPeerCompressionProtocolProxyArray := Win32FixedArray(this.ptr + 26, 1, Primitive, "char")
            return this.__bPeerCompressionProtocolProxyArray
        }
    }
}

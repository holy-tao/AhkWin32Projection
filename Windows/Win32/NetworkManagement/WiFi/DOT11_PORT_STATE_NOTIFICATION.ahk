#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PORT_STATE_NOTIFICATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PeerMac{
        get {
            if(!this.HasProp("__PeerMacProxyArray"))
                this.__PeerMacProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__PeerMacProxyArray
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bOpen {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }
}

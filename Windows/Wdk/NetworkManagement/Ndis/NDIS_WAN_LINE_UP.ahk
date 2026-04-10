#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_WAN_QUALITY.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_WAN_LINE_UP extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LinkSpeed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaximumTotalSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {NDIS_WAN_QUALITY}
     */
    Quality {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SendWindow {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    RemoteAddress {
        get {
            if(!this.HasProp("__RemoteAddressProxyArray"))
                this.__RemoteAddressProxyArray := Win32FixedArray(this.ptr + 14, 6, Primitive, "char")
            return this.__RemoteAddressProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    LocalAddress {
        get {
            if(!this.HasProp("__LocalAddressProxyArray"))
                this.__LocalAddressProxyArray := Win32FixedArray(this.ptr + 20, 6, Primitive, "char")
            return this.__LocalAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ProtocolBufferLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ProtocolBuffer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    DeviceName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}

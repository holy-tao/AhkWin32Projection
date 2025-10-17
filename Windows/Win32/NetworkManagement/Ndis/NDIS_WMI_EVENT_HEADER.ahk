#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NET_LUID_LH.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_EVENT_HEADER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

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
     * @type {Integer}
     */
    IfIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {NET_LUID_LH}
     */
    NetLuid{
        get {
            if(!this.HasProp("__NetLuid"))
                this.__NetLuid := NET_LUID_LH(8, this)
            return this.__NetLuid
        }
    }

    /**
     * @type {Integer}
     */
    RequestId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    DeviceNameLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    DeviceNameOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<Byte>}
     */
    Padding{
        get {
            if(!this.HasProp("__PaddingProxyArray"))
                this.__PaddingProxyArray := Win32FixedArray(this.ptr + 44, 4, Primitive, "char")
            return this.__PaddingProxyArray
        }
    }
}

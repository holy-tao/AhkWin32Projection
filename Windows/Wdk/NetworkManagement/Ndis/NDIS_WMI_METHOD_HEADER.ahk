#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\NetworkManagement\Ndis\NET_LUID_LH.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_METHOD_HEADER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<NDIS_OBJECT_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {NET_LUID_LH}
     */
    NetLuid{
        get {
            if(!this.HasProp("__NetLuid"))
                this.__NetLuid := NET_LUID_LH(16, this)
            return this.__NetLuid
        }
    }

    /**
     * @type {Integer}
     */
    RequestId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Timeout {
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

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NET_LUID_LH.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_ENUM_ADAPTER extends Win32Struct
{
    static sizeof => 32

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
    DeviceNameLength {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 26, 0, "UTF-16")
        set => StrPut(value, this.ptr + 26, 0, "UTF-16")
    }
}

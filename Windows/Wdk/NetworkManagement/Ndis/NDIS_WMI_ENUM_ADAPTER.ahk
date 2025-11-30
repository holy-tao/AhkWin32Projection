#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\NetworkManagement\Ndis\NET_LUID_LH.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_ENUM_ADAPTER extends Win32Struct
{
    static sizeof => 40

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
    IfIndex {
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
    DeviceNameLength {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 34, 0, "UTF-16")
        set => StrPut(value, this.ptr + 34, 0, "UTF-16")
    }
}

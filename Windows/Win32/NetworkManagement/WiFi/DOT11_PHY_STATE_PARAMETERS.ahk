#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PHY_STATE_PARAMETERS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    uPhyId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    bHardwarePhyState{
        get {
            if(!this.HasProp("__bHardwarePhyState"))
                this.__bHardwarePhyState := BOOLEAN(this.ptr + 8)
            return this.__bHardwarePhyState
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bSoftwarePhyState{
        get {
            if(!this.HasProp("__bSoftwarePhyState"))
                this.__bSoftwarePhyState := BOOLEAN(this.ptr + 9)
            return this.__bSoftwarePhyState
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_FL_VIRTUAL_INTERFACE_ROW extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {NET_LUID_LH}
     */
    IfLuid{
        get {
            if(!this.HasProp("__IfLuid"))
                this.__IfLuid := NET_LUID_LH(8, this)
            return this.__IfLuid
        }
    }

    /**
     * @type {Integer}
     */
    VirtualIfId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    CompartmentGuid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    IsolationMode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Origin {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {NET_LUID_LH}
     */
    VirtualIfLuid{
        get {
            if(!this.HasProp("__VirtualIfLuid"))
                this.__VirtualIfLuid := NET_LUID_LH(48, this)
            return this.__VirtualIfLuid
        }
    }

    /**
     * @type {Integer}
     */
    VirtualIfIndex {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {BOOLEAN}
     */
    AllowLocalNd {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    AttachedFlsnpiClients {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    FlsnpiClientConfigErrors {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    FlsnpiClientInjectErrors {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    FlsnpiClientCloneErrors {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    InFlsnpiIndicatedPackets {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    InFlsnpiClientReturnedPackets {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    InFlsnpiClientSilentlyDroppedPackets {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    InFlsnpiClientDroppedPackets {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    InFlsnpiClientInjectedPackets {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    InFlsnpiClientClonedPackets {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    OutFlsnpiIndicatedPackets {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    OutFlsnpiClientReturnedPackets {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    OutFlsnpiClientDroppedPackets {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    OutFlsnpiClientSilentlyDroppedPackets {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    OutFlsnpiClientInjectedPackets {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    OutFlsnpiClientClonedPackets {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    OutFlsnpiClientClonedPacketsForNbSplit {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }
}

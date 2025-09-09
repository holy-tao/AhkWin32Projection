#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class FIRMWARE_ACTIVATION_HISTORY_ENTRY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 1

    /**
     * @type {Integer}
     */
    VersionNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    ActivationCount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 6, "uint")
        set => NumPut("uint", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 14, "uint")
        set => NumPut("uint", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    PowerCycleCount {
        get => NumGet(this, 22, "uint")
        set => NumPut("uint", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    PreviousFirmware {
        get => NumGet(this, 30, "uint")
        set => NumPut("uint", value, this, 30)
    }

    /**
     * @type {Integer}
     */
    NewFirmware {
        get => NumGet(this, 38, "uint")
        set => NumPut("uint", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    SlotNumber {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    CommitActionType {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }

    /**
     * @type {Integer}
     */
    Result {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 50, 14, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}

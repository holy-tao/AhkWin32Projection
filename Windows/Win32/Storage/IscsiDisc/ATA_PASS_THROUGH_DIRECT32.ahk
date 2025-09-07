#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class ATA_PASS_THROUGH_DIRECT32 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AtaFlags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    PathId {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TargetId {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    Lun {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    ReservedAsUchar {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Integer}
     */
    DataTransferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TimeOutValue {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ReservedAsUlong {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    DataBuffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    PreviousTaskFile{
        get {
            if(!this.HasProp("__PreviousTaskFileProxyArray"))
                this.__PreviousTaskFileProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__PreviousTaskFileProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    CurrentTaskFile{
        get {
            if(!this.HasProp("__CurrentTaskFileProxyArray"))
                this.__CurrentTaskFileProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__CurrentTaskFileProxyArray
        }
    }
}

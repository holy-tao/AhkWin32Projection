#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class NTMS_I1_PMIDINFORMATIONW extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    CurrentLibrary {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    MediaPool {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Location {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    LocationType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    MediaType {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Guid>}
     */
    HomeSlot {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {String}
     */
    szBarCode {
        get => StrGet(this.ptr + 48, 63, "UTF-16")
        set => StrPut(value, this.ptr + 48, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    BarCodeState {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {String}
     */
    szSequenceNumber {
        get => StrGet(this.ptr + 180, 31, "UTF-16")
        set => StrPut(value, this.ptr + 180, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    MediaState {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfPartitions {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }
}

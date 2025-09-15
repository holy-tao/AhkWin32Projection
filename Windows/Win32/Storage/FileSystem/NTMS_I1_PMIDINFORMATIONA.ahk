#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_I1_PMIDINFORMATIONA extends Win32Struct
{
    static sizeof => 160

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
        get => StrGet(this.ptr + 48, 63, "UTF-8")
        set => StrPut(value, this.ptr + 48, 63, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    BarCodeState {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {String}
     */
    szSequenceNumber {
        get => StrGet(this.ptr + 116, 31, "UTF-8")
        set => StrPut(value, this.ptr + 116, 31, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    MediaState {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfPartitions {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }
}

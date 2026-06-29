#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
class NTMS_I1_PMIDINFORMATIONA extends Win32Struct {
    static sizeof => 192

    static packingSize => 4

    /**
     * @type {Guid}
     */
    CurrentLibrary {
        get {
            if(!this.HasProp("__CurrentLibrary"))
                this.__CurrentLibrary := Guid(0, this)
            return this.__CurrentLibrary
        }
    }

    /**
     * @type {Guid}
     */
    MediaPool {
        get {
            if(!this.HasProp("__MediaPool"))
                this.__MediaPool := Guid(16, this)
            return this.__MediaPool
        }
    }

    /**
     * @type {Guid}
     */
    Location {
        get {
            if(!this.HasProp("__Location"))
                this.__Location := Guid(32, this)
            return this.__Location
        }
    }

    /**
     * @type {Integer}
     */
    LocationType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Guid}
     */
    MediaType {
        get {
            if(!this.HasProp("__MediaType"))
                this.__MediaType := Guid(52, this)
            return this.__MediaType
        }
    }

    /**
     * @type {Guid}
     */
    HomeSlot {
        get {
            if(!this.HasProp("__HomeSlot"))
                this.__HomeSlot := Guid(68, this)
            return this.__HomeSlot
        }
    }

    /**
     * @type {String}
     */
    szBarCode {
        get => StrGet(this.ptr + 84, 63, "UTF-8")
        set => StrPut(value, this.ptr + 84, 63, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    BarCodeState {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {String}
     */
    szSequenceNumber {
        get => StrGet(this.ptr + 152, 31, "UTF-8")
        set => StrPut(value, this.ptr + 152, 31, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    MediaState {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfPartitions {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }
}

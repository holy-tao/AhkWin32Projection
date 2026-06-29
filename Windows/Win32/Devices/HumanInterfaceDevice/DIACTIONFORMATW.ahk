#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\DIACTIONW.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
class DIACTIONFORMATW extends Win32Struct {
    static sizeof => 600

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwActionSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwNumActions {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<DIACTIONW>}
     */
    rgoAction {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Guid}
     */
    guidActionMap {
        get {
            if(!this.HasProp("__guidActionMap"))
                this.__guidActionMap := Guid(24, this)
            return this.__guidActionMap
        }
    }

    /**
     * @type {Integer}
     */
    dwGenre {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwBufferSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    lAxisMin {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    lAxisMax {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {HINSTANCE}
     */
    hInstString {
        get {
            if(!this.HasProp("__hInstString"))
                this.__hInstString := HINSTANCE(56, this)
            return this.__hInstString
        }
    }

    /**
     * @type {FILETIME}
     */
    ftTimeStamp {
        get {
            if(!this.HasProp("__ftTimeStamp"))
                this.__ftTimeStamp := FILETIME(64, this)
            return this.__ftTimeStamp
        }
    }

    /**
     * @type {Integer}
     */
    dwCRC {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {String}
     */
    tszActionMap {
        get => StrGet(this.ptr + 76, 259, "UTF-16")
        set => StrPut(value, this.ptr + 76, 259, "UTF-16")
    }
}

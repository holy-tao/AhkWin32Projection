#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset Unicode
 */
class DIACTIONFORMATW extends Win32Struct
{
    static sizeof => 592

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
     * @type {Pointer<Guid>}
     */
    guidActionMap {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwGenre {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwBufferSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    lAxisMin {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    lAxisMax {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {HINSTANCE}
     */
    hInstString{
        get {
            if(!this.HasProp("__hInstString"))
                this.__hInstString := HINSTANCE(this.ptr + 48)
            return this.__hInstString
        }
    }

    /**
     * @type {FILETIME}
     */
    ftTimeStamp{
        get {
            if(!this.HasProp("__ftTimeStamp"))
                this.__ftTimeStamp := FILETIME(this.ptr + 56)
            return this.__ftTimeStamp
        }
    }

    /**
     * @type {Integer}
     */
    dwCRC {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {String}
     */
    tszActionMap {
        get => StrGet(this.ptr + 68, 259, "UTF-16")
        set => StrPut(value, this.ptr + 68, 259, "UTF-16")
    }
}

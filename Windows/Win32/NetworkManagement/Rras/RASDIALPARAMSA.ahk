#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASDIALPARAMSA extends Win32Struct
{
    static sizeof => 1080

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    szEntryName {
        get => StrGet(this.ptr + 4, 256, "UTF-8")
        set => StrPut(value, this.ptr + 4, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPhoneNumber {
        get => StrGet(this.ptr + 261, 128, "UTF-8")
        set => StrPut(value, this.ptr + 261, 128, "UTF-8")
    }

    /**
     * @type {String}
     */
    szCallbackNumber {
        get => StrGet(this.ptr + 390, 128, "UTF-8")
        set => StrPut(value, this.ptr + 390, 128, "UTF-8")
    }

    /**
     * @type {String}
     */
    szUserName {
        get => StrGet(this.ptr + 519, 256, "UTF-8")
        set => StrPut(value, this.ptr + 519, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPassword {
        get => StrGet(this.ptr + 776, 256, "UTF-8")
        set => StrPut(value, this.ptr + 776, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDomain {
        get => StrGet(this.ptr + 1033, 15, "UTF-8")
        set => StrPut(value, this.ptr + 1033, 15, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwSubEntry {
        get => NumGet(this, 1052, "uint")
        set => NumPut("uint", value, this, 1052)
    }

    /**
     * @type {Pointer}
     */
    dwCallbackId {
        get => NumGet(this, 1056, "ptr")
        set => NumPut("ptr", value, this, 1056)
    }

    /**
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 1064, "uint")
        set => NumPut("uint", value, this, 1064)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    szEncPassword {
        get => NumGet(this, 1072, "ptr")
        set => NumPut("ptr", value, this, 1072)
    }
}

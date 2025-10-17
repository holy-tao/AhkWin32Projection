#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASDIALPARAMSW extends Win32Struct
{
    static sizeof => 2128

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
        get => StrGet(this.ptr + 4, 256, "UTF-16")
        set => StrPut(value, this.ptr + 4, 256, "UTF-16")
    }

    /**
     * @type {String}
     */
    szPhoneNumber {
        get => StrGet(this.ptr + 518, 128, "UTF-16")
        set => StrPut(value, this.ptr + 518, 128, "UTF-16")
    }

    /**
     * @type {String}
     */
    szCallbackNumber {
        get => StrGet(this.ptr + 776, 128, "UTF-16")
        set => StrPut(value, this.ptr + 776, 128, "UTF-16")
    }

    /**
     * @type {String}
     */
    szUserName {
        get => StrGet(this.ptr + 1034, 256, "UTF-16")
        set => StrPut(value, this.ptr + 1034, 256, "UTF-16")
    }

    /**
     * @type {String}
     */
    szPassword {
        get => StrGet(this.ptr + 1548, 256, "UTF-16")
        set => StrPut(value, this.ptr + 1548, 256, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDomain {
        get => StrGet(this.ptr + 2062, 15, "UTF-16")
        set => StrPut(value, this.ptr + 2062, 15, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwSubEntry {
        get => NumGet(this, 2096, "uint")
        set => NumPut("uint", value, this, 2096)
    }

    /**
     * @type {Pointer}
     */
    dwCallbackId {
        get => NumGet(this, 2104, "ptr")
        set => NumPut("ptr", value, this, 2104)
    }

    /**
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 2112, "uint")
        set => NumPut("uint", value, this, 2112)
    }

    /**
     * @type {PWSTR}
     */
    szEncPassword {
        get => NumGet(this, 2120, "ptr")
        set => NumPut("ptr", value, this, 2120)
    }
}

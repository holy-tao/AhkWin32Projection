#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRIVER_VER_MAJORMINOR.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class DRIVER_VER_INFO extends Win32Struct
{
    static sizeof => 1104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwPlatform {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {String}
     */
    wszVersion {
        get => StrGet(this.ptr + 32, 259, "UTF-16")
        set => StrPut(value, this.ptr + 32, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszSignedBy {
        get => StrGet(this.ptr + 552, 259, "UTF-16")
        set => StrPut(value, this.ptr + 552, 259, "UTF-16")
    }

    /**
     * @type {Pointer<CERT_CONTEXT>}
     */
    pcSignerCertContext {
        get => NumGet(this, 1072, "ptr")
        set => NumPut("ptr", value, this, 1072)
    }

    /**
     * @type {DRIVER_VER_MAJORMINOR}
     */
    sOSVersionLow{
        get {
            if(!this.HasProp("__sOSVersionLow"))
                this.__sOSVersionLow := DRIVER_VER_MAJORMINOR(1080, this)
            return this.__sOSVersionLow
        }
    }

    /**
     * @type {DRIVER_VER_MAJORMINOR}
     */
    sOSVersionHigh{
        get {
            if(!this.HasProp("__sOSVersionHigh"))
                this.__sOSVersionHigh := DRIVER_VER_MAJORMINOR(1088, this)
            return this.__sOSVersionHigh
        }
    }

    /**
     * @type {Integer}
     */
    dwBuildNumberLow {
        get => NumGet(this, 1096, "uint")
        set => NumPut("uint", value, this, 1096)
    }

    /**
     * @type {Integer}
     */
    dwBuildNumberHigh {
        get => NumGet(this, 1100, "uint")
        set => NumPut("uint", value, this, 1100)
    }
}

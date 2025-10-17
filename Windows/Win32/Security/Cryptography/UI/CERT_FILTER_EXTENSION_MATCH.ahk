#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CERT_FILTER_EXTENSION_MATCH extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    szExtensionOID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwTestOperation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbTestData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbTestData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class HYPOTHESIS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Char>}
     */
    pwszClassName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwszDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    celt {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<HELPER_ATTRIBUTE>}
     */
    rgAttributes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

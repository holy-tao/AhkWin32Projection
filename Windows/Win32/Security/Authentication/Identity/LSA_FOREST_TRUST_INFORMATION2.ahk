#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_FOREST_TRUST_RECORD2.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class LSA_FOREST_TRUST_INFORMATION2 extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    RecordCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Pointer<LSA_FOREST_TRUST_RECORD2>>}
     */
    Entries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

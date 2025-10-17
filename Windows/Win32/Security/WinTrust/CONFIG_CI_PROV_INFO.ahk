#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CONFIG_CI_PROV_INFO_RESULT.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CONFIG_CI_PROV_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwPolicies {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    pPolicies {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CONFIG_CI_PROV_INFO_RESULT}
     */
    result{
        get {
            if(!this.HasProp("__result"))
                this.__result := CONFIG_CI_PROV_INFO_RESULT(16, this)
            return this.__result
        }
    }

    /**
     * @type {Integer}
     */
    dwScenario {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<CONFIG_CI_PROV_INFO_RESULT2>}
     */
    result2 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}

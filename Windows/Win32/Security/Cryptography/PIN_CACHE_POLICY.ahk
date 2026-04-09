#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PIN_CACHE_POLICY_TYPE.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class PIN_CACHE_POLICY extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PIN_CACHE_POLICY_TYPE}
     */
    PinCachePolicyType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwPinCachePolicyInfo {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

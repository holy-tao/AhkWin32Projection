#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RSNA_AKM_SUITE.ahk
#Include .\RSNA_CIPHER_SUITE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_AKM_CIPHER_PAIR extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {RSNA_AKM_SUITE}
     */
    akm {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {RSNA_CIPHER_SUITE}
     */
    cipher {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

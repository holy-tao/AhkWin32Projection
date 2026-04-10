#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\ExtensibleAuthenticationProtocol\EAP_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_EAP_RESULT extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFailureReasonCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<EAP_ATTRIBUTES>}
     */
    pAttribArray {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

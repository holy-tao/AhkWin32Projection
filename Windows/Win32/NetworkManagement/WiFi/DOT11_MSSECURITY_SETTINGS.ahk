#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\ExtensibleAuthenticationProtocol\EAP_METHOD_TYPE.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk
#Include ..\..\Security\ExtensibleAuthenticationProtocol\EAP_TYPE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_MSSECURITY_SETTINGS extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {DOT11_AUTH_ALGORITHM}
     */
    dot11AuthAlgorithm {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DOT11_CIPHER_ALGORITHM}
     */
    dot11CipherAlgorithm {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    fOneXEnabled {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {EAP_METHOD_TYPE}
     */
    eapMethodType {
        get {
            if(!this.HasProp("__eapMethodType"))
                this.__eapMethodType := EAP_METHOD_TYPE(12, this)
            return this.__eapMethodType
        }
    }

    /**
     * @type {Integer}
     */
    dwEapConnectionDataLen {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pEapConnectionData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

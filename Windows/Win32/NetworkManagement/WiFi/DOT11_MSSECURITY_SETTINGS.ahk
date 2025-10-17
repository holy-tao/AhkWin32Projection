#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\ExtensibleAuthenticationProtocol\EAP_TYPE.ahk
#Include ..\..\Security\ExtensibleAuthenticationProtocol\EAP_METHOD_TYPE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MSSECURITY_SETTINGS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dot11AuthAlgorithm {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
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
    eapMethodType{
        get {
            if(!this.HasProp("__eapMethodType"))
                this.__eapMethodType := EAP_METHOD_TYPE(16, this)
            return this.__eapMethodType
        }
    }

    /**
     * @type {Integer}
     */
    dwEapConnectionDataLen {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pEapConnectionData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

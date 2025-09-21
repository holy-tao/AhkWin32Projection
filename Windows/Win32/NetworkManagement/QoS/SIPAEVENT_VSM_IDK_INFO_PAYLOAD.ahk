#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SIPAEVENT_VSM_IDK_RSA_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class SIPAEVENT_VSM_IDK_INFO_PAYLOAD extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    KeyAlgID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {SIPAEVENT_VSM_IDK_RSA_INFO}
     */
    RsaKeyInfo{
        get {
            if(!this.HasProp("__RsaKeyInfo"))
                this.__RsaKeyInfo := SIPAEVENT_VSM_IDK_RSA_INFO(this.ptr + 8)
            return this.__RsaKeyInfo
        }
    }
}

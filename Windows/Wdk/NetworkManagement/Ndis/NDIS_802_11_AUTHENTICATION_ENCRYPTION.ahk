#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_AUTHENTICATION_MODE.ahk
#Include .\NDIS_802_11_WEP_STATUS.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_802_11_AUTHENTICATION_ENCRYPTION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {NDIS_802_11_AUTHENTICATION_MODE}
     */
    AuthModeSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {NDIS_802_11_WEP_STATUS}
     */
    EncryptStatusSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

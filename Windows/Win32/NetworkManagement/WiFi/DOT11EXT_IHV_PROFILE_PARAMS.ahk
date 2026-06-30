#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_BSS_TYPE.ahk
#Include .\DOT11EXT_IHV_SSID_LIST.ahk
#Include .\DOT11_MSSECURITY_SETTINGS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11EXT_IHV_PROFILE_PARAMS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<DOT11EXT_IHV_SSID_LIST>}
     */
    pSsidList {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DOT11_BSS_TYPE}
     */
    BssType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<DOT11_MSSECURITY_SETTINGS>}
     */
    pMSSecuritySettings {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

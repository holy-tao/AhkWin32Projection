#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GNSS_NI_USER_RESPONSE.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_NI_RESPONSE extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    RequestId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {GNSS_NI_USER_RESPONSE}
     */
    UserResponse {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}

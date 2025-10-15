#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Specifies search criteria for Bluetooth device searches.
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ns-bluetoothapis-bluetooth_device_search_params
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_DEVICE_SEARCH_PARAMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies that the search should return authenticated Bluetooth devices.
     * @type {BOOL}
     */
    fReturnAuthenticated{
        get {
            if(!this.HasProp("__fReturnAuthenticated"))
                this.__fReturnAuthenticated := BOOL(this.ptr + 4)
            return this.__fReturnAuthenticated
        }
    }

    /**
     * A value that specifies that the search should return remembered Bluetooth devices.
     * @type {BOOL}
     */
    fReturnRemembered{
        get {
            if(!this.HasProp("__fReturnRemembered"))
                this.__fReturnRemembered := BOOL(this.ptr + 8)
            return this.__fReturnRemembered
        }
    }

    /**
     * A value that specifies that the search should return unknown Bluetooth devices.
     * @type {BOOL}
     */
    fReturnUnknown{
        get {
            if(!this.HasProp("__fReturnUnknown"))
                this.__fReturnUnknown := BOOL(this.ptr + 12)
            return this.__fReturnUnknown
        }
    }

    /**
     * A value that specifies that the search should return connected Bluetooth devices.
     * @type {BOOL}
     */
    fReturnConnected{
        get {
            if(!this.HasProp("__fReturnConnected"))
                this.__fReturnConnected := BOOL(this.ptr + 16)
            return this.__fReturnConnected
        }
    }

    /**
     * A value that specifies that a new inquiry should be issued.
     * @type {BOOL}
     */
    fIssueInquiry{
        get {
            if(!this.HasProp("__fIssueInquiry"))
                this.__fIssueInquiry := BOOL(this.ptr + 20)
            return this.__fIssueInquiry
        }
    }

    /**
     * A value that indicates the time out for the inquiry, expressed in increments of 1.28 seconds. For example, an inquiry of 12.8 seconds has a <b>cTimeoutMultiplier</b> value of 10. The maximum value for this member is 48. When a value greater than 48 is used, the calling function immediately fails and returns <b>E_INVALIDARG</b>.
     * @type {Integer}
     */
    cTimeoutMultiplier {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * A handle for the radio on which to perform the inquiry. Set to <b>NULL</b> to perform the inquiry on all local Bluetooth radios.
     * @type {HANDLE}
     */
    hRadio{
        get {
            if(!this.HasProp("__hRadio"))
                this.__hRadio := HANDLE(this.ptr + 32)
            return this.__hRadio
        }
    }
}

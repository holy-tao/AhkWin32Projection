#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk
#Include .\BLUETOOTH_PIN_INFO.ahk
#Include .\BLUETOOTH_OOB_DATA_INFO.ahk

/**
 * BLUETOOTH_AUTHENTICATE_RESPONSE structure contains information passed in response to a BTH_REMOTE_AUTHENTICATE_REQUEST event.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authenticate_response
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_AUTHENTICATE_RESPONSE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_address_struct">BLUETOOTH_ADDRESS</a> structure that contains the address of the device requesting the authentication response.  
     * 
     * <div class="alert"><b>Note</b>  This information can be found in the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_authentication_callback_params">PBLUETOOTH_AUTHENTICATION_CALLBACK PARAMS</a> structure retrieved from the callback.</div>
     * <div> </div>
     * @type {BLUETOOTH_ADDRESS}
     */
    bthAddressRemote{
        get {
            if(!this.HasProp("__bthAddressRemote"))
                this.__bthAddressRemote := BLUETOOTH_ADDRESS(this.ptr + 0)
            return this.__bthAddressRemote
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_method">BLUETOOTH_AUTHENTICATION_METHOD</a> enumeration that defines the supported authentication method. 
     * 
     * <div class="alert"><b>Note</b>  This information can be found in the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_authentication_callback_params">PBLUETOOTH_AUTHENTICATION_CALLBACK PARAMS</a> structure retrieved from the callback.</div>
     * <div> </div>
     * @type {Integer}
     */
    authMethod {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {BLUETOOTH_PIN_INFO}
     */
    pinInfo{
        get {
            if(!this.HasProp("__pinInfo"))
                this.__pinInfo := BLUETOOTH_PIN_INFO(this.ptr + 24)
            return this.__pinInfo
        }
    }

    /**
     * @type {BLUETOOTH_OOB_DATA_INFO}
     */
    oobInfo{
        get {
            if(!this.HasProp("__oobInfo"))
                this.__oobInfo := BLUETOOTH_OOB_DATA_INFO(this.ptr + 24)
            return this.__oobInfo
        }
    }

    /**
     * @type {Integer}
     */
    numericCompInfo {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    passkeyInfo {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <b>TRUE</b> if the authentication request was rejected; otherwise <b>FALSE</b>.
     * @type {Integer}
     */
    negativeResponse {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk
#Include .\BLUETOOTH_PIN_INFO.ahk
#Include .\BLUETOOTH_OOB_DATA_INFO.ahk
#Include .\BLUETOOTH_NUMERIC_COMPARISON_INFO.ahk
#Include .\BLUETOOTH_PASSKEY_INFO.ahk

/**
 * BLUETOOTH_AUTHENTICATE_RESPONSE structure contains information passed in response to a BTH_REMOTE_AUTHENTICATE_REQUEST event.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authenticate_response
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_AUTHENTICATE_RESPONSE extends Win32Struct
{
    static sizeof => 56

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
                this.__bthAddressRemote := BLUETOOTH_ADDRESS(0, this)
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
                this.__pinInfo := BLUETOOTH_PIN_INFO(20, this)
            return this.__pinInfo
        }
    }

    /**
     * @type {BLUETOOTH_OOB_DATA_INFO}
     */
    oobInfo{
        get {
            if(!this.HasProp("__oobInfo"))
                this.__oobInfo := BLUETOOTH_OOB_DATA_INFO(20, this)
            return this.__oobInfo
        }
    }

    /**
     * @type {BLUETOOTH_NUMERIC_COMPARISON_INFO}
     */
    numericCompInfo{
        get {
            if(!this.HasProp("__numericCompInfo"))
                this.__numericCompInfo := BLUETOOTH_NUMERIC_COMPARISON_INFO(20, this)
            return this.__numericCompInfo
        }
    }

    /**
     * @type {BLUETOOTH_PASSKEY_INFO}
     */
    passkeyInfo{
        get {
            if(!this.HasProp("__passkeyInfo"))
                this.__passkeyInfo := BLUETOOTH_PASSKEY_INFO(20, this)
            return this.__passkeyInfo
        }
    }

    /**
     * <b>TRUE</b> if the authentication request was rejected; otherwise <b>FALSE</b>.
     * @type {Integer}
     */
    negativeResponse {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }
}

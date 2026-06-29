#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BLUETOOTH_PIN_INFO.ahk" { BLUETOOTH_PIN_INFO }
#Import ".\BLUETOOTH_AUTHENTICATION_METHOD.ahk" { BLUETOOTH_AUTHENTICATION_METHOD }
#Import ".\BLUETOOTH_NUMERIC_COMPARISON_INFO.ahk" { BLUETOOTH_NUMERIC_COMPARISON_INFO }
#Import ".\BLUETOOTH_PASSKEY_INFO.ahk" { BLUETOOTH_PASSKEY_INFO }
#Import ".\BLUETOOTH_OOB_DATA_INFO.ahk" { BLUETOOTH_OOB_DATA_INFO }
#Import ".\BLUETOOTH_ADDRESS.ahk" { BLUETOOTH_ADDRESS }

/**
 * BLUETOOTH_AUTHENTICATE_RESPONSE structure contains information passed in response to a BTH_REMOTE_AUTHENTICATE_REQUEST event.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authenticate_response
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_AUTHENTICATE_RESPONSE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_address_struct">BLUETOOTH_ADDRESS</a> structure that contains the address of the device requesting the authentication response.  
     * 
     * <div class="alert"><b>Note</b>  This information can be found in the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_authentication_callback_params">PBLUETOOTH_AUTHENTICATION_CALLBACK PARAMS</a> structure retrieved from the callback.</div>
     * <div> </div>
     */
    bthAddressRemote : BLUETOOTH_ADDRESS

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_method">BLUETOOTH_AUTHENTICATION_METHOD</a> enumeration that defines the supported authentication method. 
     * 
     * <div class="alert"><b>Note</b>  This information can be found in the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_authentication_callback_params">PBLUETOOTH_AUTHENTICATION_CALLBACK PARAMS</a> structure retrieved from the callback.</div>
     * <div> </div>
     */
    authMethod : BLUETOOTH_AUTHENTICATION_METHOD

    pinInfo : BLUETOOTH_PIN_INFO

    /**
     * <b>TRUE</b> if the authentication request was rejected; otherwise <b>FALSE</b>.
     */
    negativeResponse : Int8

    static __New() {
        DefineProp(this.Prototype, 'oobInfo', { type: BLUETOOTH_OOB_DATA_INFO, offset: 12 })
        DefineProp(this.Prototype, 'numericCompInfo', { type: BLUETOOTH_NUMERIC_COMPARISON_INFO, offset: 12 })
        DefineProp(this.Prototype, 'passkeyInfo', { type: BLUETOOTH_PASSKEY_INFO, offset: 12 })
        this.DeleteProp("__New")
    }
}

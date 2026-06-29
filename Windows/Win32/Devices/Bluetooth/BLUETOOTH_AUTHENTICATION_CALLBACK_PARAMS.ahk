#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BLUETOOTH_AUTHENTICATION_METHOD.ahk" { BLUETOOTH_AUTHENTICATION_METHOD }
#Import ".\BLUETOOTH_IO_CAPABILITY.ahk" { BLUETOOTH_IO_CAPABILITY }
#Import ".\BLUETOOTH_AUTHENTICATION_REQUIREMENTS.ahk" { BLUETOOTH_AUTHENTICATION_REQUIREMENTS }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\BLUETOOTH_DEVICE_INFO.ahk" { BLUETOOTH_DEVICE_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BLUETOOTH_ADDRESS.ahk" { BLUETOOTH_ADDRESS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS structure contains specific configuration information about the Bluetooth device responding to an authentication request.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authentication_callback_params
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure that contains information about a Bluetooth device.
     */
    deviceInfo : BLUETOOTH_DEVICE_INFO

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_method">BLUETOOTH_AUTHENTICATION_METHOD</a> enumeration that defines the authentication method utilized by the Bluetooth device.
     */
    authenticationMethod : BLUETOOTH_AUTHENTICATION_METHOD

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_io_capability">BLUETOOTH_IO_CAPABILITY</a> enumeration that defines the input/output capabilities of the Bluetooth device.
     */
    ioCapability : BLUETOOTH_IO_CAPABILITY

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_requirements">BLUETOOTH_AUTHENTICATION_REQUIREMENTS</a> specifies the 'Man in the Middle' protection required for authentication.
     */
    authenticationRequirements : BLUETOOTH_AUTHENTICATION_REQUIREMENTS

    Numeric_Value : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Passkey', { type: UInt32, offset: 572 })
        this.DeleteProp("__New")
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\BLUETOOTH_DEVICE_INFO.ahk

/**
 * BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS structure contains specific configuration information about the Bluetooth device responding to an authentication request.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authentication_callback_params
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS extends Win32Struct
{
    static sizeof => 584

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure that contains information about a Bluetooth device.
     * @type {BLUETOOTH_DEVICE_INFO}
     */
    deviceInfo{
        get {
            if(!this.HasProp("__deviceInfo"))
                this.__deviceInfo := BLUETOOTH_DEVICE_INFO(this.ptr + 0)
            return this.__deviceInfo
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_method">BLUETOOTH_AUTHENTICATION_METHOD</a> enumeration that defines the authentication method utilized by the Bluetooth device.
     * @type {Integer}
     */
    authenticationMethod {
        get => NumGet(this, 568, "int")
        set => NumPut("int", value, this, 568)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_io_capability">BLUETOOTH_IO_CAPABILITY</a> enumeration that defines the input/output capabilities of the Bluetooth device.
     * @type {Integer}
     */
    ioCapability {
        get => NumGet(this, 572, "int")
        set => NumPut("int", value, this, 572)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_requirements">BLUETOOTH_AUTHENTICATION_REQUIREMENTS</a> specifies the 'Man in the Middle' protection required for authentication.
     * @type {Integer}
     */
    authenticationRequirements {
        get => NumGet(this, 576, "int")
        set => NumPut("int", value, this, 576)
    }

    /**
     * @type {Integer}
     */
    Numeric_Value {
        get => NumGet(this, 580, "uint")
        set => NumPut("uint", value, this, 580)
    }

    /**
     * @type {Integer}
     */
    Passkey {
        get => NumGet(this, 580, "uint")
        set => NumPut("uint", value, this, 580)
    }
}

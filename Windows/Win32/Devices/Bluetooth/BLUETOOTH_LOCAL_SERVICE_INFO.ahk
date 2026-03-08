#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk

/**
 * Contains local service information for a Bluetooth device.
 * @remarks
 * In the event  the service is not associated with a specific device, <b>btAddr</b> should be set to <b>BTH_ADDR_NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_local_service_info_struct
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_LOCAL_SERVICE_INFO extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 8

    /**
     * If <b>TRUE</b>, specifies that the advertised services are enabled; otherwise the advertised services are disabled.
     * @type {BOOL}
     */
    Enabled {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_address_struct">BLUETOOTH_ADDRESS</a> structure that contains the address of a remote device. This address is used when advertising services to a device.
     * @type {BLUETOOTH_ADDRESS}
     */
    btAddr{
        get {
            if(!this.HasProp("__btAddr"))
                this.__btAddr := BLUETOOTH_ADDRESS(8, this)
            return this.__btAddr
        }
    }

    /**
     * The service name. The maximum length of this string, including the null terminator, is <b>BLUETOOTH_MAX_SERVICE_NAME_SIZE</b> (256).
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * The local device name, if any, such as  COM4 or LPT1. The maximum length of this string, including the null terminator, is <b>BLUETOOTH_DEVICE_NAME_SIZE</b> (256).
     * @type {String}
     */
    szDeviceString {
        get => StrGet(this.ptr + 536, 255, "UTF-16")
        set => StrPut(value, this.ptr + 536, 255, "UTF-16")
    }
}

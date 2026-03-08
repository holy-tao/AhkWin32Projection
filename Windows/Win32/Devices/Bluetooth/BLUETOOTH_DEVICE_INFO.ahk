#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The BLUETOOTH_DEVICE_INFO structure provides information about a Bluetooth device.
 * @remarks
 * See the [Bluetooth class-of-device (CoD) codes](https://www.bluetooth.com/specifications/assigned-numbers/baseband/) for more information.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_DEVICE_INFO extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * Size of the 
     * <b>BLUETOOTH_DEVICE_INFO</b> structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of the device.
     * @type {BLUETOOTH_ADDRESS}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := BLUETOOTH_ADDRESS(8, this)
            return this.__Address
        }
    }

    /**
     * Class of the device.
     * @type {Integer}
     */
    ulClassofDevice {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies whether the device is connected.
     * @type {BOOL}
     */
    fConnected {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies whether the device is a remembered device. Not all remembered devices are authenticated.
     * @type {BOOL}
     */
    fRemembered {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Specifies whether the device is authenticated, paired, or bonded. All authenticated devices are remembered.
     * @type {BOOL}
     */
    fAuthenticated {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Last time the device was seen, in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure.
     * @type {SYSTEMTIME}
     */
    stLastSeen{
        get {
            if(!this.HasProp("__stLastSeen"))
                this.__stLastSeen := SYSTEMTIME(40, this)
            return this.__stLastSeen
        }
    }

    /**
     * Last time the device was used, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure.
     * @type {SYSTEMTIME}
     */
    stLastUsed{
        get {
            if(!this.HasProp("__stLastUsed"))
                this.__stLastUsed := SYSTEMTIME(56, this)
            return this.__stLastUsed
        }
    }

    /**
     * Name of the device.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 72, 247, "UTF-16")
        set => StrPut(value, this.ptr + 72, 247, "UTF-16")
    }
}

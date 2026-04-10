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
 */
class BLUETOOTH_DEVICE_INFO extends Win32Struct {
    static sizeof => 560

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
    Address {
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies whether the device is connected.
     * @type {BOOL}
     */
    fConnected {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies whether the device is a remembered device. Not all remembered devices are authenticated.
     * @type {BOOL}
     */
    fRemembered {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies whether the device is authenticated, paired, or bonded. All authenticated devices are remembered.
     * @type {BOOL}
     */
    fAuthenticated {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Last time the device was seen, in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure.
     * @type {SYSTEMTIME}
     */
    stLastSeen {
        get {
            if(!this.HasProp("__stLastSeen"))
                this.__stLastSeen := SYSTEMTIME(32, this)
            return this.__stLastSeen
        }
    }

    /**
     * Last time the device was used, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure.
     * @type {SYSTEMTIME}
     */
    stLastUsed {
        get {
            if(!this.HasProp("__stLastUsed"))
                this.__stLastUsed := SYSTEMTIME(48, this)
            return this.__stLastUsed
        }
    }

    /**
     * Name of the device.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 64, 247, "UTF-16")
        set => StrPut(value, this.ptr + 64, 247, "UTF-16")
    }
}

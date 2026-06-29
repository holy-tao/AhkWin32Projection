#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\BLUETOOTH_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class BLUETOOTH_DEVICE_INFO extends Win32Struct {
    static sizeof => 560

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
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
     * @type {Integer}
     */
    ulClassofDevice {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    fConnected {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {BOOL}
     */
    fRemembered {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    fAuthenticated {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
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
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 64, 247, "UTF-16")
        set => StrPut(value, this.ptr + 64, 247, "UTF-16")
    }
}

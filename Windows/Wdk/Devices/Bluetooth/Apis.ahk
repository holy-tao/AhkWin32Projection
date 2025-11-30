#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\DEVPROPKEY.ahk

/**
 * @namespace Windows.Wdk.Devices.Bluetooth
 * @version v4.0.30319
 */
class Bluetooth {

;@region Constants

    /**
     * @type {Guid}
     */
    static GUID_BTHDDI_SDP_NODE_INTERFACE => Guid("{81a7fdf3-86c1-4be8-a8c8-2a6d188b4177}")

    /**
     * @type {Guid}
     */
    static GUID_BTHDDI_SDP_PARSE_INTERFACE => Guid("{4e719439-9cf1-4bab-ac1d-3279865743d2}")

    /**
     * @type {Guid}
     */
    static GUID_BTHDDI_PROFILE_DRIVER_INTERFACE => Guid("{94a59aa8-4383-4286-aa4f-34a160f40004}")

    /**
     * @type {Guid}
     */
    static GUID_BTH_DEVICE_INTERFACE => Guid("{00f40965-e89d-4487-9890-87c3abb211f4}")

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DeviceAddress {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_ServiceGUID {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DeviceFlags {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DeviceManufacturer {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DeviceModelNumber {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DeviceVIDSource {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DeviceVID {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DevicePID {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_DeviceProductVersion {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_ClassOfDevice_Deprecated {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_LastConnectedTime_Deprecated {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_ClassOfDevice {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_LastConnectedTime {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Bluetooth_LastSeenTime {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }
;@endregion Constants

;@region Methods
;@endregion Methods
}

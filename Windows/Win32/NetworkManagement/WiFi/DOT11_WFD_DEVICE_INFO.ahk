#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_DEVICE_TYPE.ahk
#Include .\DOT11_WPS_DEVICE_NAME.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_DEVICE_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    DeviceAddress{
        get {
            if(!this.HasProp("__DeviceAddressProxyArray"))
                this.__DeviceAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__DeviceAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ConfigMethods {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {DOT11_WFD_DEVICE_TYPE}
     */
    PrimaryDeviceType{
        get {
            if(!this.HasProp("__PrimaryDeviceType"))
                this.__PrimaryDeviceType := DOT11_WFD_DEVICE_TYPE(this.ptr + 16)
            return this.__PrimaryDeviceType
        }
    }

    /**
     * @type {DOT11_WPS_DEVICE_NAME}
     */
    DeviceName{
        get {
            if(!this.HasProp("__DeviceName"))
                this.__DeviceName := DOT11_WPS_DEVICE_NAME(this.ptr + 24)
            return this.__DeviceName
        }
    }
}

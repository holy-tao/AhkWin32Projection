#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Win32\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Wdk.Devices.Bluetooth
 */

;@region Constants

/**
 * @type {Guid}
 */
export global GUID_BTHDDI_SDP_NODE_INTERFACE := Guid("{81a7fdf3-86c1-4be8-a8c8-2a6d188b4177}")

/**
 * @type {Guid}
 */
export global GUID_BTHDDI_SDP_PARSE_INTERFACE := Guid("{4e719439-9cf1-4bab-ac1d-3279865743d2}")

/**
 * @type {Guid}
 */
export global GUID_BTHDDI_PROFILE_DRIVER_INTERFACE := Guid("{94a59aa8-4383-4286-aa4f-34a160f40004}")

/**
 * @type {Guid}
 */
export global GUID_BTH_DEVICE_INTERFACE := Guid("{00f40965-e89d-4487-9890-87c3abb211f4}")

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DeviceAddress := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DeviceAddress.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DeviceAddress.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_ServiceGUID := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_ServiceGUID.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_ServiceGUID.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DeviceFlags := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DeviceFlags.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DeviceFlags.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DeviceManufacturer := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DeviceManufacturer.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DeviceManufacturer.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DeviceModelNumber := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DeviceModelNumber.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DeviceModelNumber.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DeviceVIDSource := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DeviceVIDSource.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DeviceVIDSource.pid := 6

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DeviceVID := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DeviceVID.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DeviceVID.pid := 7

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DevicePID := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DevicePID.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DevicePID.pid := 8

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_DeviceProductVersion := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_DeviceProductVersion.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_DeviceProductVersion.pid := 9

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_ClassOfDevice_Deprecated := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_ClassOfDevice_Deprecated.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_ClassOfDevice_Deprecated.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_LastConnectedTime_Deprecated := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_LastConnectedTime_Deprecated.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_LastConnectedTime_Deprecated.pid := 5

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_ClassOfDevice := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_ClassOfDevice.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_ClassOfDevice.pid := 10

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_LastConnectedTime := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_LastConnectedTime.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_LastConnectedTime.pid := 11

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Bluetooth_LastSeenTime := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Bluetooth_LastSeenTime.fmtid),
    Guid.Ptr, Guid("{2bd67d8b-8beb-48d5-87e0-6cda3428040a}"),
    UInt32, 16)
DEVPKEY_Bluetooth_LastSeenTime.pid := 12
;@endregion Constants

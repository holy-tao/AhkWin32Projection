#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Devices.Sensors
 */

;@region Constants

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_SENSOR := Guid("{ba1bb692-9b7a-4833-9a1e-525ed134e7e2}")

/**
 * @type {Guid}
 */
export global SENSOR_EVENT_STATE_CHANGED := Guid("{bfd96016-6bd7-4560-ad34-f2f6607e8f81}")

/**
 * @type {Guid}
 */
export global SENSOR_EVENT_DATA_UPDATED := Guid("{2ed0f2a4-0087-41d3-87db-6773370b3c88}")

/**
 * @type {Guid}
 */
export global SENSOR_EVENT_PROPERTY_CHANGED := Guid("{2358f099-84c9-4d3d-90df-c2421e2b2045}")

/**
 * @type {Guid}
 */
export global SENSOR_EVENT_ACCELEROMETER_SHAKE := Guid("{825f5a94-0f48-4396-9ca0-6ecb5c99d915}")

/**
 * @type {Guid}
 */
export global SENSOR_EVENT_PARAMETER_COMMON_GUID := Guid("{64346e30-8728-4b34-bdf6-4f52442c5c28}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_EVENT_PARAMETER_EVENT_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_EVENT_PARAMETER_EVENT_ID.fmtid),
    Guid.Ptr, Guid("{64346e30-8728-4b34-bdf6-4f52442c5c28}"),
    UInt32, 16)
SENSOR_EVENT_PARAMETER_EVENT_ID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_EVENT_PARAMETER_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_EVENT_PARAMETER_STATE.fmtid),
    Guid.Ptr, Guid("{64346e30-8728-4b34-bdf6-4f52442c5c28}"),
    UInt32, 16)
SENSOR_EVENT_PARAMETER_STATE.pid := 3

/**
 * @type {Guid}
 */
export global SENSOR_ERROR_PARAMETER_COMMON_GUID := Guid("{77112bcd-fce1-4f43-b8b8-a88256adb4b3}")

/**
 * @type {Guid}
 */
export global SENSOR_PROPERTY_COMMON_GUID := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_TYPE.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_TYPE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_STATE.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_STATE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_MANUFACTURER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_MANUFACTURER.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_MANUFACTURER.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_MODEL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_MODEL.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_MODEL.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_SERIAL_NUMBER := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_SERIAL_NUMBER.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_SERIAL_NUMBER.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_FRIENDLY_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_FRIENDLY_NAME.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_FRIENDLY_NAME.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_DESCRIPTION.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_CONNECTION_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_CONNECTION_TYPE.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_CONNECTION_TYPE.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_MIN_REPORT_INTERVAL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_MIN_REPORT_INTERVAL.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_MIN_REPORT_INTERVAL.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_CHANGE_SENSITIVITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_CHANGE_SENSITIVITY.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_CHANGE_SENSITIVITY.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_DEVICE_PATH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_DEVICE_PATH.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_DEVICE_PATH.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_LIGHT_RESPONSE_CURVE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_LIGHT_RESPONSE_CURVE.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_LIGHT_RESPONSE_CURVE.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_ACCURACY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_ACCURACY.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_ACCURACY.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_RESOLUTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_RESOLUTION.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_RESOLUTION.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_RANGE_MINIMUM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_RANGE_MINIMUM.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_RANGE_MINIMUM.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_RANGE_MAXIMUM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_RANGE_MAXIMUM.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_RANGE_MAXIMUM.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_HID_USAGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_HID_USAGE.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_HID_USAGE.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_RADIO_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_RADIO_STATE.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_RADIO_STATE.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_RADIO_STATE_PREVIOUS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_RADIO_STATE_PREVIOUS.fmtid),
    Guid.Ptr, Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"),
    UInt32, 16)
SENSOR_PROPERTY_RADIO_STATE_PREVIOUS.pid := 24

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_ALL := Guid("{c317c286-c468-4288-9975-d4c4587c442c}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_LOCATION := Guid("{bfa794e4-f964-4fdb-90f6-51056bfe4b44}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_ENVIRONMENTAL := Guid("{323439aa-7f66-492b-ba0c-73e9aa0a65d5}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_MOTION := Guid("{cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_ORIENTATION := Guid("{9e6c04b6-96fe-4954-b726-68682a473f69}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_MECHANICAL := Guid("{8d131d68-8ef7-4656-80b5-cccbd93791c5}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_ELECTRICAL := Guid("{fb73fcd8-fc4a-483c-ac58-27b691c6beff}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_BIOMETRIC := Guid("{ca19690f-a2c7-477d-a99e-99ec6e2b5648}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_LIGHT := Guid("{17a665c0-9063-4216-b202-5c7a255e18ce}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_SCANNER := Guid("{b000e77e-f5b5-420f-815d-0270a726f270}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_OTHER := Guid("{2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d}")

/**
 * @type {Guid}
 */
export global SENSOR_CATEGORY_UNSUPPORTED := Guid("{2beae7fa-19b0-48c5-a1f6-b5480dc206b0}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_LOCATION_GPS := Guid("{ed4ca589-327a-4ff9-a560-91da4b48275e}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_LOCATION_STATIC := Guid("{095f8184-0fa9-4445-8e6e-b70f320b6b4c}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_LOCATION_LOOKUP := Guid("{3b2eae4a-72ce-436d-96d2-3c5b8570e987}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_LOCATION_TRIANGULATION := Guid("{691c341a-5406-4fe1-942f-2246cbeb39e0}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_LOCATION_OTHER := Guid("{9b2d0566-0368-4f71-b88d-533f132031de}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_LOCATION_BROADCAST := Guid("{d26988cf-5162-4039-bb17-4c58b698e44a}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_LOCATION_DEAD_RECKONING := Guid("{1a37d538-f28b-42da-9fce-a9d0a2a6d829}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ENVIRONMENTAL_TEMPERATURE := Guid("{04fd0ec4-d5da-45fa-95a9-5db38ee19306}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ENVIRONMENTAL_ATMOSPHERIC_PRESSURE := Guid("{0e903829-ff8a-4a93-97df-3dcbde402288}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ENVIRONMENTAL_HUMIDITY := Guid("{5c72bf67-bd7e-4257-990b-98a3ba3b400a}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ENVIRONMENTAL_WIND_SPEED := Guid("{dd50607b-a45f-42cd-8efd-ec61761c4226}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ENVIRONMENTAL_WIND_DIRECTION := Guid("{9ef57a35-9306-434d-af09-37fa5a9c00bd}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ACCELEROMETER_1D := Guid("{c04d2387-7340-4cc2-991e-3b18cb8ef2f4}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ACCELEROMETER_2D := Guid("{b2c517a8-f6b5-4ba6-a423-5df560b4cc07}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ACCELEROMETER_3D := Guid("{c2fb0f5f-e2d2-4c78-bcd0-352a9582819d}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_MOTION_DETECTOR := Guid("{5c7c1a12-30a5-43b9-a4b2-cf09ec5b7be8}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_GYROMETER_1D := Guid("{fa088734-f552-4584-8324-edfaf649652c}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_GYROMETER_2D := Guid("{31ef4f83-919b-48bf-8de0-5d7a9d240556}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_GYROMETER_3D := Guid("{09485f5a-759e-42c2-bd4b-a349b75c8643}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_SPEEDOMETER := Guid("{6bd73c1f-0bb4-4310-81b2-dfc18a52bf94}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_COMPASS_1D := Guid("{a415f6c5-cb50-49d0-8e62-a8270bd7a26c}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_COMPASS_2D := Guid("{15655cc0-997a-4d30-84db-57caba3648bb}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_COMPASS_3D := Guid("{76b5ce0d-17dd-414d-93a1-e127f40bdf6e}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_INCLINOMETER_1D := Guid("{b96f98c5-7a75-4ba7-94e9-ac868c966dd8}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_INCLINOMETER_2D := Guid("{ab140f6d-83eb-4264-b70b-b16a5b256a01}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_INCLINOMETER_3D := Guid("{b84919fb-ea85-4976-8444-6f6f5c6d31db}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_DISTANCE_1D := Guid("{5f14ab2f-1407-4306-a93f-b1dbabe4f9c0}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_DISTANCE_2D := Guid("{5cf9a46c-a9a2-4e55-b6a1-a04aafa95a92}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_DISTANCE_3D := Guid("{a20cae31-0e25-4772-9fe5-96608a1354b2}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_AGGREGATED_QUADRANT_ORIENTATION := Guid("{9f81f1af-c4ab-4307-9904-c828bfb90829}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_AGGREGATED_DEVICE_ORIENTATION := Guid("{cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_AGGREGATED_SIMPLE_DEVICE_ORIENTATION := Guid("{86a19291-0482-402c-bf4c-addac52b1c39}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_VOLTAGE := Guid("{c5484637-4fb7-4953-98b8-a56d8aa1fb1e}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_CURRENT := Guid("{5adc9fce-15a0-4bbe-a1ad-2d38a9ae831c}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_CAPACITANCE := Guid("{ca2ffb1c-2317-49c0-a0b4-b63ce63461a0}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_RESISTANCE := Guid("{9993d2c8-c157-4a52-a7b5-195c76037231}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_INDUCTANCE := Guid("{dc1d933f-c435-4c7d-a2fe-607192a524d3}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_ELECTRICAL_POWER := Guid("{212f10f5-14ab-4376-9a43-a7794098c2fe}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_POTENTIOMETER := Guid("{2b3681a9-cadc-45aa-a6ff-54957c8bb440}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_FREQUENCY := Guid("{8cd2cbb6-73e6-4640-a709-72ae8fb60d7f}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_BOOLEAN_SWITCH := Guid("{9c7e371f-1041-460b-8d5c-71e4752e350c}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_MULTIVALUE_SWITCH := Guid("{b3ee4d76-37a4-4402-b25e-99c60a775fa1}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_FORCE := Guid("{c2ab2b02-1a1c-4778-a81b-954a1788cc75}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_SCALE := Guid("{c06dd92c-7feb-438e-9bf6-82207fff5bb8}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_PRESSURE := Guid("{26d31f34-6352-41cf-b793-ea0713d53d77}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_STRAIN := Guid("{c6d1ec0e-6803-4361-ad3d-85bcc58c6d29}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_BOOLEAN_SWITCH_ARRAY := Guid("{545c8ba5-b143-4545-868f-ca7fd986b4f6}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_HUMAN_PRESENCE := Guid("{c138c12b-ad52-451c-9375-87f518ff10c6}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_HUMAN_PROXIMITY := Guid("{5220dae9-3179-4430-9f90-06266d2a34de}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_TOUCH := Guid("{17db3018-06c4-4f7d-81af-9274b7599c27}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_AMBIENT_LIGHT := Guid("{97f115c8-599a-4153-8894-d2d12899918a}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_RFID_SCANNER := Guid("{44328ef5-02dd-4e8d-ad5d-9249832b2eca}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_BARCODE_SCANNER := Guid("{990b3d8f-85bb-45ff-914d-998c04f372df}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_CUSTOM := Guid("{e83af229-8640-4d18-a213-e22675ebb2c3}")

/**
 * @type {Guid}
 */
export global SENSOR_TYPE_UNKNOWN := Guid("{10ba83e3-ef4f-41ed-9885-a87d6435a8e1}")

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_COMMON_GUID := Guid("{db5e0cf2-cf1f-4c18-b46c-d86011d62150}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_TIMESTAMP := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_TIMESTAMP.fmtid),
    Guid.Ptr, Guid("{db5e0cf2-cf1f-4c18-b46c-d86011d62150}"),
    UInt32, 16)
SENSOR_DATA_TYPE_TIMESTAMP.pid := 2

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_LOCATION_GUID := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_LATITUDE_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_LATITUDE_DEGREES.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_LATITUDE_DEGREES.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_LONGITUDE_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_LONGITUDE_DEGREES.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_LONGITUDE_DEGREES.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SPEED_KNOTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SPEED_KNOTS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SPEED_KNOTS.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_VARIATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_VARIATION.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_VARIATION.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_FIX_QUALITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_FIX_QUALITY.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_FIX_QUALITY.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_FIX_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_FIX_TYPE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_FIX_TYPE.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_POSITION_DILUTION_OF_PRECISION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_POSITION_DILUTION_OF_PRECISION.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_POSITION_DILUTION_OF_PRECISION.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_HORIZONAL_DILUTION_OF_PRECISION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_HORIZONAL_DILUTION_OF_PRECISION.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_HORIZONAL_DILUTION_OF_PRECISION.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_VERTICAL_DILUTION_OF_PRECISION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_VERTICAL_DILUTION_OF_PRECISION.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_VERTICAL_DILUTION_OF_PRECISION.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_USED_COUNT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_USED_COUNT.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_USED_COUNT.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_USED_PRNS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_USED_PRNS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_USED_PRNS.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_IN_VIEW := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_IN_VIEW.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_IN_VIEW.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_PRNS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_PRNS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_PRNS.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ELEVATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ELEVATION.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ELEVATION.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_AZIMUTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_AZIMUTH.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_AZIMUTH.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_STN_RATIO := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_STN_RATIO.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_STN_RATIO.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ERROR_RADIUS_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ERROR_RADIUS_METERS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ERROR_RADIUS_METERS.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ADDRESS1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ADDRESS1.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ADDRESS1.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ADDRESS2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ADDRESS2.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ADDRESS2.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CITY.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CITY.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_STATE_PROVINCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_STATE_PROVINCE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_STATE_PROVINCE.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_POSTALCODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_POSTALCODE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_POSTALCODE.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_COUNTRY_REGION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_COUNTRY_REGION.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_COUNTRY_REGION.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_GPS_SELECTION_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_GPS_SELECTION_MODE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_GPS_SELECTION_MODE.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_GPS_OPERATION_MODE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_GPS_OPERATION_MODE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_GPS_OPERATION_MODE.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_GPS_STATUS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_GPS_STATUS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_GPS_STATUS.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_GEOIDAL_SEPARATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_GEOIDAL_SEPARATION.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_GEOIDAL_SEPARATION.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_DGPS_DATA_AGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_DGPS_DATA_AGE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_DGPS_DATA_AGE.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ALTITUDE_ANTENNA_SEALEVEL_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ALTITUDE_ANTENNA_SEALEVEL_METERS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ALTITUDE_ANTENNA_SEALEVEL_METERS.pid := 36

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_DIFFERENTIAL_REFERENCE_STATION_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_DIFFERENTIAL_REFERENCE_STATION_ID.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_DIFFERENTIAL_REFERENCE_STATION_ID.pid := 37

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_NMEA_SENTENCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_NMEA_SENTENCE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_NMEA_SENTENCE.pid := 38

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ID.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ID.pid := 39

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_LOCATION_SOURCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_LOCATION_SOURCE.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_LOCATION_SOURCE.pid := 40

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SATELLITES_USED_PRNS_AND_CONSTELLATIONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SATELLITES_USED_PRNS_AND_CONSTELLATIONS.fmtid),
    Guid.Ptr, Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SATELLITES_USED_PRNS_AND_CONSTELLATIONS.pid := 41

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_ENVIRONMENTAL_GUID := Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS.fmtid),
    Guid.Ptr, Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_RELATIVE_HUMIDITY_PERCENT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_RELATIVE_HUMIDITY_PERCENT.fmtid),
    Guid.Ptr, Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_RELATIVE_HUMIDITY_PERCENT.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ATMOSPHERIC_PRESSURE_BAR := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ATMOSPHERIC_PRESSURE_BAR.fmtid),
    Guid.Ptr, Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ATMOSPHERIC_PRESSURE_BAR.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_WIND_DIRECTION_DEGREES_ANTICLOCKWISE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_WIND_DIRECTION_DEGREES_ANTICLOCKWISE.fmtid),
    Guid.Ptr, Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_WIND_DIRECTION_DEGREES_ANTICLOCKWISE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_WIND_SPEED_METERS_PER_SECOND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_WIND_SPEED_METERS_PER_SECOND.fmtid),
    Guid.Ptr, Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}"),
    UInt32, 16)
SENSOR_DATA_TYPE_WIND_SPEED_METERS_PER_SECOND.pid := 6

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_MOTION_GUID := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ACCELERATION_X_G := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ACCELERATION_X_G.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ACCELERATION_X_G.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ACCELERATION_Y_G := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ACCELERATION_Y_G.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ACCELERATION_Y_G.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ACCELERATION_Z_G := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ACCELERATION_Z_G.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ACCELERATION_Z_G.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_X_DEGREES_PER_SECOND_SQUARED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_X_DEGREES_PER_SECOND_SQUARED.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_X_DEGREES_PER_SECOND_SQUARED.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Y_DEGREES_PER_SECOND_SQUARED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Y_DEGREES_PER_SECOND_SQUARED.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Y_DEGREES_PER_SECOND_SQUARED.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Z_DEGREES_PER_SECOND_SQUARED := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Z_DEGREES_PER_SECOND_SQUARED.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Z_DEGREES_PER_SECOND_SQUARED.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SPEED_METERS_PER_SECOND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SPEED_METERS_PER_SECOND.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SPEED_METERS_PER_SECOND.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MOTION_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MOTION_STATE.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MOTION_STATE.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ANGULAR_VELOCITY_X_DEGREES_PER_SECOND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ANGULAR_VELOCITY_X_DEGREES_PER_SECOND.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ANGULAR_VELOCITY_X_DEGREES_PER_SECOND.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Y_DEGREES_PER_SECOND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Y_DEGREES_PER_SECOND.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Y_DEGREES_PER_SECOND.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Z_DEGREES_PER_SECOND := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Z_DEGREES_PER_SECOND.fmtid),
    Guid.Ptr, Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Z_DEGREES_PER_SECOND.pid := 12

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_ORIENTATION_GUID := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_TILT_X_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_TILT_X_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_TILT_X_DEGREES.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_TILT_Y_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_TILT_Y_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_TILT_Y_DEGREES.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_TILT_Z_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_TILT_Z_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_TILT_Z_DEGREES.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_X_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_X_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_X_DEGREES.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_Y_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_Y_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_Y_DEGREES.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_Z_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_Z_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_Z_DEGREES.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_DISTANCE_X_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_DISTANCE_X_METERS.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_DISTANCE_X_METERS.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_DISTANCE_Y_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_DISTANCE_Y_METERS.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_DISTANCE_Y_METERS.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_DISTANCE_Z_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_DISTANCE_Z_METERS.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_DISTANCE_Z_METERS.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_MAGNETIC_NORTH_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_MAGNETIC_NORTH_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_MAGNETIC_NORTH_DEGREES.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_TRUE_NORTH_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_TRUE_NORTH_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_TRUE_NORTH_DEGREES.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_MAGNETIC_NORTH_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_MAGNETIC_NORTH_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_MAGNETIC_NORTH_DEGREES.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_HEADING_TRUE_NORTH_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_HEADING_TRUE_NORTH_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_HEADING_TRUE_NORTH_DEGREES.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_QUADRANT_ANGLE_DEGREES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_QUADRANT_ANGLE_DEGREES.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_QUADRANT_ANGLE_DEGREES.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ROTATION_MATRIX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ROTATION_MATRIX.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ROTATION_MATRIX.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_QUATERNION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_QUATERNION.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_QUATERNION.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_SIMPLE_DEVICE_ORIENTATION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_SIMPLE_DEVICE_ORIENTATION.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_SIMPLE_DEVICE_ORIENTATION.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_X_MILLIGAUSS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_X_MILLIGAUSS.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_X_MILLIGAUSS.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Y_MILLIGAUSS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Y_MILLIGAUSS.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Y_MILLIGAUSS.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Z_MILLIGAUSS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Z_MILLIGAUSS.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Z_MILLIGAUSS.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MAGNETOMETER_ACCURACY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MAGNETOMETER_ACCURACY.fmtid),
    Guid.Ptr, Guid("{1637d8a2-4248-4275-865d-558de84aedfd}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MAGNETOMETER_ACCURACY.pid := 22

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_GUID_MECHANICAL_GUID := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_BOOLEAN_SWITCH_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_BOOLEAN_SWITCH_STATE.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_BOOLEAN_SWITCH_STATE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_MULTIVALUE_SWITCH_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_MULTIVALUE_SWITCH_STATE.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_MULTIVALUE_SWITCH_STATE.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_FORCE_NEWTONS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_FORCE_NEWTONS.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_FORCE_NEWTONS.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ABSOLUTE_PRESSURE_PASCAL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ABSOLUTE_PRESSURE_PASCAL.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ABSOLUTE_PRESSURE_PASCAL.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_GAUGE_PRESSURE_PASCAL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_GAUGE_PRESSURE_PASCAL.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_GAUGE_PRESSURE_PASCAL.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_STRAIN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_STRAIN.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_STRAIN.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_WEIGHT_KILOGRAMS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_WEIGHT_KILOGRAMS.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_WEIGHT_KILOGRAMS.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_BOOLEAN_SWITCH_ARRAY_STATES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_BOOLEAN_SWITCH_ARRAY_STATES.fmtid),
    Guid.Ptr, Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"),
    UInt32, 16)
SENSOR_DATA_TYPE_BOOLEAN_SWITCH_ARRAY_STATES.pid := 10

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_BIOMETRIC_GUID := Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_HUMAN_PRESENCE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_HUMAN_PRESENCE.fmtid),
    Guid.Ptr, Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}"),
    UInt32, 16)
SENSOR_DATA_TYPE_HUMAN_PRESENCE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_HUMAN_PROXIMITY_METERS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_HUMAN_PROXIMITY_METERS.fmtid),
    Guid.Ptr, Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}"),
    UInt32, 16)
SENSOR_DATA_TYPE_HUMAN_PROXIMITY_METERS.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_TOUCH_STATE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_TOUCH_STATE.fmtid),
    Guid.Ptr, Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}"),
    UInt32, 16)
SENSOR_DATA_TYPE_TOUCH_STATE.pid := 4

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_LIGHT_GUID := Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_LIGHT_LEVEL_LUX := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_LIGHT_LEVEL_LUX.fmtid),
    Guid.Ptr, Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}"),
    UInt32, 16)
SENSOR_DATA_TYPE_LIGHT_LEVEL_LUX.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_LIGHT_TEMPERATURE_KELVIN := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_LIGHT_TEMPERATURE_KELVIN.fmtid),
    Guid.Ptr, Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}"),
    UInt32, 16)
SENSOR_DATA_TYPE_LIGHT_TEMPERATURE_KELVIN.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_LIGHT_CHROMACITY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_LIGHT_CHROMACITY.fmtid),
    Guid.Ptr, Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}"),
    UInt32, 16)
SENSOR_DATA_TYPE_LIGHT_CHROMACITY.pid := 4

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_SCANNER_GUID := Guid("{d7a59a3c-3421-44ab-8d3a-9de8ab6c4cae}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_RFID_TAG_40_BIT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_RFID_TAG_40_BIT.fmtid),
    Guid.Ptr, Guid("{d7a59a3c-3421-44ab-8d3a-9de8ab6c4cae}"),
    UInt32, 16)
SENSOR_DATA_TYPE_RFID_TAG_40_BIT.pid := 2

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_ELECTRICAL_GUID := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_VOLTAGE_VOLTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_VOLTAGE_VOLTS.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_VOLTAGE_VOLTS.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CURRENT_AMPS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CURRENT_AMPS.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CURRENT_AMPS.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CAPACITANCE_FARAD := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CAPACITANCE_FARAD.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CAPACITANCE_FARAD.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_RESISTANCE_OHMS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_RESISTANCE_OHMS.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_RESISTANCE_OHMS.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_INDUCTANCE_HENRY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_INDUCTANCE_HENRY.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_INDUCTANCE_HENRY.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ELECTRICAL_POWER_WATTS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ELECTRICAL_POWER_WATTS.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ELECTRICAL_POWER_WATTS.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ELECTRICAL_PERCENT_OF_RANGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ELECTRICAL_PERCENT_OF_RANGE.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ELECTRICAL_PERCENT_OF_RANGE.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_ELECTRICAL_FREQUENCY_HERTZ := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_ELECTRICAL_FREQUENCY_HERTZ.fmtid),
    Guid.Ptr, Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}"),
    UInt32, 16)
SENSOR_DATA_TYPE_ELECTRICAL_FREQUENCY_HERTZ.pid := 9

/**
 * @type {Guid}
 */
export global SENSOR_DATA_TYPE_CUSTOM_GUID := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_USAGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_USAGE.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_USAGE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_BOOLEAN_ARRAY := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_BOOLEAN_ARRAY.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_BOOLEAN_ARRAY.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE1 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE1.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE1.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE2 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE2.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE2.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE3 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE3.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE3.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE4 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE4.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE4.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE5 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE5.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE5.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE6 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE6.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE6.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE7 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE7.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE7.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE8 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE8.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE8.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE9 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE9.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE9.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE10 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE10.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE10.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE11 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE11.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE11.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE12 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE12.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE12.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE13 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE13.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE13.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE14 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE14.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE14.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE15 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE15.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE15.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE16 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE16.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE16.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE17 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE17.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE17.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE18 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE18.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE18.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE19 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE19.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE19.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE20 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE20.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE20.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE21 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE21.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE21.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE22 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE22.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE22.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE23 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE23.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE23.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE24 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE24.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE24.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE25 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE25.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE25.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE26 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE26.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE26.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE27 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE27.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE27.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_DATA_TYPE_CUSTOM_VALUE28 := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_DATA_TYPE_CUSTOM_VALUE28.fmtid),
    Guid.Ptr, Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"),
    UInt32, 16)
SENSOR_DATA_TYPE_CUSTOM_VALUE28.pid := 34

/**
 * @type {Guid}
 */
export global SENSOR_PROPERTY_TEST_GUID := Guid("{e1e962f4-6e65-45f7-9c36-d487b7b1bd34}")

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_CLEAR_ASSISTANCE_DATA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_CLEAR_ASSISTANCE_DATA.fmtid),
    Guid.Ptr, Guid("{e1e962f4-6e65-45f7-9c36-d487b7b1bd34}"),
    UInt32, 16)
SENSOR_PROPERTY_CLEAR_ASSISTANCE_DATA.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SENSOR_PROPERTY_TURN_ON_OFF_NMEA := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SENSOR_PROPERTY_TURN_ON_OFF_NMEA.fmtid),
    Guid.Ptr, Guid("{e1e962f4-6e65-45f7-9c36-d487b7b1bd34}"),
    UInt32, 16)
SENSOR_PROPERTY_TURN_ON_OFF_NMEA.pid := 3

/**
 * @type {Integer (UInt32)}
 */
export global GNSS_CLEAR_ALL_ASSISTANCE_DATA := 1

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_All := Guid("{c317c286-c468-4288-9975-d4c4587c442c}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Biometric := Guid("{ca19690f-a2c7-477d-a99e-99ec6e2b5648}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Electrical := Guid("{fb73fcd8-fc4a-483c-ac58-27b691c6beff}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Environmental := Guid("{323439aa-7f66-492b-ba0c-73e9aa0a65d5}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Light := Guid("{17a665c0-9063-4216-b202-5c7a255e18ce}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Location := Guid("{bfa794e4-f964-4fdb-90f6-51056bfe4b44}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Mechanical := Guid("{8d131d68-8ef7-4656-80b5-cccbd93791c5}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Motion := Guid("{cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Orientation := Guid("{9e6c04b6-96fe-4954-b726-68682a473f69}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Other := Guid("{2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_PersonalActivity := Guid("{f1609081-1e12-412b-a14d-cbb0e95bd2e5}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Scanner := Guid("{b000e77e-f5b5-420f-815d-0270a726f270}")

/**
 * @type {Guid}
 */
export global GUID_SensorCategory_Unsupported := Guid("{2beae7fa-19b0-48c5-a1f6-b5480dc206b0}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Accelerometer3D := Guid("{c2fb0f5f-e2d2-4c78-bcd0-352a9582819d}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_ActivityDetection := Guid("{9d9e0118-1807-4f2e-96e4-2ce57142e196}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_AmbientLight := Guid("{97f115c8-599a-4153-8894-d2d12899918a}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Barometer := Guid("{0e903829-ff8a-4a93-97df-3dcbde402288}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Custom := Guid("{e83af229-8640-4d18-a213-e22675ebb2c3}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_FloorElevation := Guid("{ade4987f-7ac4-4dfa-9722-0a027181c747}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_GeomagneticOrientation := Guid("{e77195f8-2d1f-4823-971b-1c4467556c9d}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_GravityVector := Guid("{03b52c73-bb76-463f-9524-38de76eb700b}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Gyrometer3D := Guid("{09485f5a-759e-42c2-bd4b-a349b75c8643}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Humidity := Guid("{5c72bf67-bd7e-4257-990b-98a3ba3b400a}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_LinearAccelerometer := Guid("{038b0283-97b4-41c8-bc24-5ff1aa48fec7}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Magnetometer3D := Guid("{55e5effb-15c7-40df-8698-a84b7c863c53}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Orientation := Guid("{cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Pedometer := Guid("{b19f89af-e3eb-444b-8dea-202575a71599}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Proximity := Guid("{5220dae9-3179-4430-9f90-06266d2a34de}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_RelativeOrientation := Guid("{40993b51-4706-44dc-98d5-c920c037ffab}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_SimpleDeviceOrientation := Guid("{86a19291-0482-402c-bf4c-addac52b1c39}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_Temperature := Guid("{04fd0ec4-d5da-45fa-95a9-5db38ee19306}")

/**
 * @type {Guid}
 */
export global GUID_SensorType_HingeAngle := Guid("{82358065-f4c4-4da1-b272-13c23332a207}")

/**
 * @type {Integer (UInt32)}
 */
export global SENSOR_PROPERTY_LIST_HEADER_SIZE := 8
;@endregion Constants

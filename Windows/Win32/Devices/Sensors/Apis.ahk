#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class Sensors {

;@region Constants

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_SENSOR => Guid("{ba1bb692-9b7a-4833-9a1e-525ed134e7e2}")

    /**
     * @type {Guid}
     */
    static SENSOR_EVENT_STATE_CHANGED => Guid("{bfd96016-6bd7-4560-ad34-f2f6607e8f81}")

    /**
     * @type {Guid}
     */
    static SENSOR_EVENT_DATA_UPDATED => Guid("{2ed0f2a4-0087-41d3-87db-6773370b3c88}")

    /**
     * @type {Guid}
     */
    static SENSOR_EVENT_PROPERTY_CHANGED => Guid("{2358f099-84c9-4d3d-90df-c2421e2b2045}")

    /**
     * @type {Guid}
     */
    static SENSOR_EVENT_ACCELEROMETER_SHAKE => Guid("{825f5a94-0f48-4396-9ca0-6ecb5c99d915}")

    /**
     * @type {Guid}
     */
    static SENSOR_EVENT_PARAMETER_COMMON_GUID => Guid("{64346e30-8728-4b34-bdf6-4f52442c5c28}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_EVENT_PARAMETER_EVENT_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64346e30-8728-4b34-bdf6-4f52442c5c28}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_EVENT_PARAMETER_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{64346e30-8728-4b34-bdf6-4f52442c5c28}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_ERROR_PARAMETER_COMMON_GUID => Guid("{77112bcd-fce1-4f43-b8b8-a88256adb4b3}")

    /**
     * @type {Guid}
     */
    static SENSOR_PROPERTY_COMMON_GUID => Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_MANUFACTURER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_MODEL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_SERIAL_NUMBER {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_FRIENDLY_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_CONNECTION_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_MIN_REPORT_INTERVAL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_CHANGE_SENSITIVITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_DEVICE_PATH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_LIGHT_RESPONSE_CURVE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_ACCURACY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_RESOLUTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_RANGE_MINIMUM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_RANGE_MAXIMUM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_HID_USAGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_RADIO_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_RADIO_STATE_PREVIOUS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_ALL => Guid("{c317c286-c468-4288-9975-d4c4587c442c}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_LOCATION => Guid("{bfa794e4-f964-4fdb-90f6-51056bfe4b44}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_ENVIRONMENTAL => Guid("{323439aa-7f66-492b-ba0c-73e9aa0a65d5}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_MOTION => Guid("{cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_ORIENTATION => Guid("{9e6c04b6-96fe-4954-b726-68682a473f69}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_MECHANICAL => Guid("{8d131d68-8ef7-4656-80b5-cccbd93791c5}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_ELECTRICAL => Guid("{fb73fcd8-fc4a-483c-ac58-27b691c6beff}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_BIOMETRIC => Guid("{ca19690f-a2c7-477d-a99e-99ec6e2b5648}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_LIGHT => Guid("{17a665c0-9063-4216-b202-5c7a255e18ce}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_SCANNER => Guid("{b000e77e-f5b5-420f-815d-0270a726f270}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_OTHER => Guid("{2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d}")

    /**
     * @type {Guid}
     */
    static SENSOR_CATEGORY_UNSUPPORTED => Guid("{2beae7fa-19b0-48c5-a1f6-b5480dc206b0}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_LOCATION_GPS => Guid("{ed4ca589-327a-4ff9-a560-91da4b48275e}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_LOCATION_STATIC => Guid("{095f8184-0fa9-4445-8e6e-b70f320b6b4c}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_LOCATION_LOOKUP => Guid("{3b2eae4a-72ce-436d-96d2-3c5b8570e987}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_LOCATION_TRIANGULATION => Guid("{691c341a-5406-4fe1-942f-2246cbeb39e0}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_LOCATION_OTHER => Guid("{9b2d0566-0368-4f71-b88d-533f132031de}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_LOCATION_BROADCAST => Guid("{d26988cf-5162-4039-bb17-4c58b698e44a}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_LOCATION_DEAD_RECKONING => Guid("{1a37d538-f28b-42da-9fce-a9d0a2a6d829}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_TEMPERATURE => Guid("{04fd0ec4-d5da-45fa-95a9-5db38ee19306}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_ATMOSPHERIC_PRESSURE => Guid("{0e903829-ff8a-4a93-97df-3dcbde402288}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_HUMIDITY => Guid("{5c72bf67-bd7e-4257-990b-98a3ba3b400a}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_WIND_SPEED => Guid("{dd50607b-a45f-42cd-8efd-ec61761c4226}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_WIND_DIRECTION => Guid("{9ef57a35-9306-434d-af09-37fa5a9c00bd}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ACCELEROMETER_1D => Guid("{c04d2387-7340-4cc2-991e-3b18cb8ef2f4}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ACCELEROMETER_2D => Guid("{b2c517a8-f6b5-4ba6-a423-5df560b4cc07}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ACCELEROMETER_3D => Guid("{c2fb0f5f-e2d2-4c78-bcd0-352a9582819d}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_MOTION_DETECTOR => Guid("{5c7c1a12-30a5-43b9-a4b2-cf09ec5b7be8}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_GYROMETER_1D => Guid("{fa088734-f552-4584-8324-edfaf649652c}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_GYROMETER_2D => Guid("{31ef4f83-919b-48bf-8de0-5d7a9d240556}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_GYROMETER_3D => Guid("{09485f5a-759e-42c2-bd4b-a349b75c8643}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_SPEEDOMETER => Guid("{6bd73c1f-0bb4-4310-81b2-dfc18a52bf94}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_COMPASS_1D => Guid("{a415f6c5-cb50-49d0-8e62-a8270bd7a26c}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_COMPASS_2D => Guid("{15655cc0-997a-4d30-84db-57caba3648bb}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_COMPASS_3D => Guid("{76b5ce0d-17dd-414d-93a1-e127f40bdf6e}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_INCLINOMETER_1D => Guid("{b96f98c5-7a75-4ba7-94e9-ac868c966dd8}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_INCLINOMETER_2D => Guid("{ab140f6d-83eb-4264-b70b-b16a5b256a01}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_INCLINOMETER_3D => Guid("{b84919fb-ea85-4976-8444-6f6f5c6d31db}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_DISTANCE_1D => Guid("{5f14ab2f-1407-4306-a93f-b1dbabe4f9c0}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_DISTANCE_2D => Guid("{5cf9a46c-a9a2-4e55-b6a1-a04aafa95a92}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_DISTANCE_3D => Guid("{a20cae31-0e25-4772-9fe5-96608a1354b2}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_AGGREGATED_QUADRANT_ORIENTATION => Guid("{9f81f1af-c4ab-4307-9904-c828bfb90829}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_AGGREGATED_DEVICE_ORIENTATION => Guid("{cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_AGGREGATED_SIMPLE_DEVICE_ORIENTATION => Guid("{86a19291-0482-402c-bf4c-addac52b1c39}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_VOLTAGE => Guid("{c5484637-4fb7-4953-98b8-a56d8aa1fb1e}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_CURRENT => Guid("{5adc9fce-15a0-4bbe-a1ad-2d38a9ae831c}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_CAPACITANCE => Guid("{ca2ffb1c-2317-49c0-a0b4-b63ce63461a0}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_RESISTANCE => Guid("{9993d2c8-c157-4a52-a7b5-195c76037231}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_INDUCTANCE => Guid("{dc1d933f-c435-4c7d-a2fe-607192a524d3}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_ELECTRICAL_POWER => Guid("{212f10f5-14ab-4376-9a43-a7794098c2fe}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_POTENTIOMETER => Guid("{2b3681a9-cadc-45aa-a6ff-54957c8bb440}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_FREQUENCY => Guid("{8cd2cbb6-73e6-4640-a709-72ae8fb60d7f}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_BOOLEAN_SWITCH => Guid("{9c7e371f-1041-460b-8d5c-71e4752e350c}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_MULTIVALUE_SWITCH => Guid("{b3ee4d76-37a4-4402-b25e-99c60a775fa1}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_FORCE => Guid("{c2ab2b02-1a1c-4778-a81b-954a1788cc75}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_SCALE => Guid("{c06dd92c-7feb-438e-9bf6-82207fff5bb8}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_PRESSURE => Guid("{26d31f34-6352-41cf-b793-ea0713d53d77}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_STRAIN => Guid("{c6d1ec0e-6803-4361-ad3d-85bcc58c6d29}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_BOOLEAN_SWITCH_ARRAY => Guid("{545c8ba5-b143-4545-868f-ca7fd986b4f6}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_HUMAN_PRESENCE => Guid("{c138c12b-ad52-451c-9375-87f518ff10c6}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_HUMAN_PROXIMITY => Guid("{5220dae9-3179-4430-9f90-06266d2a34de}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_TOUCH => Guid("{17db3018-06c4-4f7d-81af-9274b7599c27}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_AMBIENT_LIGHT => Guid("{97f115c8-599a-4153-8894-d2d12899918a}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_RFID_SCANNER => Guid("{44328ef5-02dd-4e8d-ad5d-9249832b2eca}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_BARCODE_SCANNER => Guid("{990b3d8f-85bb-45ff-914d-998c04f372df}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_CUSTOM => Guid("{e83af229-8640-4d18-a213-e22675ebb2c3}")

    /**
     * @type {Guid}
     */
    static SENSOR_TYPE_UNKNOWN => Guid("{10ba83e3-ef4f-41ed-9885-a87d6435a8e1}")

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_COMMON_GUID => Guid("{db5e0cf2-cf1f-4c18-b46c-d86011d62150}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_TIMESTAMP {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{db5e0cf2-cf1f-4c18-b46c-d86011d62150}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_LOCATION_GUID => Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_LATITUDE_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_LONGITUDE_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SPEED_KNOTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_VARIATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_FIX_QUALITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_FIX_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_POSITION_DILUTION_OF_PRECISION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_HORIZONAL_DILUTION_OF_PRECISION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_VERTICAL_DILUTION_OF_PRECISION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_USED_COUNT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_USED_PRNS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_IN_VIEW {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_PRNS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ELEVATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_AZIMUTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_STN_RATIO {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ERROR_RADIUS_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ADDRESS1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ADDRESS2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_STATE_PROVINCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_POSTALCODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_COUNTRY_REGION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_GPS_SELECTION_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_GPS_OPERATION_MODE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_GPS_STATUS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_GEOIDAL_SEPARATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_DGPS_DATA_AGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ALTITUDE_ANTENNA_SEALEVEL_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_DIFFERENTIAL_REFERENCE_STATION_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 37
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_NMEA_SENTENCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 38
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_IN_VIEW_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 39
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_LOCATION_SOURCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 40
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SATELLITES_USED_PRNS_AND_CONSTELLATIONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 41
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_ENVIRONMENTAL_GUID => Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_RELATIVE_HUMIDITY_PERCENT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ATMOSPHERIC_PRESSURE_BAR {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_WIND_DIRECTION_DEGREES_ANTICLOCKWISE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_WIND_SPEED_METERS_PER_SECOND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_MOTION_GUID => Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ACCELERATION_X_G {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ACCELERATION_Y_G {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ACCELERATION_Z_G {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_X_DEGREES_PER_SECOND_SQUARED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Y_DEGREES_PER_SECOND_SQUARED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ANGULAR_ACCELERATION_Z_DEGREES_PER_SECOND_SQUARED {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SPEED_METERS_PER_SECOND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MOTION_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ANGULAR_VELOCITY_X_DEGREES_PER_SECOND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Y_DEGREES_PER_SECOND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ANGULAR_VELOCITY_Z_DEGREES_PER_SECOND {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{3f8a69a2-07c5-4e48-a965-cd797aab56d5}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_ORIENTATION_GUID => Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_TILT_X_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_TILT_Y_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_TILT_Z_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_X_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_Y_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_Z_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_DISTANCE_X_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_DISTANCE_Y_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_DISTANCE_Z_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_MAGNETIC_NORTH_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_COMPENSATED_TRUE_NORTH_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_MAGNETIC_NORTH_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_HEADING_TRUE_NORTH_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_QUADRANT_ANGLE_DEGREES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ROTATION_MATRIX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_QUATERNION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_SIMPLE_DEVICE_ORIENTATION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_X_MILLIGAUSS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Y_MILLIGAUSS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETIC_FIELD_STRENGTH_Z_MILLIGAUSS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MAGNETOMETER_ACCURACY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{1637d8a2-4248-4275-865d-558de84aedfd}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_GUID_MECHANICAL_GUID => Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_BOOLEAN_SWITCH_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_MULTIVALUE_SWITCH_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_FORCE_NEWTONS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ABSOLUTE_PRESSURE_PASCAL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_GAUGE_PRESSURE_PASCAL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_STRAIN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_WEIGHT_KILOGRAMS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_BOOLEAN_SWITCH_ARRAY_STATES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_BIOMETRIC_GUID => Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_HUMAN_PRESENCE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_HUMAN_PROXIMITY_METERS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_TOUCH_STATE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{2299288a-6d9e-4b0b-b7ec-3528f89e40af}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_LIGHT_GUID => Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_LIGHT_LEVEL_LUX {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_LIGHT_TEMPERATURE_KELVIN {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_LIGHT_CHROMACITY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e4c77ce2-dcb7-46e9-8439-4fec548833a6}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_SCANNER_GUID => Guid("{d7a59a3c-3421-44ab-8d3a-9de8ab6c4cae}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_RFID_TAG_40_BIT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d7a59a3c-3421-44ab-8d3a-9de8ab6c4cae}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_ELECTRICAL_GUID => Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_VOLTAGE_VOLTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CURRENT_AMPS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CAPACITANCE_FARAD {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_RESISTANCE_OHMS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_INDUCTANCE_HENRY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ELECTRICAL_POWER_WATTS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ELECTRICAL_PERCENT_OF_RANGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_ELECTRICAL_FREQUENCY_HERTZ {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{bbb246d1-e242-4780-a2d3-cded84f35842}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_DATA_TYPE_CUSTOM_GUID => Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_USAGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_BOOLEAN_ARRAY {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE1 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE2 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE3 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE4 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE5 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE6 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE7 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE8 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE9 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE10 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE11 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE12 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE13 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE14 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE15 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE16 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE17 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE18 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE19 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE20 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE21 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE22 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE23 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE24 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE25 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE26 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE27 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_DATA_TYPE_CUSTOM_VALUE28 {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static SENSOR_PROPERTY_TEST_GUID => Guid("{e1e962f4-6e65-45f7-9c36-d487b7b1bd34}")

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_CLEAR_ASSISTANCE_DATA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e1e962f4-6e65-45f7-9c36-d487b7b1bd34}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SENSOR_PROPERTY_TURN_ON_OFF_NMEA {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{e1e962f4-6e65-45f7-9c36-d487b7b1bd34}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_CLEAR_ALL_ASSISTANCE_DATA => 1

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_All => Guid("{c317c286-c468-4288-9975-d4c4587c442c}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Biometric => Guid("{ca19690f-a2c7-477d-a99e-99ec6e2b5648}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Electrical => Guid("{fb73fcd8-fc4a-483c-ac58-27b691c6beff}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Environmental => Guid("{323439aa-7f66-492b-ba0c-73e9aa0a65d5}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Light => Guid("{17a665c0-9063-4216-b202-5c7a255e18ce}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Location => Guid("{bfa794e4-f964-4fdb-90f6-51056bfe4b44}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Mechanical => Guid("{8d131d68-8ef7-4656-80b5-cccbd93791c5}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Motion => Guid("{cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Orientation => Guid("{9e6c04b6-96fe-4954-b726-68682a473f69}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Other => Guid("{2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_PersonalActivity => Guid("{f1609081-1e12-412b-a14d-cbb0e95bd2e5}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Scanner => Guid("{b000e77e-f5b5-420f-815d-0270a726f270}")

    /**
     * @type {Guid}
     */
    static GUID_SensorCategory_Unsupported => Guid("{2beae7fa-19b0-48c5-a1f6-b5480dc206b0}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Accelerometer3D => Guid("{c2fb0f5f-e2d2-4c78-bcd0-352a9582819d}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_ActivityDetection => Guid("{9d9e0118-1807-4f2e-96e4-2ce57142e196}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_AmbientLight => Guid("{97f115c8-599a-4153-8894-d2d12899918a}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Barometer => Guid("{0e903829-ff8a-4a93-97df-3dcbde402288}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Custom => Guid("{e83af229-8640-4d18-a213-e22675ebb2c3}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_FloorElevation => Guid("{ade4987f-7ac4-4dfa-9722-0a027181c747}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_GeomagneticOrientation => Guid("{e77195f8-2d1f-4823-971b-1c4467556c9d}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_GravityVector => Guid("{03b52c73-bb76-463f-9524-38de76eb700b}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Gyrometer3D => Guid("{09485f5a-759e-42c2-bd4b-a349b75c8643}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Humidity => Guid("{5c72bf67-bd7e-4257-990b-98a3ba3b400a}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_LinearAccelerometer => Guid("{038b0283-97b4-41c8-bc24-5ff1aa48fec7}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Magnetometer3D => Guid("{55e5effb-15c7-40df-8698-a84b7c863c53}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Orientation => Guid("{cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Pedometer => Guid("{b19f89af-e3eb-444b-8dea-202575a71599}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Proximity => Guid("{5220dae9-3179-4430-9f90-06266d2a34de}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_RelativeOrientation => Guid("{40993b51-4706-44dc-98d5-c920c037ffab}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_SimpleDeviceOrientation => Guid("{86a19291-0482-402c-bf4c-addac52b1c39}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_Temperature => Guid("{04fd0ec4-d5da-45fa-95a9-5db38ee19306}")

    /**
     * @type {Guid}
     */
    static GUID_SensorType_HingeAngle => Guid("{82358065-f4c4-4da1-b272-13c23332a207}")

    /**
     * @type {Integer (UInt32)}
     */
    static SENSOR_PROPERTY_LIST_HEADER_SIZE => 8
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Integer>} TimeMs 
     * @returns {NTSTATUS} 
     */
    static GetPerformanceTime(TimeMs) {
        TimeMsMarshal := TimeMs is VarRef ? "uint*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\GetPerformanceTime", TimeMsMarshal, TimeMs, "int")
        return result
    }

    /**
     * 
     * @param {Float} fltVal 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    static InitPropVariantFromFloat(fltVal, ppropvar) {
        result := DllCall("SensorsUtilsV2.dll\InitPropVariantFromFloat", "float", fltVal, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {BOOLEAN} TypeCheck 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetPropVariant(pList, pKey, TypeCheck, pValue) {
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetPropVariant", "ptr", pList, "ptr", pKey, "char", TypeCheck, "ptr", pValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {BOOLEAN} TypeCheck 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeySetPropVariant(pList, pKey, TypeCheck, pValue) {
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeySetPropVariant", "ptr", pList, "ptr", pKey, "char", TypeCheck, "ptr", pValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<FILETIME>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetFileTime(pList, pKey, pRetValue) {
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetFileTime", "ptr", pList, "ptr", pKey, "ptr", pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<Guid>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetGuid(pList, pKey, pRetValue) {
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetGuid", "ptr", pList, "ptr", pKey, "ptr", pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<BOOL>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetBool(pList, pKey, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "int*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetBool", "ptr", pList, "ptr", pKey, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<Integer>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetUlong(pList, pKey, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "uint*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetUlong", "ptr", pList, "ptr", pKey, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<Integer>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetUshort(pList, pKey, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "ushort*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetUshort", "ptr", pList, "ptr", pKey, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<Float>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetFloat(pList, pKey, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "float*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetFloat", "ptr", pList, "ptr", pKey, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<Float>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetDouble(pList, pKey, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "double*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetDouble", "ptr", pList, "ptr", pKey, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<Integer>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetInt32(pList, pKey, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "int*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetInt32", "ptr", pList, "ptr", pKey, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<Integer>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetInt64(pList, pKey, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "int64*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetInt64", "ptr", pList, "ptr", pKey, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Integer} Occurrence 
     * @param {Pointer<Integer>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetNthUlong(pList, pKey, Occurrence, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "uint*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthUlong", "ptr", pList, "ptr", pKey, "uint", Occurrence, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Integer} Occurrence 
     * @param {Pointer<Integer>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetNthUshort(pList, pKey, Occurrence, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "ushort*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthUshort", "ptr", pList, "ptr", pKey, "uint", Occurrence, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Integer} Occurrence 
     * @param {Pointer<Integer>} pRetValue 
     * @returns {NTSTATUS} 
     */
    static PropKeyFindKeyGetNthInt64(pList, pKey, Occurrence, pRetValue) {
        pRetValueMarshal := pRetValue is VarRef ? "int64*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthInt64", "ptr", pList, "ptr", pKey, "uint", Occurrence, pRetValueMarshal, pRetValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_PROPERTY_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {BOOLEAN} 
     */
    static IsKeyPresentInPropertyList(pList, pKey) {
        result := DllCall("SensorsUtilsV2.dll\IsKeyPresentInPropertyList", "ptr", pList, "ptr", pKey, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {BOOLEAN} 
     */
    static IsKeyPresentInCollectionList(pList, pKey) {
        result := DllCall("SensorsUtilsV2.dll\IsKeyPresentInCollectionList", "ptr", pList, "ptr", pKey, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} ListA 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} ListB 
     * @returns {BOOLEAN} 
     */
    static IsCollectionListSame(ListA, ListB) {
        result := DllCall("SensorsUtilsV2.dll\IsCollectionListSame", "ptr", ListA, "ptr", ListB, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} PropVariantValue 
     * @param {Pointer<Integer>} PropVariantOffset 
     * @param {Pointer<Integer>} PropVariantSize 
     * @param {Pointer<Pointer<Void>>} PropVariantPointer 
     * @param {Pointer<Integer>} RemappedType 
     * @returns {NTSTATUS} 
     */
    static PropVariantGetInformation(PropVariantValue, PropVariantOffset, PropVariantSize, PropVariantPointer, RemappedType) {
        PropVariantOffsetMarshal := PropVariantOffset is VarRef ? "uint*" : "ptr"
        PropVariantSizeMarshal := PropVariantSize is VarRef ? "uint*" : "ptr"
        PropVariantPointerMarshal := PropVariantPointer is VarRef ? "ptr*" : "ptr"
        RemappedTypeMarshal := RemappedType is VarRef ? "uint*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\PropVariantGetInformation", "ptr", PropVariantValue, PropVariantOffsetMarshal, PropVariantOffset, PropVariantSizeMarshal, PropVariantSize, PropVariantPointerMarshal, PropVariantPointer, RemappedTypeMarshal, RemappedType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_PROPERTY_LIST>} Target 
     * @param {Pointer<SENSOR_PROPERTY_LIST>} Source 
     * @returns {NTSTATUS} 
     */
    static PropertiesListCopy(Target, Source) {
        result := DllCall("SensorsUtilsV2.dll\PropertiesListCopy", "ptr", Target, "ptr", Source, "int")
        return result
    }

    /**
     * 
     * @param {Integer} BufferSizeBytes 
     * @returns {Integer} 
     */
    static PropertiesListGetFillableCount(BufferSizeBytes) {
        result := DllCall("SensorsUtilsV2.dll\PropertiesListGetFillableCount", "uint", BufferSizeBytes, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
     * @returns {Integer} 
     */
    static CollectionsListGetMarshalledSize(Collection) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListGetMarshalledSize", "ptr", Collection, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} Target 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} Source 
     * @returns {NTSTATUS} 
     */
    static CollectionsListCopyAndMarshall(Target, Source) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListCopyAndMarshall", "ptr", Target, "ptr", Source, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} Target 
     * @returns {NTSTATUS} 
     */
    static CollectionsListMarshall(Target) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListMarshall", "ptr", Target, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
     * @returns {Integer} 
     */
    static CollectionsListGetMarshalledSizeWithoutSerialization(Collection) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListGetMarshalledSizeWithoutSerialization", "ptr", Collection, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
     * @returns {NTSTATUS} 
     */
    static CollectionsListUpdateMarshalledPointer(Collection) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListUpdateMarshalledPointer", "ptr", Collection, "int")
        return result
    }

    /**
     * 
     * @param {Integer} SizeInBytes 
     * @param {Pointer<Pointer<Integer>>} pBuffer 
     * @returns {NTSTATUS} 
     */
    static SerializationBufferAllocate(SizeInBytes, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\SerializationBufferAllocate", "uint", SizeInBytes, pBufferMarshal, pBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Buffer 
     * @returns {String} Nothing - always returns an empty string
     */
    static SerializationBufferFree(Buffer) {
        BufferMarshal := Buffer is VarRef ? "char*" : "ptr"

        DllCall("SensorsUtilsV2.dll\SerializationBufferFree", BufferMarshal, Buffer)
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
     * @returns {Integer} 
     */
    static CollectionsListGetSerializedSize(Collection) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListGetSerializedSize", "ptr", Collection, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} SourceCollection 
     * @param {Integer} TargetBufferSizeInBytes 
     * @param {Pointer} TargetBuffer 
     * @returns {NTSTATUS} 
     */
    static CollectionsListSerializeToBuffer(SourceCollection, TargetBufferSizeInBytes, TargetBuffer) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListSerializeToBuffer", "ptr", SourceCollection, "uint", TargetBufferSizeInBytes, "ptr", TargetBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} SourceCollection 
     * @param {Pointer<Integer>} pTargetBufferSizeInBytes 
     * @param {Pointer<Pointer<Integer>>} pTargetBuffer 
     * @returns {NTSTATUS} 
     */
    static CollectionsListAllocateBufferAndSerialize(SourceCollection, pTargetBufferSizeInBytes, pTargetBuffer) {
        pTargetBufferSizeInBytesMarshal := pTargetBufferSizeInBytes is VarRef ? "uint*" : "ptr"
        pTargetBufferMarshal := pTargetBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("SensorsUtilsV2.dll\CollectionsListAllocateBufferAndSerialize", "ptr", SourceCollection, pTargetBufferSizeInBytesMarshal, pTargetBufferSizeInBytes, pTargetBufferMarshal, pTargetBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Integer} SourceBufferSizeInBytes 
     * @param {Pointer} SourceBuffer 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} TargetCollection 
     * @returns {NTSTATUS} 
     */
    static CollectionsListDeserializeFromBuffer(SourceBufferSizeInBytes, SourceBuffer, TargetCollection) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListDeserializeFromBuffer", "uint", SourceBufferSizeInBytes, "ptr", SourceBuffer, "ptr", TargetCollection, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pSensorsList 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {NTSTATUS} 
     */
    static SensorCollectionGetAt(Index, pSensorsList, pKey, pValue) {
        result := DllCall("SensorsUtilsV2.dll\SensorCollectionGetAt", "uint", Index, "ptr", pSensorsList, "ptr", pKey, "ptr", pValue, "int")
        return result
    }

    /**
     * 
     * @param {Integer} BufferSizeBytes 
     * @returns {Integer} 
     */
    static CollectionsListGetFillableCount(BufferSizeBytes) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListGetFillableCount", "uint", BufferSizeBytes, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} newSample 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} oldSample 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} thresholds 
     * @returns {BOOLEAN} 
     */
    static EvaluateActivityThresholds(newSample, oldSample, thresholds) {
        result := DllCall("SensorsUtilsV2.dll\EvaluateActivityThresholds", "ptr", newSample, "ptr", oldSample, "ptr", thresholds, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} thresholds 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} pCollection 
     * @returns {NTSTATUS} 
     */
    static CollectionsListSortSubscribedActivitiesByConfidence(thresholds, pCollection) {
        result := DllCall("SensorsUtilsV2.dll\CollectionsListSortSubscribedActivitiesByConfidence", "ptr", thresholds, "ptr", pCollection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} members 
     * @param {Integer} size 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    static InitPropVariantFromCLSIDArray(members, size, ppropvar) {
        result := DllCall("SensorsUtilsV2.dll\InitPropVariantFromCLSIDArray", "ptr", members, "uint", size, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SENSOR_COLLECTION_LIST>} subscriptionList 
     * @param {Guid} currentType 
     * @returns {BOOLEAN} 
     */
    static IsSensorSubscribed(subscriptionList, currentType) {
        result := DllCall("SensorsUtilsV2.dll\IsSensorSubscribed", "ptr", subscriptionList, "ptr", currentType, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidArray 
     * @param {Integer} arrayLength 
     * @param {Pointer<Guid>} guidElem 
     * @returns {BOOLEAN} 
     */
    static IsGUIDPresentInList(guidArray, arrayLength, guidElem) {
        result := DllCall("SensorsUtilsV2.dll\IsGUIDPresentInList", "ptr", guidArray, "uint", arrayLength, "ptr", guidElem, "char")
        return result
    }

;@endregion Methods
}

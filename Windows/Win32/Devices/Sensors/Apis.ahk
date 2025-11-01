#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class Sensors {

;@region Constants

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_SENSOR => "{ba1bb692-9b7a-4833-9a1e-525ed134e7e2}"

    /**
     * @type {String}
     */
    static SENSOR_EVENT_STATE_CHANGED => "{bfd96016-6bd7-4560-ad34-f2f6607e8f81}"

    /**
     * @type {String}
     */
    static SENSOR_EVENT_DATA_UPDATED => "{2ed0f2a4-0087-41d3-87db-6773370b3c88}"

    /**
     * @type {String}
     */
    static SENSOR_EVENT_PROPERTY_CHANGED => "{2358f099-84c9-4d3d-90df-c2421e2b2045}"

    /**
     * @type {String}
     */
    static SENSOR_EVENT_ACCELEROMETER_SHAKE => "{825f5a94-0f48-4396-9ca0-6ecb5c99d915}"

    /**
     * @type {String}
     */
    static SENSOR_EVENT_PARAMETER_COMMON_GUID => "{64346e30-8728-4b34-bdf6-4f52442c5c28}"

    /**
     * @type {String}
     */
    static SENSOR_ERROR_PARAMETER_COMMON_GUID => "{77112bcd-fce1-4f43-b8b8-a88256adb4b3}"

    /**
     * @type {String}
     */
    static SENSOR_PROPERTY_COMMON_GUID => "{7f8383ec-d3ec-495c-a8cf-b8bbe85c2920}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_ALL => "{c317c286-c468-4288-9975-d4c4587c442c}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_LOCATION => "{bfa794e4-f964-4fdb-90f6-51056bfe4b44}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_ENVIRONMENTAL => "{323439aa-7f66-492b-ba0c-73e9aa0a65d5}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_MOTION => "{cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_ORIENTATION => "{9e6c04b6-96fe-4954-b726-68682a473f69}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_MECHANICAL => "{8d131d68-8ef7-4656-80b5-cccbd93791c5}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_ELECTRICAL => "{fb73fcd8-fc4a-483c-ac58-27b691c6beff}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_BIOMETRIC => "{ca19690f-a2c7-477d-a99e-99ec6e2b5648}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_LIGHT => "{17a665c0-9063-4216-b202-5c7a255e18ce}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_SCANNER => "{b000e77e-f5b5-420f-815d-0270a726f270}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_OTHER => "{2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d}"

    /**
     * @type {String}
     */
    static SENSOR_CATEGORY_UNSUPPORTED => "{2beae7fa-19b0-48c5-a1f6-b5480dc206b0}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_LOCATION_GPS => "{ed4ca589-327a-4ff9-a560-91da4b48275e}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_LOCATION_STATIC => "{095f8184-0fa9-4445-8e6e-b70f320b6b4c}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_LOCATION_LOOKUP => "{3b2eae4a-72ce-436d-96d2-3c5b8570e987}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_LOCATION_TRIANGULATION => "{691c341a-5406-4fe1-942f-2246cbeb39e0}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_LOCATION_OTHER => "{9b2d0566-0368-4f71-b88d-533f132031de}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_LOCATION_BROADCAST => "{d26988cf-5162-4039-bb17-4c58b698e44a}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_LOCATION_DEAD_RECKONING => "{1a37d538-f28b-42da-9fce-a9d0a2a6d829}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_TEMPERATURE => "{04fd0ec4-d5da-45fa-95a9-5db38ee19306}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_ATMOSPHERIC_PRESSURE => "{0e903829-ff8a-4a93-97df-3dcbde402288}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_HUMIDITY => "{5c72bf67-bd7e-4257-990b-98a3ba3b400a}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_WIND_SPEED => "{dd50607b-a45f-42cd-8efd-ec61761c4226}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ENVIRONMENTAL_WIND_DIRECTION => "{9ef57a35-9306-434d-af09-37fa5a9c00bd}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ACCELEROMETER_1D => "{c04d2387-7340-4cc2-991e-3b18cb8ef2f4}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ACCELEROMETER_2D => "{b2c517a8-f6b5-4ba6-a423-5df560b4cc07}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ACCELEROMETER_3D => "{c2fb0f5f-e2d2-4c78-bcd0-352a9582819d}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_MOTION_DETECTOR => "{5c7c1a12-30a5-43b9-a4b2-cf09ec5b7be8}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_GYROMETER_1D => "{fa088734-f552-4584-8324-edfaf649652c}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_GYROMETER_2D => "{31ef4f83-919b-48bf-8de0-5d7a9d240556}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_GYROMETER_3D => "{09485f5a-759e-42c2-bd4b-a349b75c8643}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_SPEEDOMETER => "{6bd73c1f-0bb4-4310-81b2-dfc18a52bf94}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_COMPASS_1D => "{a415f6c5-cb50-49d0-8e62-a8270bd7a26c}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_COMPASS_2D => "{15655cc0-997a-4d30-84db-57caba3648bb}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_COMPASS_3D => "{76b5ce0d-17dd-414d-93a1-e127f40bdf6e}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_INCLINOMETER_1D => "{b96f98c5-7a75-4ba7-94e9-ac868c966dd8}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_INCLINOMETER_2D => "{ab140f6d-83eb-4264-b70b-b16a5b256a01}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_INCLINOMETER_3D => "{b84919fb-ea85-4976-8444-6f6f5c6d31db}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_DISTANCE_1D => "{5f14ab2f-1407-4306-a93f-b1dbabe4f9c0}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_DISTANCE_2D => "{5cf9a46c-a9a2-4e55-b6a1-a04aafa95a92}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_DISTANCE_3D => "{a20cae31-0e25-4772-9fe5-96608a1354b2}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_AGGREGATED_QUADRANT_ORIENTATION => "{9f81f1af-c4ab-4307-9904-c828bfb90829}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_AGGREGATED_DEVICE_ORIENTATION => "{cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_AGGREGATED_SIMPLE_DEVICE_ORIENTATION => "{86a19291-0482-402c-bf4c-addac52b1c39}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_VOLTAGE => "{c5484637-4fb7-4953-98b8-a56d8aa1fb1e}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_CURRENT => "{5adc9fce-15a0-4bbe-a1ad-2d38a9ae831c}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_CAPACITANCE => "{ca2ffb1c-2317-49c0-a0b4-b63ce63461a0}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_RESISTANCE => "{9993d2c8-c157-4a52-a7b5-195c76037231}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_INDUCTANCE => "{dc1d933f-c435-4c7d-a2fe-607192a524d3}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_ELECTRICAL_POWER => "{212f10f5-14ab-4376-9a43-a7794098c2fe}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_POTENTIOMETER => "{2b3681a9-cadc-45aa-a6ff-54957c8bb440}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_FREQUENCY => "{8cd2cbb6-73e6-4640-a709-72ae8fb60d7f}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_BOOLEAN_SWITCH => "{9c7e371f-1041-460b-8d5c-71e4752e350c}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_MULTIVALUE_SWITCH => "{b3ee4d76-37a4-4402-b25e-99c60a775fa1}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_FORCE => "{c2ab2b02-1a1c-4778-a81b-954a1788cc75}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_SCALE => "{c06dd92c-7feb-438e-9bf6-82207fff5bb8}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_PRESSURE => "{26d31f34-6352-41cf-b793-ea0713d53d77}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_STRAIN => "{c6d1ec0e-6803-4361-ad3d-85bcc58c6d29}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_BOOLEAN_SWITCH_ARRAY => "{545c8ba5-b143-4545-868f-ca7fd986b4f6}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_HUMAN_PRESENCE => "{c138c12b-ad52-451c-9375-87f518ff10c6}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_HUMAN_PROXIMITY => "{5220dae9-3179-4430-9f90-06266d2a34de}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_TOUCH => "{17db3018-06c4-4f7d-81af-9274b7599c27}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_AMBIENT_LIGHT => "{97f115c8-599a-4153-8894-d2d12899918a}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_RFID_SCANNER => "{44328ef5-02dd-4e8d-ad5d-9249832b2eca}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_BARCODE_SCANNER => "{990b3d8f-85bb-45ff-914d-998c04f372df}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_CUSTOM => "{e83af229-8640-4d18-a213-e22675ebb2c3}"

    /**
     * @type {String}
     */
    static SENSOR_TYPE_UNKNOWN => "{10ba83e3-ef4f-41ed-9885-a87d6435a8e1}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_COMMON_GUID => "{db5e0cf2-cf1f-4c18-b46c-d86011d62150}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_LOCATION_GUID => "{055c74d8-ca6f-47d6-95c6-1ed3637a0ff4}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_ENVIRONMENTAL_GUID => "{8b0aa2f1-2d57-42ee-8cc0-4d27622b46c4}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_MOTION_GUID => "{3f8a69a2-07c5-4e48-a965-cd797aab56d5}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_ORIENTATION_GUID => "{1637d8a2-4248-4275-865d-558de84aedfd}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_GUID_MECHANICAL_GUID => "{38564a7c-f2f2-49bb-9b2b-ba60f66a58df}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_BIOMETRIC_GUID => "{2299288a-6d9e-4b0b-b7ec-3528f89e40af}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_LIGHT_GUID => "{e4c77ce2-dcb7-46e9-8439-4fec548833a6}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_SCANNER_GUID => "{d7a59a3c-3421-44ab-8d3a-9de8ab6c4cae}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_ELECTRICAL_GUID => "{bbb246d1-e242-4780-a2d3-cded84f35842}"

    /**
     * @type {String}
     */
    static SENSOR_DATA_TYPE_CUSTOM_GUID => "{b14c764f-07cf-41e8-9d82-ebe3d0776a6f}"

    /**
     * @type {String}
     */
    static SENSOR_PROPERTY_TEST_GUID => "{e1e962f4-6e65-45f7-9c36-d487b7b1bd34}"

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_CLEAR_ALL_ASSISTANCE_DATA => 1

    /**
     * @type {String}
     */
    static GUID_SensorCategory_All => "{c317c286-c468-4288-9975-d4c4587c442c}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Biometric => "{ca19690f-a2c7-477d-a99e-99ec6e2b5648}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Electrical => "{fb73fcd8-fc4a-483c-ac58-27b691c6beff}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Environmental => "{323439aa-7f66-492b-ba0c-73e9aa0a65d5}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Light => "{17a665c0-9063-4216-b202-5c7a255e18ce}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Location => "{bfa794e4-f964-4fdb-90f6-51056bfe4b44}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Mechanical => "{8d131d68-8ef7-4656-80b5-cccbd93791c5}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Motion => "{cd09daf1-3b2e-4c3d-b598-b5e5ff93fd46}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Orientation => "{9e6c04b6-96fe-4954-b726-68682a473f69}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Other => "{2c90e7a9-f4c9-4fa2-af37-56d471fe5a3d}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_PersonalActivity => "{f1609081-1e12-412b-a14d-cbb0e95bd2e5}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Scanner => "{b000e77e-f5b5-420f-815d-0270a726f270}"

    /**
     * @type {String}
     */
    static GUID_SensorCategory_Unsupported => "{2beae7fa-19b0-48c5-a1f6-b5480dc206b0}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Accelerometer3D => "{c2fb0f5f-e2d2-4c78-bcd0-352a9582819d}"

    /**
     * @type {String}
     */
    static GUID_SensorType_ActivityDetection => "{9d9e0118-1807-4f2e-96e4-2ce57142e196}"

    /**
     * @type {String}
     */
    static GUID_SensorType_AmbientLight => "{97f115c8-599a-4153-8894-d2d12899918a}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Barometer => "{0e903829-ff8a-4a93-97df-3dcbde402288}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Custom => "{e83af229-8640-4d18-a213-e22675ebb2c3}"

    /**
     * @type {String}
     */
    static GUID_SensorType_FloorElevation => "{ade4987f-7ac4-4dfa-9722-0a027181c747}"

    /**
     * @type {String}
     */
    static GUID_SensorType_GeomagneticOrientation => "{e77195f8-2d1f-4823-971b-1c4467556c9d}"

    /**
     * @type {String}
     */
    static GUID_SensorType_GravityVector => "{03b52c73-bb76-463f-9524-38de76eb700b}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Gyrometer3D => "{09485f5a-759e-42c2-bd4b-a349b75c8643}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Humidity => "{5c72bf67-bd7e-4257-990b-98a3ba3b400a}"

    /**
     * @type {String}
     */
    static GUID_SensorType_LinearAccelerometer => "{038b0283-97b4-41c8-bc24-5ff1aa48fec7}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Magnetometer3D => "{55e5effb-15c7-40df-8698-a84b7c863c53}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Orientation => "{cdb5d8f7-3cfd-41c8-8542-cce622cf5d6e}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Pedometer => "{b19f89af-e3eb-444b-8dea-202575a71599}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Proximity => "{5220dae9-3179-4430-9f90-06266d2a34de}"

    /**
     * @type {String}
     */
    static GUID_SensorType_RelativeOrientation => "{40993b51-4706-44dc-98d5-c920c037ffab}"

    /**
     * @type {String}
     */
    static GUID_SensorType_SimpleDeviceOrientation => "{86a19291-0482-402c-bf4c-addac52b1c39}"

    /**
     * @type {String}
     */
    static GUID_SensorType_Temperature => "{04fd0ec4-d5da-45fa-95a9-5db38ee19306}"

    /**
     * @type {String}
     */
    static GUID_SensorType_HingeAngle => "{82358065-f4c4-4da1-b272-13c23332a207}"

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
        result := DllCall("SensorsUtilsV2.dll\GetPerformanceTime", "uint*", TimeMs, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetBool", "ptr", pList, "ptr", pKey, "ptr", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetUlong", "ptr", pList, "ptr", pKey, "uint*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetUshort", "ptr", pList, "ptr", pKey, "ushort*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetFloat", "ptr", pList, "ptr", pKey, "float*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetDouble", "ptr", pList, "ptr", pKey, "double*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetInt32", "ptr", pList, "ptr", pKey, "int*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetInt64", "ptr", pList, "ptr", pKey, "int64*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthUlong", "ptr", pList, "ptr", pKey, "uint", Occurrence, "uint*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthUshort", "ptr", pList, "ptr", pKey, "uint", Occurrence, "ushort*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthInt64", "ptr", pList, "ptr", pKey, "uint", Occurrence, "int64*", pRetValue, "int")
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
        result := DllCall("SensorsUtilsV2.dll\PropVariantGetInformation", "ptr", PropVariantValue, "uint*", PropVariantOffset, "uint*", PropVariantSize, "ptr*", PropVariantPointer, "uint*", RemappedType, "int")
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
        result := DllCall("SensorsUtilsV2.dll\SerializationBufferAllocate", "uint", SizeInBytes, "ptr*", pBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Buffer 
     * @returns {String} Nothing - always returns an empty string
     */
    static SerializationBufferFree(Buffer) {
        DllCall("SensorsUtilsV2.dll\SerializationBufferFree", "char*", Buffer)
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
        result := DllCall("SensorsUtilsV2.dll\CollectionsListAllocateBufferAndSerialize", "ptr", SourceCollection, "uint*", pTargetBufferSizeInBytes, "ptr*", pTargetBuffer, "int")
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

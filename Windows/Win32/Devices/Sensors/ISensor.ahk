#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a sensor.
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-isensor
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ISensor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensor
     * @type {Guid}
     */
    static IID => Guid("{5fa08f80-2657-458e-af75-46f73fa6ac5c}")

    /**
     * The class identifier for Sensor
     * @type {Guid}
     */
    static CLSID => Guid("{e97ced00-523a-4133-bf6f-d3a2dae7f6ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetCategory", "GetType", "GetFriendlyName", "GetProperty", "GetProperties", "GetSupportedDataFields", "SetProperties", "SupportsDataField", "GetState", "GetData", "SupportsEvent", "GetEventInterest", "SetEventInterest", "SetEventSink"]

    /**
     * 
     * @param {Pointer<Guid>} pID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getid
     */
    GetID(pID) {
        result := ComCall(3, this, "ptr", pID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSensorCategory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getcategory
     */
    GetCategory(pSensorCategory) {
        result := ComCall(4, this, "ptr", pSensorCategory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSensorType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-gettype
     */
    GetType(pSensorType) {
        result := ComCall(5, this, "ptr", pSensorType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getfriendlyname
     */
    GetFriendlyName(pFriendlyName) {
        result := ComCall(6, this, "ptr", pFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getproperty
     */
    GetProperty(key, pProperty) {
        result := ComCall(7, this, "ptr", key, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceKeyCollection} pKeys 
     * @param {Pointer<IPortableDeviceValues>} ppProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getproperties
     */
    GetProperties(pKeys, ppProperties) {
        result := ComCall(8, this, "ptr", pKeys, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppDataFields 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getsupporteddatafields
     */
    GetSupportedDataFields(ppDataFields) {
        result := ComCall(9, this, "ptr*", ppDataFields, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceValues} pProperties 
     * @param {Pointer<IPortableDeviceValues>} ppResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-setproperties
     */
    SetProperties(pProperties, ppResults) {
        result := ComCall(10, this, "ptr", pProperties, "ptr*", ppResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<VARIANT_BOOL>} pIsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-supportsdatafield
     */
    SupportsDataField(key, pIsSupported) {
        result := ComCall(11, this, "ptr", key, "ptr", pIsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getstate
     */
    GetState(pState) {
        result := ComCall(12, this, "int*", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISensorDataReport>} ppDataReport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getdata
     */
    GetData(ppDataReport) {
        result := ComCall(13, this, "ptr*", ppDataReport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} eventGuid 
     * @param {Pointer<VARIANT_BOOL>} pIsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-supportsevent
     */
    SupportsEvent(eventGuid, pIsSupported) {
        result := ComCall(14, this, "ptr", eventGuid, "ptr", pIsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} ppValues 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-geteventinterest
     */
    GetEventInterest(ppValues, pCount) {
        result := ComCall(15, this, "ptr*", ppValues, "uint*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-seteventinterest
     */
    SetEventInterest(pValues, count) {
        result := ComCall(16, this, "ptr", pValues, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISensorEvents} pEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-seteventsink
     */
    SetEventSink(pEvents) {
        result := ComCall(17, this, "ptr", pEvents, "HRESULT")
        return result
    }
}

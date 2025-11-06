#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\PortableDevices\IPortableDeviceValues.ahk
#Include ..\PortableDevices\IPortableDeviceKeyCollection.ahk
#Include .\ISensorDataReport.ahk
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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getid
     */
    GetID() {
        pID := Guid()
        result := ComCall(3, this, "ptr", pID, "HRESULT")
        return pID
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getcategory
     */
    GetCategory() {
        pSensorCategory := Guid()
        result := ComCall(4, this, "ptr", pSensorCategory, "HRESULT")
        return pSensorCategory
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-gettype
     */
    GetType() {
        pSensorType := Guid()
        result := ComCall(5, this, "ptr", pSensorType, "HRESULT")
        return pSensorType
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getfriendlyname
     */
    GetFriendlyName() {
        pFriendlyName := BSTR()
        result := ComCall(6, this, "ptr", pFriendlyName, "HRESULT")
        return pFriendlyName
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getproperty
     */
    GetProperty(key) {
        pProperty := PROPVARIANT()
        result := ComCall(7, this, "ptr", key, "ptr", pProperty, "HRESULT")
        return pProperty
    }

    /**
     * 
     * @param {IPortableDeviceKeyCollection} pKeys 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getproperties
     */
    GetProperties(pKeys) {
        result := ComCall(8, this, "ptr", pKeys, "ptr*", &ppProperties := 0, "HRESULT")
        return IPortableDeviceValues(ppProperties)
    }

    /**
     * 
     * @returns {IPortableDeviceKeyCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getsupporteddatafields
     */
    GetSupportedDataFields() {
        result := ComCall(9, this, "ptr*", &ppDataFields := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppDataFields)
    }

    /**
     * 
     * @param {IPortableDeviceValues} pProperties 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-setproperties
     */
    SetProperties(pProperties) {
        result := ComCall(10, this, "ptr", pProperties, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-supportsdatafield
     */
    SupportsDataField(key) {
        result := ComCall(11, this, "ptr", key, "short*", &pIsSupported := 0, "HRESULT")
        return pIsSupported
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getstate
     */
    GetState() {
        result := ComCall(12, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {ISensorDataReport} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-getdata
     */
    GetData() {
        result := ComCall(13, this, "ptr*", &ppDataReport := 0, "HRESULT")
        return ISensorDataReport(ppDataReport)
    }

    /**
     * 
     * @param {Pointer<Guid>} eventGuid 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-supportsevent
     */
    SupportsEvent(eventGuid) {
        result := ComCall(14, this, "ptr", eventGuid, "short*", &pIsSupported := 0, "HRESULT")
        return pIsSupported
    }

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} ppValues 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensor-geteventinterest
     */
    GetEventInterest(ppValues, pCount) {
        ppValuesMarshal := ppValues is VarRef ? "ptr*" : "ptr"
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, ppValuesMarshal, ppValues, pCountMarshal, pCount, "HRESULT")
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

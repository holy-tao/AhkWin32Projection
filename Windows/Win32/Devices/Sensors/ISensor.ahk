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
     * 
     * @param {Pointer<Guid>} pID 
     * @returns {HRESULT} 
     */
    GetID(pID) {
        result := ComCall(3, this, "ptr", pID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSensorCategory 
     * @returns {HRESULT} 
     */
    GetCategory(pSensorCategory) {
        result := ComCall(4, this, "ptr", pSensorCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSensorType 
     * @returns {HRESULT} 
     */
    GetType(pSensorType) {
        result := ComCall(5, this, "ptr", pSensorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pFriendlyName 
     * @returns {HRESULT} 
     */
    GetFriendlyName(pFriendlyName) {
        result := ComCall(6, this, "ptr", pFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pProperty 
     * @returns {HRESULT} 
     */
    GetProperty(key, pProperty) {
        result := ComCall(7, this, "ptr", key, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceKeyCollection>} pKeys 
     * @param {Pointer<IPortableDeviceValues>} ppProperties 
     * @returns {HRESULT} 
     */
    GetProperties(pKeys, ppProperties) {
        result := ComCall(8, this, "ptr", pKeys, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppDataFields 
     * @returns {HRESULT} 
     */
    GetSupportedDataFields(ppDataFields) {
        result := ComCall(9, this, "ptr", ppDataFields, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceValues>} pProperties 
     * @param {Pointer<IPortableDeviceValues>} ppResults 
     * @returns {HRESULT} 
     */
    SetProperties(pProperties, ppResults) {
        result := ComCall(10, this, "ptr", pProperties, "ptr", ppResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<VARIANT_BOOL>} pIsSupported 
     * @returns {HRESULT} 
     */
    SupportsDataField(key, pIsSupported) {
        result := ComCall(11, this, "ptr", key, "ptr", pIsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetState(pState) {
        result := ComCall(12, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISensorDataReport>} ppDataReport 
     * @returns {HRESULT} 
     */
    GetData(ppDataReport) {
        result := ComCall(13, this, "ptr", ppDataReport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} eventGuid 
     * @param {Pointer<VARIANT_BOOL>} pIsSupported 
     * @returns {HRESULT} 
     */
    SupportsEvent(eventGuid, pIsSupported) {
        result := ComCall(14, this, "ptr", eventGuid, "ptr", pIsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ppValues 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetEventInterest(ppValues, pCount) {
        result := ComCall(15, this, "ptr", ppValues, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetEventInterest(pValues, count) {
        result := ComCall(16, this, "ptr", pValues, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISensorEvents>} pEvents 
     * @returns {HRESULT} 
     */
    SetEventSink(pEvents) {
        result := ComCall(17, this, "ptr", pEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

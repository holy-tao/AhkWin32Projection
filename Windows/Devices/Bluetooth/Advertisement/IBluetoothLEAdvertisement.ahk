#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\BluetoothLEManufacturerData.ahk
#Include .\BluetoothLEAdvertisementDataSection.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisement
     * @type {Guid}
     */
    static IID => Guid("{066fb2b7-33d1-4e7d-8367-cf81d0f79653}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Flags", "put_Flags", "get_LocalName", "put_LocalName", "get_ServiceUuids", "get_ManufacturerData", "get_DataSections", "GetManufacturerDataByCompanyId", "GetSectionsByType"]

    /**
     * @type {IReference<Integer>} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * @type {HSTRING} 
     */
    LocalName {
        get => this.get_LocalName()
        set => this.put_LocalName(value)
    }

    /**
     * @type {IVector<Guid>} 
     */
    ServiceUuids {
        get => this.get_ServiceUuids()
    }

    /**
     * @type {IVector<BluetoothLEManufacturerData>} 
     */
    ManufacturerData {
        get => this.get_ManufacturerData()
    }

    /**
     * @type {IVector<BluetoothLEAdvertisementDataSection>} 
     */
    DataSections {
        get => this.get_DataSections()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Flags() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Flags(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LocalName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Guid>} 
     */
    get_ServiceUuids() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetGuid(), value)
    }

    /**
     * 
     * @returns {IVector<BluetoothLEManufacturerData>} 
     */
    get_ManufacturerData() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(BluetoothLEManufacturerData, value)
    }

    /**
     * 
     * @returns {IVector<BluetoothLEAdvertisementDataSection>} 
     */
    get_DataSections() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(BluetoothLEAdvertisementDataSection, value)
    }

    /**
     * 
     * @param {Integer} companyId 
     * @returns {IVectorView<BluetoothLEManufacturerData>} 
     */
    GetManufacturerDataByCompanyId(companyId) {
        result := ComCall(13, this, "ushort", companyId, "ptr*", &dataList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(BluetoothLEManufacturerData, dataList)
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {IVectorView<BluetoothLEAdvertisementDataSection>} 
     */
    GetSectionsByType(type) {
        result := ComCall(14, this, "char", type, "ptr*", &sectionList_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(BluetoothLEAdvertisementDataSection, sectionList_)
    }
}

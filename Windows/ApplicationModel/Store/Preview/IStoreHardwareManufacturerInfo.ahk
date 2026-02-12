#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStoreHardwareManufacturerInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreHardwareManufacturerInfo
     * @type {Guid}
     */
    static IID => Guid("{f292dc08-c654-43ac-a21f-34801c9d3388}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HardwareManufacturerId", "get_StoreContentModifierId", "get_ModelName", "get_ManufacturerName"]

    /**
     * @type {HSTRING} 
     */
    HardwareManufacturerId {
        get => this.get_HardwareManufacturerId()
    }

    /**
     * @type {HSTRING} 
     */
    StoreContentModifierId {
        get => this.get_StoreContentModifierId()
    }

    /**
     * @type {HSTRING} 
     */
    ModelName {
        get => this.get_ModelName()
    }

    /**
     * @type {HSTRING} 
     */
    ManufacturerName {
        get => this.get_ManufacturerName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HardwareManufacturerId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StoreContentModifierId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ManufacturerName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

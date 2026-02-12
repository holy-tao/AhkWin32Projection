#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IKnownRetailInfoPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownRetailInfoPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{99571178-500f-487e-8e75-29e551728712}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RetailAccessCode", "get_ManufacturerName", "get_ModelName", "get_DisplayModelName", "get_Price", "get_IsFeatured", "get_FormFactor", "get_ScreenSize", "get_Weight", "get_DisplayDescription", "get_BatteryLifeDescription", "get_ProcessorDescription", "get_Memory", "get_StorageDescription", "get_GraphicsDescription", "get_FrontCameraDescription", "get_RearCameraDescription", "get_HasNfc", "get_HasSdSlot", "get_HasOpticalDrive", "get_IsOfficeInstalled", "get_WindowsEdition"]

    /**
     * @type {HSTRING} 
     */
    RetailAccessCode {
        get => this.get_RetailAccessCode()
    }

    /**
     * @type {HSTRING} 
     */
    ManufacturerName {
        get => this.get_ManufacturerName()
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
    DisplayModelName {
        get => this.get_DisplayModelName()
    }

    /**
     * @type {HSTRING} 
     */
    Price {
        get => this.get_Price()
    }

    /**
     * @type {HSTRING} 
     */
    IsFeatured {
        get => this.get_IsFeatured()
    }

    /**
     * @type {HSTRING} 
     */
    FormFactor {
        get => this.get_FormFactor()
    }

    /**
     * @type {HSTRING} 
     */
    ScreenSize {
        get => this.get_ScreenSize()
    }

    /**
     * @type {HSTRING} 
     */
    Weight {
        get => this.get_Weight()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayDescription {
        get => this.get_DisplayDescription()
    }

    /**
     * @type {HSTRING} 
     */
    BatteryLifeDescription {
        get => this.get_BatteryLifeDescription()
    }

    /**
     * @type {HSTRING} 
     */
    ProcessorDescription {
        get => this.get_ProcessorDescription()
    }

    /**
     * @type {HSTRING} 
     */
    Memory {
        get => this.get_Memory()
    }

    /**
     * @type {HSTRING} 
     */
    StorageDescription {
        get => this.get_StorageDescription()
    }

    /**
     * @type {HSTRING} 
     */
    GraphicsDescription {
        get => this.get_GraphicsDescription()
    }

    /**
     * @type {HSTRING} 
     */
    FrontCameraDescription {
        get => this.get_FrontCameraDescription()
    }

    /**
     * @type {HSTRING} 
     */
    RearCameraDescription {
        get => this.get_RearCameraDescription()
    }

    /**
     * @type {HSTRING} 
     */
    HasNfc {
        get => this.get_HasNfc()
    }

    /**
     * @type {HSTRING} 
     */
    HasSdSlot {
        get => this.get_HasSdSlot()
    }

    /**
     * @type {HSTRING} 
     */
    HasOpticalDrive {
        get => this.get_HasOpticalDrive()
    }

    /**
     * @type {HSTRING} 
     */
    IsOfficeInstalled {
        get => this.get_IsOfficeInstalled()
    }

    /**
     * @type {HSTRING} 
     */
    WindowsEdition {
        get => this.get_WindowsEdition()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RetailAccessCode() {
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
    get_ManufacturerName() {
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
    get_DisplayModelName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Price() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IsFeatured() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormFactor() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ScreenSize() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Weight() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayDescription() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BatteryLifeDescription() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProcessorDescription() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Memory() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StorageDescription() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GraphicsDescription() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FrontCameraDescription() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RearCameraDescription() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HasNfc() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HasSdSlot() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HasOpticalDrive() {
        value := HSTRING()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IsOfficeInstalled() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WindowsEdition() {
        value := HSTRING()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

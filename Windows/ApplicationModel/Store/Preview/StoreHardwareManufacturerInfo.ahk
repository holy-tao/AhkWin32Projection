#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreHardwareManufacturerInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the manufacturer for the current device.
 * @remarks
 * To retrieve an instance of this class, use the [HardwareManufacturerInfo](storeconfiguration_hardwaremanufacturerinfo.md) property of the [StoreConfiguration](storeconfiguration.md) class.
 * 
 * > [!IMPORTANT]
 * > Access to this API is protected by a private capability that is restricted to apps that are developed by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storehardwaremanufacturerinfo
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class StoreHardwareManufacturerInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreHardwareManufacturerInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreHardwareManufacturerInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the hardware manufacture ID for the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storehardwaremanufacturerinfo.hardwaremanufacturerid
     * @type {HSTRING} 
     */
    HardwareManufacturerId {
        get => this.get_HardwareManufacturerId()
    }

    /**
     * Gets the ID of the Microsoft Store content modifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storehardwaremanufacturerinfo.storecontentmodifierid
     * @type {HSTRING} 
     */
    StoreContentModifierId {
        get => this.get_StoreContentModifierId()
    }

    /**
     * Gets the model name for the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storehardwaremanufacturerinfo.modelname
     * @type {HSTRING} 
     */
    ModelName {
        get => this.get_ModelName()
    }

    /**
     * Gets the name of the hardware manufacturer for the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storehardwaremanufacturerinfo.manufacturername
     * @type {HSTRING} 
     */
    ManufacturerName {
        get => this.get_ManufacturerName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HardwareManufacturerId() {
        if (!this.HasProp("__IStoreHardwareManufacturerInfo")) {
            if ((queryResult := this.QueryInterface(IStoreHardwareManufacturerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreHardwareManufacturerInfo := IStoreHardwareManufacturerInfo(outPtr)
        }

        return this.__IStoreHardwareManufacturerInfo.get_HardwareManufacturerId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StoreContentModifierId() {
        if (!this.HasProp("__IStoreHardwareManufacturerInfo")) {
            if ((queryResult := this.QueryInterface(IStoreHardwareManufacturerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreHardwareManufacturerInfo := IStoreHardwareManufacturerInfo(outPtr)
        }

        return this.__IStoreHardwareManufacturerInfo.get_StoreContentModifierId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelName() {
        if (!this.HasProp("__IStoreHardwareManufacturerInfo")) {
            if ((queryResult := this.QueryInterface(IStoreHardwareManufacturerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreHardwareManufacturerInfo := IStoreHardwareManufacturerInfo(outPtr)
        }

        return this.__IStoreHardwareManufacturerInfo.get_ModelName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ManufacturerName() {
        if (!this.HasProp("__IStoreHardwareManufacturerInfo")) {
            if ((queryResult := this.QueryInterface(IStoreHardwareManufacturerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreHardwareManufacturerInfo := IStoreHardwareManufacturerInfo(outPtr)
        }

        return this.__IStoreHardwareManufacturerInfo.get_ManufacturerName()
    }

;@endregion Instance Methods
}

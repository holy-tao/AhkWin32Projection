#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownRetailInfoPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Identifies the string keys that might exist within the [RetailInfo.Properties](retailinfo_properties.md) map of retail-demo relevant property values.
 * @remarks
 * All members of KnownRetailInfoProperties are static string properties where the base API name and the value of the string match exactly. The intention of this type is to use the members as the string source when you use the generic [IMapView](../windows.foundation.collections/imapview_2.md) or [IReadOnlyDictionary](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) APIs that access the [RetailInfo.Properties](retailinfo_properties.md) items by string key, so that you're asking for properties that typically exist.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class KnownRetailInfoProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets the string that identifies the **RetailAccessCode** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.retailaccesscode
     * @type {HSTRING} 
     */
    static RetailAccessCode {
        get => KnownRetailInfoProperties.get_RetailAccessCode()
    }

    /**
     * Gets the string that identifies the **ManufacturerName** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.manufacturername
     * @type {HSTRING} 
     */
    static ManufacturerName {
        get => KnownRetailInfoProperties.get_ManufacturerName()
    }

    /**
     * Gets the string that identifies the **ModelName** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.modelname
     * @type {HSTRING} 
     */
    static ModelName {
        get => KnownRetailInfoProperties.get_ModelName()
    }

    /**
     * Gets the string that identifies the **DisplayModelName** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.displaymodelname
     * @type {HSTRING} 
     */
    static DisplayModelName {
        get => KnownRetailInfoProperties.get_DisplayModelName()
    }

    /**
     * Gets the string that identifies the **Price** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.price
     * @type {HSTRING} 
     */
    static Price {
        get => KnownRetailInfoProperties.get_Price()
    }

    /**
     * Gets the string that identifies the **IsFeatured** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.isfeatured
     * @type {HSTRING} 
     */
    static IsFeatured {
        get => KnownRetailInfoProperties.get_IsFeatured()
    }

    /**
     * Gets the string that identifies the **FormFactor** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.formfactor
     * @type {HSTRING} 
     */
    static FormFactor {
        get => KnownRetailInfoProperties.get_FormFactor()
    }

    /**
     * Gets the string that identifies the **ScreenSize** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.screensize
     * @type {HSTRING} 
     */
    static ScreenSize {
        get => KnownRetailInfoProperties.get_ScreenSize()
    }

    /**
     * Gets the string that identifies the **Weight** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.weight
     * @type {HSTRING} 
     */
    static Weight {
        get => KnownRetailInfoProperties.get_Weight()
    }

    /**
     * Gets the string that identifies the **DisplayDescription** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.displaydescription
     * @type {HSTRING} 
     */
    static DisplayDescription {
        get => KnownRetailInfoProperties.get_DisplayDescription()
    }

    /**
     * Gets the string that identifies the **KnownRetailInfoProperties** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.batterylifedescription
     * @type {HSTRING} 
     */
    static BatteryLifeDescription {
        get => KnownRetailInfoProperties.get_BatteryLifeDescription()
    }

    /**
     * Gets the string that identifies the **ProcessorDescription** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.processordescription
     * @type {HSTRING} 
     */
    static ProcessorDescription {
        get => KnownRetailInfoProperties.get_ProcessorDescription()
    }

    /**
     * Gets the string that identifies the **Memory** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.memory
     * @type {HSTRING} 
     */
    static Memory {
        get => KnownRetailInfoProperties.get_Memory()
    }

    /**
     * Gets the string that identifies the **StorageDescription** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.storagedescription
     * @type {HSTRING} 
     */
    static StorageDescription {
        get => KnownRetailInfoProperties.get_StorageDescription()
    }

    /**
     * Gets the string that identifies the **GraphicsDescription** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.graphicsdescription
     * @type {HSTRING} 
     */
    static GraphicsDescription {
        get => KnownRetailInfoProperties.get_GraphicsDescription()
    }

    /**
     * Gets the string that identifies the **FrontCameraDescription** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.frontcameradescription
     * @type {HSTRING} 
     */
    static FrontCameraDescription {
        get => KnownRetailInfoProperties.get_FrontCameraDescription()
    }

    /**
     * Gets the string that identifies the **RearCameraDescription** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.rearcameradescription
     * @type {HSTRING} 
     */
    static RearCameraDescription {
        get => KnownRetailInfoProperties.get_RearCameraDescription()
    }

    /**
     * Gets the string that identifies the **HasNfc** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.hasnfc
     * @type {HSTRING} 
     */
    static HasNfc {
        get => KnownRetailInfoProperties.get_HasNfc()
    }

    /**
     * Gets the string that identifies the **HasSdSlot** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.hassdslot
     * @type {HSTRING} 
     */
    static HasSdSlot {
        get => KnownRetailInfoProperties.get_HasSdSlot()
    }

    /**
     * Gets the string that identifies the **HasOpticalDrive** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.hasopticaldrive
     * @type {HSTRING} 
     */
    static HasOpticalDrive {
        get => KnownRetailInfoProperties.get_HasOpticalDrive()
    }

    /**
     * Gets the string that identifies the **IsOfficeInstalled** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.isofficeinstalled
     * @type {HSTRING} 
     */
    static IsOfficeInstalled {
        get => KnownRetailInfoProperties.get_IsOfficeInstalled()
    }

    /**
     * Gets the string that identifies the **WindowsEdition** retail demo property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.knownretailinfoproperties.windowsedition
     * @type {HSTRING} 
     */
    static WindowsEdition {
        get => KnownRetailInfoProperties.get_WindowsEdition()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RetailAccessCode() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_RetailAccessCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ManufacturerName() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_ManufacturerName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ModelName() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_ModelName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DisplayModelName() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_DisplayModelName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Price() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_Price()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IsFeatured() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_IsFeatured()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FormFactor() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_FormFactor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ScreenSize() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_ScreenSize()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Weight() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_Weight()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DisplayDescription() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_DisplayDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BatteryLifeDescription() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_BatteryLifeDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ProcessorDescription() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_ProcessorDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Memory() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_Memory()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_StorageDescription() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_StorageDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GraphicsDescription() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_GraphicsDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FrontCameraDescription() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_FrontCameraDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RearCameraDescription() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_RearCameraDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HasNfc() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_HasNfc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HasSdSlot() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_HasSdSlot()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HasOpticalDrive() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_HasOpticalDrive()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IsOfficeInstalled() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_IsOfficeInstalled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WindowsEdition() {
        if (!KnownRetailInfoProperties.HasProp("__IKnownRetailInfoPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.KnownRetailInfoProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRetailInfoPropertiesStatics.IID)
            KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics := IKnownRetailInfoPropertiesStatics(factoryPtr)
        }

        return KnownRetailInfoProperties.__IKnownRetailInfoPropertiesStatics.get_WindowsEdition()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

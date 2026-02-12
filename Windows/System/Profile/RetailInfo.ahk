#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRetailInfoStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A utility class that supports one method, [IsDemoModeEnabled](retailinfo_isdemomodeenabled.md), and one property, [Properties](retailinfo_properties.md). Call [IsDemoModeEnabled](retailinfo_isdemomodeenabled.md) to determine whether the device where the app is running has specifically enabled its retail demo mode.
 * @remarks
 * If [RetailInfo.IsDemoModeEnabled](retailinfo_isdemomodeenabled.md) returns **true**, you can get the set of available properties from [RetailInfo.Properties](retailinfo_properties.md). These properties include specific information that is useful for pre-installed demo apps that run in a retail setting. For example, you can get a [ManufacturerName](knownretailinfoproperties_manufacturername.md), [ScreenSize](knownretailinfoproperties_screensize.md), and so on, and display that info in an app that's intended for retail demo. The strings returned are typically suitable for inclusion in a UI.
 * 
 * When possible, use [RetailInfo](retailinfo.md) instead of the previous [Windows.Phone.System.Profile.RetailMode](../windows.phone.system.profile/retailmode.md) API. [Windows.Phone.System.Profile.RetailMode](../windows.phone.system.profile/retailmode.md) is only available for Windows Phone and doesn't support a "Properties" set of device-specific properties.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.retailinfo
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class RetailInfo extends IInspectable {
;@region Static Properties
    /**
     * Determines whether the device where the app is running has specifically enabled its retail demo mode.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.retailinfo.isdemomodeenabled
     * @type {Boolean} 
     */
    static IsDemoModeEnabled {
        get => RetailInfo.get_IsDemoModeEnabled()
    }

    /**
     * Gets an object that represents the set of available retail demo properties and their values.
     * @remarks
     * These properties include specific information that is useful for apps that are running or otherwise available as pre-installed demo apps in a retail setting. For example, you can get a [ManufacturerName](knownretailinfoproperties_manufacturername.md), [ScreenSize](knownretailinfoproperties_screensize.md), and so on.
     * 
     * If [IsDemoModeEnabled](retailinfo_isdemomodeenabled.md) is **false**, Properties might contain a zero-length collection or **null**. Verify that [IsDemoModeEnabled](retailinfo_isdemomodeenabled.md) is **true** before getting the Properties value.
     * 
     * Once you have a valid collection, this collection is a map/dictionary where each property is identified by a property name. These property names are predefined, and each known property name is represented by a static string property of the [KnownRetailInfoProperties](knownretailinfoproperties.md) class. So whenever you attempt to get a specific property, use a [KnownRetailInfoProperties](knownretailinfoproperties.md) property to supply the string key value, rather than hard-coded strings. That will assure you aren't asking for values that don't exist in the collection.
     * 
     * The collection is represented by a different interface/object depending on which programming language you are using.
     * + If you're using .NET code, the collection is an [IReadOnlyDictionary](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) instance, with string keys and nominally untyped ([Object](/dotnet/api/system.object?view=dotnet-uwp-10.0&preserve-view=true)) values. Use the [Item](/dotnet/api/system.collections.generic.ireadonlydictionary-2.item?view=dotnet-uwp-10.0&preserve-view=true) indexer or [TryGetValue](/dotnet/api/system.collections.generic.ireadonlydictionary-2.trygetvalue?view=dotnet-uwp-10.0&preserve-view=true) to get the values of specific properties. Always use [KnownRetailInfoProperties](knownretailinfoproperties.md) properties to specify the *key* parameters.
     * + If you're using C++/CX, the collection is an [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md) instance, which can be used as [Platform::Collections::MapView](/cpp/cppcx/platform-collections-mapview-class). It has string keys and nominally untyped ([Platform::Object](/cpp/cppcx/platform-object-class)) values. Use **Lookup** to get the values of specific properties. Always use [KnownRetailInfoProperties](knownretailinfoproperties.md) properties to specify the *key* parameters.
     * + If you're using JavaScript, the object represents [IMapView](../windows.foundation.collections/imapview_2.md) API with string keys and untyped values. Use [Lookup](../windows.foundation.collections/imapview_2_lookup_1104382727.md) to get the values of specific properties.
     * 
     * The values you get for the properties are technically untyped objects (variants) because they are being reported directly from registry info (HKLM). Here are the types that you can use as type-casting options (which might be needed for UI display) for each of the properties:
     * 
     * | Property | Type |
     * |---|---|
     * | [BatteryLifeDescription](knownretailinfoproperties_batterylifedescription.md) | **String** |
     * | [DisplayDescription](knownretailinfoproperties_displaydescription.md) | **String** |
     * | [DisplayModelName](knownretailinfoproperties_displaymodelname.md) | **String** |
     * | [FormFactor](knownretailinfoproperties_formfactor.md) | **String** |
     * | [FrontCameraDescription](knownretailinfoproperties_frontcameradescription.md) | **String** |
     * | [GraphicsDescription](knownretailinfoproperties_graphicsdescription.md) | **String** |
     * | [HasNfc](knownretailinfoproperties_hasnfc.md) | **Boolean** |
     * | [HasOpticalDrive](knownretailinfoproperties_hasopticaldrive.md) | **Boolean** |
     * | [HasSdSlot](knownretailinfoproperties_hassdslot.md) | **Boolean** |
     * | [IsFeatured](knownretailinfoproperties_isfeatured.md) | **Boolean** |
     * | [IsOfficeInstalled](knownretailinfoproperties_isofficeinstalled.md) | **Boolean** |
     * | [ManufacturerName](knownretailinfoproperties_manufacturername.md) | **String** |
     * | [Memory](knownretailinfoproperties_memory.md) | **String** |
     * | [ModelName](knownretailinfoproperties_modelname.md) | **String** |
     * | [Price](knownretailinfoproperties_price.md) | **Double** |
     * | [ProcessorDescription](knownretailinfoproperties_processordescription.md) | **String** |
     * | [RearCameraDescription](knownretailinfoproperties_rearcameradescription.md) | **String** |
     * | [RetailAccessCode](knownretailinfoproperties_retailaccesscode.md) | **String** |
     * | [ScreenSize](knownretailinfoproperties_screensize.md) | **String** |
     * | [StorageDescription](knownretailinfoproperties_storagedescription.md) | **String** |
     * | [Weight](knownretailinfoproperties_weight.md) | **String** |
     * | [WindowsEdition](knownretailinfoproperties_windowsedition.md) | **String** |
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.retailinfo.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    static Properties {
        get => RetailInfo.get_Properties()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsDemoModeEnabled() {
        if (!RetailInfo.HasProp("__IRetailInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.RetailInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRetailInfoStatics.IID)
            RetailInfo.__IRetailInfoStatics := IRetailInfoStatics(factoryPtr)
        }

        return RetailInfo.__IRetailInfoStatics.get_IsDemoModeEnabled()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    static get_Properties() {
        if (!RetailInfo.HasProp("__IRetailInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.RetailInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRetailInfoStatics.IID)
            RetailInfo.__IRetailInfoStatics := IRetailInfoStatics(factoryPtr)
        }

        return RetailInfo.__IRetailInfoStatics.get_Properties()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

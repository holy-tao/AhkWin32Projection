#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderCardTypesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the card type of the recently swiped card.
 * @remarks
 * This is a static class that contains the card type of the most recently swiped card.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercardtypes
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderCardTypes extends IInspectable {
;@region Static Properties
    /**
     * Indicates an unknown card type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercardtypes.unknown
     * @type {Integer} 
     */
    static Unknown {
        get => MagneticStripeReaderCardTypes.get_Unknown()
    }

    /**
     * Indicates a bank card type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercardtypes.bank
     * @type {Integer} 
     */
    static Bank {
        get => MagneticStripeReaderCardTypes.get_Bank()
    }

    /**
     * Indicates the American Association of Motor Vehicle Administrators (AAMVA) card type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercardtypes.aamva
     * @type {Integer} 
     */
    static Aamva {
        get => MagneticStripeReaderCardTypes.get_Aamva()
    }

    /**
     * Indicates vendor-specific card type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereadercardtypes.extendedbase
     * @type {Integer} 
     */
    static ExtendedBase {
        get => MagneticStripeReaderCardTypes.get_ExtendedBase()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Unknown() {
        if (!MagneticStripeReaderCardTypes.HasProp("__IMagneticStripeReaderCardTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReaderCardTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderCardTypesStatics.IID)
            MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics := IMagneticStripeReaderCardTypesStatics(factoryPtr)
        }

        return MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics.get_Unknown()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Bank() {
        if (!MagneticStripeReaderCardTypes.HasProp("__IMagneticStripeReaderCardTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReaderCardTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderCardTypesStatics.IID)
            MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics := IMagneticStripeReaderCardTypesStatics(factoryPtr)
        }

        return MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics.get_Bank()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Aamva() {
        if (!MagneticStripeReaderCardTypes.HasProp("__IMagneticStripeReaderCardTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReaderCardTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderCardTypesStatics.IID)
            MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics := IMagneticStripeReaderCardTypesStatics(factoryPtr)
        }

        return MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics.get_Aamva()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ExtendedBase() {
        if (!MagneticStripeReaderCardTypes.HasProp("__IMagneticStripeReaderCardTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReaderCardTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderCardTypesStatics.IID)
            MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics := IMagneticStripeReaderCardTypesStatics(factoryPtr)
        }

        return MagneticStripeReaderCardTypes.__IMagneticStripeReaderCardTypesStatics.get_ExtendedBase()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

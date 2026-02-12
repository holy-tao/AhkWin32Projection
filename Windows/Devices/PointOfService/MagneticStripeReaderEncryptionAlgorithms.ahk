#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagneticStripeReaderEncryptionAlgorithmsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the encryption algorithm supported by the device.
 * @remarks
 * This is a static class that contains the encryption algorithm supported by the device.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderencryptionalgorithms
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class MagneticStripeReaderEncryptionAlgorithms extends IInspectable {
;@region Static Properties
    /**
     * Indicates no encryption algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderencryptionalgorithms.none
     * @type {Integer} 
     */
    static None {
        get => MagneticStripeReaderEncryptionAlgorithms.get_None()
    }

    /**
     * Indicates Triple DES DUKPT (Derived Unique Key Per Transaction) encryption algorithm supported by the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderencryptionalgorithms.tripledesdukpt
     * @type {Integer} 
     */
    static TripleDesDukpt {
        get => MagneticStripeReaderEncryptionAlgorithms.get_TripleDesDukpt()
    }

    /**
     * Indicates vendor specific encryption algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.magneticstripereaderencryptionalgorithms.extendedbase
     * @type {Integer} 
     */
    static ExtendedBase {
        get => MagneticStripeReaderEncryptionAlgorithms.get_ExtendedBase()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_None() {
        if (!MagneticStripeReaderEncryptionAlgorithms.HasProp("__IMagneticStripeReaderEncryptionAlgorithmsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReaderEncryptionAlgorithms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderEncryptionAlgorithmsStatics.IID)
            MagneticStripeReaderEncryptionAlgorithms.__IMagneticStripeReaderEncryptionAlgorithmsStatics := IMagneticStripeReaderEncryptionAlgorithmsStatics(factoryPtr)
        }

        return MagneticStripeReaderEncryptionAlgorithms.__IMagneticStripeReaderEncryptionAlgorithmsStatics.get_None()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TripleDesDukpt() {
        if (!MagneticStripeReaderEncryptionAlgorithms.HasProp("__IMagneticStripeReaderEncryptionAlgorithmsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReaderEncryptionAlgorithms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderEncryptionAlgorithmsStatics.IID)
            MagneticStripeReaderEncryptionAlgorithms.__IMagneticStripeReaderEncryptionAlgorithmsStatics := IMagneticStripeReaderEncryptionAlgorithmsStatics(factoryPtr)
        }

        return MagneticStripeReaderEncryptionAlgorithms.__IMagneticStripeReaderEncryptionAlgorithmsStatics.get_TripleDesDukpt()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ExtendedBase() {
        if (!MagneticStripeReaderEncryptionAlgorithms.HasProp("__IMagneticStripeReaderEncryptionAlgorithmsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.MagneticStripeReaderEncryptionAlgorithms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMagneticStripeReaderEncryptionAlgorithmsStatics.IID)
            MagneticStripeReaderEncryptionAlgorithms.__IMagneticStripeReaderEncryptionAlgorithmsStatics := IMagneticStripeReaderEncryptionAlgorithmsStatics(factoryPtr)
        }

        return MagneticStripeReaderEncryptionAlgorithms.__IMagneticStripeReaderEncryptionAlgorithmsStatics.get_ExtendedBase()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

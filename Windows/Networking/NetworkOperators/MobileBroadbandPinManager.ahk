#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandPinManager.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines the PIN manager for a given mobile broadband modem and SIM Card.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * The usage and content of a Universal Integrated Circuit Card (UICC), normally called a SIM Card, can be protected by use of a code called the Personal Identification Number (PIN).
 * 
 * A MobileBroadbandPinManager object is returned by the [PinManager](mobilebroadbanddeviceinformation_pinmanager.md) property on the [MobileBroadbandDeviceInformation](mobilebroadbanddeviceinformation.md).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinmanager
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandPinManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandPinManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of the supported PIN types for the mobile broadband modem and SIM Card.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinmanager.supportedpins
     * @type {IVectorView<Integer>} 
     */
    SupportedPins {
        get => this.get_SupportedPins()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPins() {
        if (!this.HasProp("__IMobileBroadbandPinManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinManager := IMobileBroadbandPinManager(outPtr)
        }

        return this.__IMobileBroadbandPinManager.get_SupportedPins()
    }

    /**
     * Gets the mobile broadband PIN of a specific PIN type.
     * @param {Integer} pinType The mobile broadband PIN type.
     * @returns {MobileBroadbandPin} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinmanager.getpin
     */
    GetPin(pinType) {
        if (!this.HasProp("__IMobileBroadbandPinManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinManager := IMobileBroadbandPinManager(outPtr)
        }

        return this.__IMobileBroadbandPinManager.GetPin(pinType)
    }

;@endregion Instance Methods
}

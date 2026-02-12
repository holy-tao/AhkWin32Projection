#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandUicc.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Universal Integrated Circuit Card (UICC), normally called a SIM Card on a mobile broadband device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * Your code does not instantiate this class directly. Instead, retrieve an instance using the [MobileBroadbandModemConfiguration.Uicc](mobilebroadbandmodemconfiguration_uicc.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduicc
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandUicc extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandUicc

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandUicc.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique SIM Card identity on a mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduicc.simiccid
     * @type {HSTRING} 
     */
    SimIccId {
        get => this.get_SimIccId()
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
    get_SimIccId() {
        if (!this.HasProp("__IMobileBroadbandUicc")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUicc.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUicc := IMobileBroadbandUicc(outPtr)
        }

        return this.__IMobileBroadbandUicc.get_SimIccId()
    }

    /**
     * Asynchronously retrieves a list of mobile broadband UICC (SIM card) applications.
     * @returns {IAsyncOperation<MobileBroadbandUiccAppsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduicc.getuiccappsasync
     */
    GetUiccAppsAsync() {
        if (!this.HasProp("__IMobileBroadbandUicc")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUicc.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUicc := IMobileBroadbandUicc(outPtr)
        }

        return this.__IMobileBroadbandUicc.GetUiccAppsAsync()
    }

;@endregion Instance Methods
}

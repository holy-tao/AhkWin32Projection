#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandPinOperationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a mobile broadband PIN operation.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * A MobileBroadbandPinOperationResult instance is created when one of the methods on the [MobileBroadbandPin](mobilebroadbandpin.md) class is called and the result of the operation has been completed.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinoperationresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandPinOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandPinOperationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the PIN operation was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinoperationresult.issuccessful
     * @type {Boolean} 
     */
    IsSuccessful {
        get => this.get_IsSuccessful()
    }

    /**
     * Gets the number of PIN entry attempts remaining until the mobile broadband PIN is blocked.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinoperationresult.attemptsremaining
     * @type {Integer} 
     */
    AttemptsRemaining {
        get => this.get_AttemptsRemaining()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccessful() {
        if (!this.HasProp("__IMobileBroadbandPinOperationResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinOperationResult := IMobileBroadbandPinOperationResult(outPtr)
        }

        return this.__IMobileBroadbandPinOperationResult.get_IsSuccessful()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttemptsRemaining() {
        if (!this.HasProp("__IMobileBroadbandPinOperationResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPinOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPinOperationResult := IMobileBroadbandPinOperationResult(outPtr)
        }

        return this.__IMobileBroadbandPinOperationResult.get_AttemptsRemaining()
    }

;@endregion Instance Methods
}

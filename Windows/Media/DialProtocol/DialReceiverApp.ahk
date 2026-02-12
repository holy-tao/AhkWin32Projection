#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialReceiverApp.ahk
#Include .\IDialReceiverApp2.ahk
#Include .\IDialReceiverAppStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a mechanism for server apps to supply requested data to the DIAL REST service, which can be queried by client apps.
 * @remarks
 * Get an instance of this class by accessing the **Current** property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialreceiverapp
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialReceiverApp extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialReceiverApp

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialReceiverApp.IID

    /**
     * Gets an instance of the **DialReceiverApp** class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialreceiverapp.current
     * @type {DialReceiverApp} 
     */
    static Current {
        get => DialReceiverApp.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DialReceiverApp} 
     */
    static get_Current() {
        if (!DialReceiverApp.HasProp("__IDialReceiverAppStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.DialProtocol.DialReceiverApp")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDialReceiverAppStatics.IID)
            DialReceiverApp.__IDialReceiverAppStatics := IDialReceiverAppStatics(factoryPtr)
        }

        return DialReceiverApp.__IDialReceiverAppStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the a map of key/value pairs representing the data previously set with [SetAdditionalDataAsync](/uwp/api/windows.media.dialprotocol.dialreceiverapp#Windows_Media_DialProtocol_DialReceiverApp_SetAdditionalDataAsync_Windows_Foundation_Collections_IIterable_Windows_Foundation_Collections_IKeyValuePair_System_String_System_String___).
     * @returns {IAsyncOperation<IMap<HSTRING, HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialreceiverapp.getadditionaldataasync
     */
    GetAdditionalDataAsync() {
        if (!this.HasProp("__IDialReceiverApp")) {
            if ((queryResult := this.QueryInterface(IDialReceiverApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialReceiverApp := IDialReceiverApp(outPtr)
        }

        return this.__IDialReceiverApp.GetAdditionalDataAsync()
    }

    /**
     * Used by the server app to send a set of data in key/value pairs to the DIAL REST service so that it can be queried from a client app.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} additionalData The set of key/value pairs to send to the DIAL REST service.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialreceiverapp.setadditionaldataasync
     */
    SetAdditionalDataAsync(additionalData) {
        if (!this.HasProp("__IDialReceiverApp")) {
            if ((queryResult := this.QueryInterface(IDialReceiverApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialReceiverApp := IDialReceiverApp(outPtr)
        }

        return this.__IDialReceiverApp.SetAdditionalDataAsync(additionalData)
    }

    /**
     * Asynchronously gets the unique device name of the DIAL server device.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialreceiverapp.getuniquedevicenameasync
     */
    GetUniqueDeviceNameAsync() {
        if (!this.HasProp("__IDialReceiverApp2")) {
            if ((queryResult := this.QueryInterface(IDialReceiverApp2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialReceiverApp2 := IDialReceiverApp2(outPtr)
        }

        return this.__IDialReceiverApp2.GetUniqueDeviceNameAsync()
    }

;@endregion Instance Methods
}

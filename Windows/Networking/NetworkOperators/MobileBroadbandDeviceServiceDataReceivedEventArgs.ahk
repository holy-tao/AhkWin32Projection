#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceServiceDataReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [DataReceived](mobilebroadbanddeviceservicedatasession_datareceived.md) event on a [MobileBroadbandDeviceServiceDataSession](mobilebroadbanddeviceservicedatasession.md) when data is received .
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * A MobileBroadbandDeviceServiceDataReceivedEventArgs instance is created when the [DataReceived](mobilebroadbanddeviceservicedatasession_datareceived.md) event occurs on a [MobileBroadbandDeviceServiceDataSession](mobilebroadbanddeviceservicedatasession.md) once data is received.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicedatareceivedeventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceServiceDataReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceServiceDataReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceServiceDataReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data received on the [MobileBroadbandDeviceServiceDataSession](mobilebroadbanddeviceservicedatasession.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicedatareceivedeventargs.receiveddata
     * @type {IBuffer} 
     */
    ReceivedData {
        get => this.get_ReceivedData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ReceivedData() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceDataReceivedEventArgs := IMobileBroadbandDeviceServiceDataReceivedEventArgs(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceDataReceivedEventArgs.get_ReceivedData()
    }

;@endregion Instance Methods
}

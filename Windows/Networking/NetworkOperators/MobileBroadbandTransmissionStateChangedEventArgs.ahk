#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandTransmissionStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [TransmissionStateChanged](mobilebroadbandsarmanager_transmissionstatechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandtransmissionstatechangedeventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandTransmissionStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandTransmissionStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandTransmissionStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the modem is transmitting.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandtransmissionstatechangedeventargs.istransmitting
     * @type {Boolean} 
     */
    IsTransmitting {
        get => this.get_IsTransmitting()
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
    get_IsTransmitting() {
        if (!this.HasProp("__IMobileBroadbandTransmissionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandTransmissionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandTransmissionStateChangedEventArgs := IMobileBroadbandTransmissionStateChangedEventArgs(outPtr)
        }

        return this.__IMobileBroadbandTransmissionStateChangedEventArgs.get_IsTransmitting()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorTetheringOperationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of a [StartTetheringAsync](networkoperatortetheringmanager_starttetheringasync_388849923.md) or [StopTetheringAsync](networkoperatortetheringmanager_stoptetheringasync_1234797808.md) operation. In addition to the [TetheringOperationStatus](tetheringoperationstatus.md) value, it can include an optional error message string that provides mobile operator specific context to the error.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringoperationresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorTetheringOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorTetheringOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorTetheringOperationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates the result of a tethering operation. Possible values are defined by [TetheringOperationStatus](tetheringoperationstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringoperationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * An optional error message string that provides mobile operator specific context to the error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringoperationresult.additionalerrormessage
     * @type {HSTRING} 
     */
    AdditionalErrorMessage {
        get => this.get_AdditionalErrorMessage()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__INetworkOperatorTetheringOperationResult")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringOperationResult := INetworkOperatorTetheringOperationResult(outPtr)
        }

        return this.__INetworkOperatorTetheringOperationResult.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AdditionalErrorMessage() {
        if (!this.HasProp("__INetworkOperatorTetheringOperationResult")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringOperationResult := INetworkOperatorTetheringOperationResult(outPtr)
        }

        return this.__INetworkOperatorTetheringOperationResult.get_AdditionalErrorMessage()
    }

;@endregion Instance Methods
}

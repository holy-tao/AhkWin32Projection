#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnconstrainedTransferRequestResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result a request for unconstrained transfers from a [BackgroundDownloader](backgrounddownloader.md) or [BackgroundUploader](backgrounduploader.md) object.
  * 
  * Unconstrained transfer operations can run without the resource restrictions normally associated with background network operations while a device running on battery.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.unconstrainedtransferrequestresult
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class UnconstrainedTransferRequestResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUnconstrainedTransferRequestResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUnconstrainedTransferRequestResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the download or upload operations will run without the resource restrictions normally associated with background network operations while a device running on battery.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.unconstrainedtransferrequestresult.isunconstrained
     * @type {Boolean} 
     */
    IsUnconstrained {
        get => this.get_IsUnconstrained()
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
    get_IsUnconstrained() {
        if (!this.HasProp("__IUnconstrainedTransferRequestResult")) {
            if ((queryResult := this.QueryInterface(IUnconstrainedTransferRequestResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnconstrainedTransferRequestResult := IUnconstrainedTransferRequestResult(outPtr)
        }

        return this.__IUnconstrainedTransferRequestResult.get_IsUnconstrained()
    }

;@endregion Instance Methods
}

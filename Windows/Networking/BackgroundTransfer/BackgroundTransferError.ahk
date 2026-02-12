#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTransferErrorStaticMethods.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to provide errors encountered during a transfer operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfererror
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferError extends IInspectable {
;@region Static Methods
    /**
     * Gets the specific error using the returned **HRESULT** value. Possible values are defined by [WebErrorStatus](../windows.web/weberrorstatus.md).
     * @param {Integer} hresult_ An **HRESULT** returned during the operation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfererror.getstatus
     */
    static GetStatus(hresult_) {
        if (!BackgroundTransferError.HasProp("__IBackgroundTransferErrorStaticMethods")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundTransferError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTransferErrorStaticMethods.IID)
            BackgroundTransferError.__IBackgroundTransferErrorStaticMethods := IBackgroundTransferErrorStaticMethods(factoryPtr)
        }

        return BackgroundTransferError.__IBackgroundTransferErrorStaticMethods.GetStatus(hresult_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

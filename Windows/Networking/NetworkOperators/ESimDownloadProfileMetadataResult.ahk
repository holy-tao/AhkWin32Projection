#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimDownloadProfileMetadataResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents the outcome of an operation to download eSIM profile installation metadata (the result of the operation, and any installation metadata that was downloaded).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdownloadprofilemetadataresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimDownloadProfileMetadataResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimDownloadProfileMetadataResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimDownloadProfileMetadataResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result of an operation to download eSIM profile installation metadata.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdownloadprofilemetadataresult.result
     * @type {ESimOperationResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * Gets an object representing any eSIM profile installation metadata that was downloaded.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdownloadprofilemetadataresult.profilemetadata
     * @type {ESimProfileMetadata} 
     */
    ProfileMetadata {
        get => this.get_ProfileMetadata()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ESimOperationResult} 
     */
    get_Result() {
        if (!this.HasProp("__IESimDownloadProfileMetadataResult")) {
            if ((queryResult := this.QueryInterface(IESimDownloadProfileMetadataResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDownloadProfileMetadataResult := IESimDownloadProfileMetadataResult(outPtr)
        }

        return this.__IESimDownloadProfileMetadataResult.get_Result()
    }

    /**
     * 
     * @returns {ESimProfileMetadata} 
     */
    get_ProfileMetadata() {
        if (!this.HasProp("__IESimDownloadProfileMetadataResult")) {
            if ((queryResult := this.QueryInterface(IESimDownloadProfileMetadataResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDownloadProfileMetadataResult := IESimDownloadProfileMetadataResult(outPtr)
        }

        return this.__IESimDownloadProfileMetadataResult.get_ProfileMetadata()
    }

;@endregion Instance Methods
}

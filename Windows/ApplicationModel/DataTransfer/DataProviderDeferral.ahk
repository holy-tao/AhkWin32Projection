#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataProviderDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used by a source app's deferral delegate to notify a [DataPackage](datapackage.md) object that the source app will produce data from another asynchronous function.
 * @remarks
 * Source apps have the option of promising data formats to target apps, instead of supplying the format immediately. A common example is when a source app supports an image format, such as JPG, but doesn't create the format unless the target app requests it. You might want to download our [Sharing content source app sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/ShareSource).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderdeferral
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataProviderDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataProviderDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataProviderDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Informs a [DataPackage](datapackage.md) that it is ready for processing.
     * @remarks
     * For clipboard scenarios, your app must call Complete within 30 seconds of getting a deferral. For share scenarios, your app must call Complete within 6 minutes.
     * 
     * Be careful not to confuse this method with the [DataRequestDeferral.Complete](datarequestdeferral_complete_1807836922.md) method that is used in share scenarios.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IDataProviderDeferral")) {
            if ((queryResult := this.QueryInterface(IDataProviderDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProviderDeferral := IDataProviderDeferral(outPtr)
        }

        return this.__IDataProviderDeferral.Complete()
    }

;@endregion Instance Methods
}

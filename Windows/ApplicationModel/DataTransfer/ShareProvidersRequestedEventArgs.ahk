#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareProvidersRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * The event args of [ShareProvidersRequested](datatransfermanager_shareprovidersrequested.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovidersrequestedeventargs
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ShareProvidersRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareProvidersRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareProvidersRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the share providers.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovidersrequestedeventargs.providers
     * @type {IVector<ShareProvider>} 
     */
    Providers {
        get => this.get_Providers()
    }

    /**
     * Gets the data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovidersrequestedeventargs.data
     * @type {DataPackageView} 
     */
    Data {
        get => this.get_Data()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<ShareProvider>} 
     */
    get_Providers() {
        if (!this.HasProp("__IShareProvidersRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IShareProvidersRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvidersRequestedEventArgs := IShareProvidersRequestedEventArgs(outPtr)
        }

        return this.__IShareProvidersRequestedEventArgs.get_Providers()
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Data() {
        if (!this.HasProp("__IShareProvidersRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IShareProvidersRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvidersRequestedEventArgs := IShareProvidersRequestedEventArgs(outPtr)
        }

        return this.__IShareProvidersRequestedEventArgs.get_Data()
    }

    /**
     * Requests a deferral to complete actions on this object in an event handler.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovidersrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IShareProvidersRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IShareProvidersRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvidersRequestedEventArgs := IShareProvidersRequestedEventArgs(outPtr)
        }

        return this.__IShareProvidersRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}

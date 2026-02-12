#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataRequestDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables you to exchange content with a target app asynchronously.
 * @remarks
 * You get an instance of the DataRequestDeferral class when you call the [getDeferral](datarequest_getdeferral_254836512.md) method of a [DataPackage.](datapackage.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequestdeferral
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates that the content for an asynchronous share is ready for a target app, or that an error in the sharing operation occurred.
     * @remarks
     * Your app must call the **complete** method when its finished adding data to a [DataPackage](datapackage.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IDataRequestDeferral")) {
            if ((queryResult := this.QueryInterface(IDataRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataRequestDeferral := IDataRequestDeferral(outPtr)
        }

        return this.__IDataRequestDeferral.Complete()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPickerClosingDeferral.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Use by an app that provides files to indicate asynchronously that the app is finished responding to a [Closing](fileopenpickerui_closing.md) event.
 * @remarks
 * If your app participates in the File Open Picker contract, you can use this class to respond to a [Closing](fileopenpickerui_closing.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingdeferral
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class PickerClosingDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPickerClosingDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPickerClosingDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Signals that the app providing files has finished responding to a [Closing](fileopenpickerui_closing.md) event.
     * @remarks
     * Calling this method will complete the request even if [GetDeferral](targetfilerequest_getdeferral_254836512.md) has been called multiple times.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IPickerClosingDeferral")) {
            if ((queryResult := this.QueryInterface(IPickerClosingDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerClosingDeferral := IPickerClosingDeferral(outPtr)
        }

        return this.__IPickerClosingDeferral.Complete()
    }

;@endregion Instance Methods
}

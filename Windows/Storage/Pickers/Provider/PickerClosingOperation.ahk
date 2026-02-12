#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPickerClosingOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Lets an app that provides files get the deadline for responding to a [Closing](fileopenpickerui_closing.md) event and get a deferral so the app can respond to the event asynchronously.
 * @remarks
 * If your app participates in the File Open Picker contract, you can use this class to respond to a [Closing](fileopenpickerui_closing.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingoperation
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class PickerClosingOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPickerClosingOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPickerClosingOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [DateTime](../windows.foundation/datetime.md) object that indicates when the system will shut down the app that is providing files through the file picker without further notice.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingoperation.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a [PickerClosingDeferral](pickerclosingdeferral.md) that the app providing files through the file picker can use to respond asynchronously to a [Closing](fileopenpickerui_closing.md) event.
     * @remarks
     * Use this method to finish responding to a [Closing](fileopenpickerui_closing.md) event asynchronously.
     * @returns {PickerClosingDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingoperation.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPickerClosingOperation")) {
            if ((queryResult := this.QueryInterface(IPickerClosingOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerClosingOperation := IPickerClosingOperation(outPtr)
        }

        return this.__IPickerClosingOperation.GetDeferral()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IPickerClosingOperation")) {
            if ((queryResult := this.QueryInterface(IPickerClosingOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerClosingOperation := IPickerClosingOperation(outPtr)
        }

        return this.__IPickerClosingOperation.get_Deadline()
    }

;@endregion Instance Methods
}

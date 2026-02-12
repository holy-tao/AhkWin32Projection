#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPickerClosingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about a [Closing](fileopenpickerui_closing.md) event.
 * @remarks
 * This object is passed to the event handler for [Closing](fileopenpickerui_closing.md) events.
 * 
 * If your app participates in the File Open Picker contract and a [Closing](fileopenpickerui_closing.md) event fires, your app should respond by performing cleanup tasks before your app is closed. For example, if the user cancels the file picker, you could respond to this event by cleaning up temporary files that were added to the file picker when the user chose them.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingeventargs
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class PickerClosingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPickerClosingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPickerClosingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [pickerClosingOperation](pickerclosingoperation.md) object that is used to respond to a [Closing](fileopenpickerui_closing.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingeventargs.closingoperation
     * @type {PickerClosingOperation} 
     */
    ClosingOperation {
        get => this.get_ClosingOperation()
    }

    /**
     * Gets a value that indicates whether the file picker is closing because the user cancelled it.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.pickerclosingeventargs.iscanceled
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PickerClosingOperation} 
     */
    get_ClosingOperation() {
        if (!this.HasProp("__IPickerClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPickerClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerClosingEventArgs := IPickerClosingEventArgs(outPtr)
        }

        return this.__IPickerClosingEventArgs.get_ClosingOperation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__IPickerClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPickerClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerClosingEventArgs := IPickerClosingEventArgs(outPtr)
        }

        return this.__IPickerClosingEventArgs.get_IsCanceled()
    }

;@endregion Instance Methods
}

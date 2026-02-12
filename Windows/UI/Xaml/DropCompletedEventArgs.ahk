#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RoutedEventArgs.ahk
#Include .\IDropCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the [DropCompleted](uielement_dropcompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dropcompletedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DropCompletedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDropCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDropCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the type of drag-and-drop operation, and whether the operation was successful.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dropcompletedeventargs.dropresult
     * @type {Integer} 
     */
    DropResult {
        get => this.get_DropResult()
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
    get_DropResult() {
        if (!this.HasProp("__IDropCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDropCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropCompletedEventArgs := IDropCompletedEventArgs(outPtr)
        }

        return this.__IDropCompletedEventArgs.get_DropResult()
    }

;@endregion Instance Methods
}

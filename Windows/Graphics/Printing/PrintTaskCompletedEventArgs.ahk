#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Reports the completion of the print task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskcompletedeventargs
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the completion status of the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskcompletedeventargs.completion
     * @type {Integer} 
     */
    Completion {
        get => this.get_Completion()
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
    get_Completion() {
        if (!this.HasProp("__IPrintTaskCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskCompletedEventArgs := IPrintTaskCompletedEventArgs(outPtr)
        }

        return this.__IPrintTaskCompletedEventArgs.get_Completion()
    }

;@endregion Instance Methods
}

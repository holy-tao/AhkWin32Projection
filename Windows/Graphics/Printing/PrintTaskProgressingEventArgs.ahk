#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskProgressingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the event arguments for the [PrintTask.Progressing](printtask_progressing.md) event. This event is raised during the submitting phase of the [PrintTask](printtask.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskprogressingeventargs
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskProgressingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskProgressingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskProgressingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the page count for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskprogressingeventargs.documentpagecount
     * @type {Integer} 
     */
    DocumentPageCount {
        get => this.get_DocumentPageCount()
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
    get_DocumentPageCount() {
        if (!this.HasProp("__IPrintTaskProgressingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskProgressingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskProgressingEventArgs := IPrintTaskProgressingEventArgs(outPtr)
        }

        return this.__IPrintTaskProgressingEventArgs.get_DocumentPageCount()
    }

;@endregion Instance Methods
}

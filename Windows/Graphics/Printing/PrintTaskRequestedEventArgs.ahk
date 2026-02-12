#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event arguments associated with the [PrintTaskRequest](printtaskrequest.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequestedeventargs
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [PrintTaskRequest](printtaskrequest.md) object for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequestedeventargs.request
     * @type {PrintTaskRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintTaskRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IPrintTaskRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskRequestedEventArgs := IPrintTaskRequestedEventArgs(outPtr)
        }

        return this.__IPrintTaskRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}

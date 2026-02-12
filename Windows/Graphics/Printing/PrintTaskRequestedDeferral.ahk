#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskRequestedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to defer the request for a print task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequesteddeferral
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskRequestedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskRequestedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskRequestedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates when the deferral for the print task request is over.
     * @remarks
     * Although this method does not have a return value, it uses the appropriate HRESULT value to indicate a successful or a failed method call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtaskrequesteddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IPrintTaskRequestedDeferral")) {
            if ((queryResult := this.QueryInterface(IPrintTaskRequestedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskRequestedDeferral := IPrintTaskRequestedDeferral(outPtr)
        }

        return this.__IPrintTaskRequestedDeferral.Complete()
    }

;@endregion Instance Methods
}

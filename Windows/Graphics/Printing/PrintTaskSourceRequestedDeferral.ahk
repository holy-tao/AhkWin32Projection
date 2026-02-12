#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskSourceRequestedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to defer the request for a print task source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtasksourcerequesteddeferral
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintTaskSourceRequestedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskSourceRequestedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskSourceRequestedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates when the deferral for a print task source request is over.
     * @remarks
     * Although **Complete** does not have a return value, it uses the appropriate HRESULT message to indicate a successful or a failed method call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printtasksourcerequesteddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IPrintTaskSourceRequestedDeferral")) {
            if ((queryResult := this.QueryInterface(IPrintTaskSourceRequestedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskSourceRequestedDeferral := IPrintTaskSourceRequestedDeferral(outPtr)
        }

        return this.__IPrintTaskSourceRequestedDeferral.Complete()
    }

;@endregion Instance Methods
}

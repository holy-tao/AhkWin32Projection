#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTicketValue.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a value of a printing parameter or print option property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketvalue
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTicketValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTicketValue.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of value that this class object represents.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketvalue.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
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
    get_Type() {
        if (!this.HasProp("__IPrintTicketValue")) {
            if ((queryResult := this.QueryInterface(IPrintTicketValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketValue := IPrintTicketValue(outPtr)
        }

        return this.__IPrintTicketValue.get_Type()
    }

    /**
     * Converts the print value to an `int`.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketvalue.getvalueasinteger
     */
    GetValueAsInteger() {
        if (!this.HasProp("__IPrintTicketValue")) {
            if ((queryResult := this.QueryInterface(IPrintTicketValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketValue := IPrintTicketValue(outPtr)
        }

        return this.__IPrintTicketValue.GetValueAsInteger()
    }

    /**
     * Converts the print value to a string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketvalue.getvalueasstring
     */
    GetValueAsString() {
        if (!this.HasProp("__IPrintTicketValue")) {
            if ((queryResult := this.QueryInterface(IPrintTicketValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketValue := IPrintTicketValue(outPtr)
        }

        return this.__IPrintTicketValue.GetValueAsString()
    }

;@endregion Instance Methods
}

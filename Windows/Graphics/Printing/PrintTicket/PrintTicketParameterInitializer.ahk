#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTicketParameterInitializer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a the selected setting for a printing parameter. A printing parameter is a device capability that can be set to values within a range, unlike a feature which has an enumerable list of settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterinitializer
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketParameterInitializer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTicketParameterInitializer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTicketParameterInitializer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the canonical name of the print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterinitializer.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the XML namespace of the print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterinitializer.xmlnamespace
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * Gets the XML node of the print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterinitializer.xmlnode
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * Gets or sets the value of the print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterinitializer.value
     * @type {PrintTicketValue} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPrintTicketParameterInitializer")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterInitializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterInitializer := IPrintTicketParameterInitializer(outPtr)
        }

        return this.__IPrintTicketParameterInitializer.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        if (!this.HasProp("__IPrintTicketParameterInitializer")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterInitializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterInitializer := IPrintTicketParameterInitializer(outPtr)
        }

        return this.__IPrintTicketParameterInitializer.get_XmlNamespace()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        if (!this.HasProp("__IPrintTicketParameterInitializer")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterInitializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterInitializer := IPrintTicketParameterInitializer(outPtr)
        }

        return this.__IPrintTicketParameterInitializer.get_XmlNode()
    }

    /**
     * 
     * @param {PrintTicketValue} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IPrintTicketParameterInitializer")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterInitializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterInitializer := IPrintTicketParameterInitializer(outPtr)
        }

        return this.__IPrintTicketParameterInitializer.put_Value(value)
    }

    /**
     * 
     * @returns {PrintTicketValue} 
     */
    get_Value() {
        if (!this.HasProp("__IPrintTicketParameterInitializer")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterInitializer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterInitializer := IPrintTicketParameterInitializer(outPtr)
        }

        return this.__IPrintTicketParameterInitializer.get_Value()
    }

;@endregion Instance Methods
}

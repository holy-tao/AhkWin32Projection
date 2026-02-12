#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTicketOption.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a single possible setting for a print feature.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketOption extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTicketOption

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTicketOption.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the canonical name of this print option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the XML namespace of this print option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.xmlnamespace
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * Gets the XML node of this print option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.xmlnode
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * Gets the UI-friendly display name of this option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
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
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.get_XmlNamespace()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.get_XmlNode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.get_DisplayName()
    }

    /**
     * Gets the XML node of a property element of the current print option.
     * @param {HSTRING} name The canonical name of the property.
     * @param {HSTRING} xmlNamespace The XML namespace of the property.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.getpropertynode
     */
    GetPropertyNode(name, xmlNamespace) {
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.GetPropertyNode(name, xmlNamespace)
    }

    /**
     * Gets the XML node of a scored property element of the current print option.
     * @param {HSTRING} name The canonical name of the scored property.
     * @param {HSTRING} xmlNamespace The XML namespace of the scored property.
     * @returns {IXmlNode} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.getscoredpropertynode
     */
    GetScoredPropertyNode(name, xmlNamespace) {
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.GetScoredPropertyNode(name, xmlNamespace)
    }

    /**
     * Gets the value associated with a property element of the current print option.
     * @param {HSTRING} name The canonical name of the property.
     * @param {HSTRING} xmlNamespace The XML namespace of the property.
     * @returns {PrintTicketValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.getpropertyvalue
     */
    GetPropertyValue(name, xmlNamespace) {
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.GetPropertyValue(name, xmlNamespace)
    }

    /**
     * Gets the value associated with a scored property element of the current print option.
     * @param {HSTRING} name The canonical name of the scored property.
     * @param {HSTRING} xmlNamespace The XML namespace of the scored property.
     * @returns {PrintTicketValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketoption.getscoredpropertyvalue
     */
    GetScoredPropertyValue(name, xmlNamespace) {
        if (!this.HasProp("__IPrintTicketOption")) {
            if ((queryResult := this.QueryInterface(IPrintTicketOption.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketOption := IPrintTicketOption(outPtr)
        }

        return this.__IPrintTicketOption.GetScoredPropertyValue(name, xmlNamespace)
    }

;@endregion Instance Methods
}

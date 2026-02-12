#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTicketParameterDefinition.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the definition and value characteristics of a print parameter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketParameterDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTicketParameterDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTicketParameterDefinition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the canonical name of this print parameter
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the XML namespace of the print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition.xmlnamespace
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * Get the XML node of the print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition.xmlnode
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * Gets the data type of this print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition.datatype
     * @type {Integer} 
     */
    DataType {
        get => this.get_DataType()
    }

    /**
     * Gets the unit type associated with the value of this print parameter.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition.unittype
     * @type {HSTRING} 
     */
    UnitType {
        get => this.get_UnitType()
    }

    /**
     * Gets the minimum value that can be assigned to this print parameter (assuming an integer datatype) or the minimum length of string that can be assigned (assuming a string datatype).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition.rangemin
     * @type {Integer} 
     */
    RangeMin {
        get => this.get_RangeMin()
    }

    /**
     * Gets the maximum value that can be assigned to this print parameter (assuming an integer datatype) or the maximum length of string that can be assigned (assuming a string datatype).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketparameterdefinition.rangemax
     * @type {Integer} 
     */
    RangeMax {
        get => this.get_RangeMax()
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
        if (!this.HasProp("__IPrintTicketParameterDefinition")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterDefinition := IPrintTicketParameterDefinition(outPtr)
        }

        return this.__IPrintTicketParameterDefinition.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        if (!this.HasProp("__IPrintTicketParameterDefinition")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterDefinition := IPrintTicketParameterDefinition(outPtr)
        }

        return this.__IPrintTicketParameterDefinition.get_XmlNamespace()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        if (!this.HasProp("__IPrintTicketParameterDefinition")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterDefinition := IPrintTicketParameterDefinition(outPtr)
        }

        return this.__IPrintTicketParameterDefinition.get_XmlNode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataType() {
        if (!this.HasProp("__IPrintTicketParameterDefinition")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterDefinition := IPrintTicketParameterDefinition(outPtr)
        }

        return this.__IPrintTicketParameterDefinition.get_DataType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnitType() {
        if (!this.HasProp("__IPrintTicketParameterDefinition")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterDefinition := IPrintTicketParameterDefinition(outPtr)
        }

        return this.__IPrintTicketParameterDefinition.get_UnitType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMin() {
        if (!this.HasProp("__IPrintTicketParameterDefinition")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterDefinition := IPrintTicketParameterDefinition(outPtr)
        }

        return this.__IPrintTicketParameterDefinition.get_RangeMin()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMax() {
        if (!this.HasProp("__IPrintTicketParameterDefinition")) {
            if ((queryResult := this.QueryInterface(IPrintTicketParameterDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketParameterDefinition := IPrintTicketParameterDefinition(outPtr)
        }

        return this.__IPrintTicketParameterDefinition.get_RangeMax()
    }

;@endregion Instance Methods
}

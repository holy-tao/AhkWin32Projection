#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTicketFeature.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a modifiable feature of the print ticket. A feature is a device capability that has an enumerable list of settings, unlike a parameter which can be set to values within a range.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketFeature extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTicketFeature

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTicketFeature.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the canonical name of the print ticket feature.
     * @remarks
     * This property should be used by the app to identify specific print features.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the XML namespace that this print feature belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.xmlnamespace
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * Gets the XML node that this print feature belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.xmlnode
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * Gets the friendly name of the print ticket feature.
     * @remarks
     * This property should be used for UI display.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a list of print ticket options available for this feature.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.options
     * @type {IVectorView<PrintTicketOption>} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * Gets the selection type for this print feature.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.selectiontype
     * @type {Integer} 
     */
    SelectionType {
        get => this.get_SelectionType()
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
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.get_XmlNamespace()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.get_XmlNode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.get_DisplayName()
    }

    /**
     * Gets the specified print feature option object.
     * @param {HSTRING} name The canonical name of the print feature option.
     * @param {HSTRING} xmlNamespace The XML namespace of the print feature option.
     * @returns {PrintTicketOption} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.getoption
     */
    GetOption(name, xmlNamespace) {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.GetOption(name, xmlNamespace)
    }

    /**
     * 
     * @returns {IVectorView<PrintTicketOption>} 
     */
    get_Options() {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.get_Options()
    }

    /**
     * Gets the option that is currently selected for this print feature.
     * @returns {PrintTicketOption} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.getselectedoption
     */
    GetSelectedOption() {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.GetSelectedOption()
    }

    /**
     * Sets the given option as the selected option for this print feature.
     * @param {PrintTicketOption} value The option to be set as selected.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeature.setselectedoption
     */
    SetSelectedOption(value) {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.SetSelectedOption(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionType() {
        if (!this.HasProp("__IPrintTicketFeature")) {
            if ((queryResult := this.QueryInterface(IPrintTicketFeature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketFeature := IPrintTicketFeature(outPtr)
        }

        return this.__IPrintTicketFeature.get_SelectionType()
    }

;@endregion Instance Methods
}

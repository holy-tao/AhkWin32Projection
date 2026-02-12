#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTicketCapabilities.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class presents the configuration options that are supported by the printer. It contains read-only print feature objects with certain options available for each.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTicketCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTicketCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the canonical name of this object.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the XML namespace for this capabilities object.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.xmlnamespace
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * Gets the XML node for this capabilities object.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.xmlnode
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * Gets the available document binding feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.documentbindingfeature
     * @type {PrintTicketFeature} 
     */
    DocumentBindingFeature {
        get => this.get_DocumentBindingFeature()
    }

    /**
     * Gets the available document collation feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.documentcollatefeature
     * @type {PrintTicketFeature} 
     */
    DocumentCollateFeature {
        get => this.get_DocumentCollateFeature()
    }

    /**
     * Gets the available duplex printing feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.documentduplexfeature
     * @type {PrintTicketFeature} 
     */
    DocumentDuplexFeature {
        get => this.get_DocumentDuplexFeature()
    }

    /**
     * Gets the available document hole-punch feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.documentholepunchfeature
     * @type {PrintTicketFeature} 
     */
    DocumentHolePunchFeature {
        get => this.get_DocumentHolePunchFeature()
    }

    /**
     * Gets the available printing input bin feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.documentinputbinfeature
     * @type {PrintTicketFeature} 
     */
    DocumentInputBinFeature {
        get => this.get_DocumentInputBinFeature()
    }

    /**
     * Gets the available N-up printing feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.documentnupfeature
     * @type {PrintTicketFeature} 
     */
    DocumentNUpFeature {
        get => this.get_DocumentNUpFeature()
    }

    /**
     * Gets the available document staple feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.documentstaplefeature
     * @type {PrintTicketFeature} 
     */
    DocumentStapleFeature {
        get => this.get_DocumentStapleFeature()
    }

    /**
     * Gets the avilable job passcode feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.jobpasscodefeature
     * @type {PrintTicketFeature} 
     */
    JobPasscodeFeature {
        get => this.get_JobPasscodeFeature()
    }

    /**
     * Gets the available document borderless feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.pageborderlessfeature
     * @type {PrintTicketFeature} 
     */
    PageBorderlessFeature {
        get => this.get_PageBorderlessFeature()
    }

    /**
     * Gets the available page media size feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.pagemediasizefeature
     * @type {PrintTicketFeature} 
     */
    PageMediaSizeFeature {
        get => this.get_PageMediaSizeFeature()
    }

    /**
     * Gets the available page media type feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.pagemediatypefeature
     * @type {PrintTicketFeature} 
     */
    PageMediaTypeFeature {
        get => this.get_PageMediaTypeFeature()
    }

    /**
     * Gets the available page orientation feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.pageorientationfeature
     * @type {PrintTicketFeature} 
     */
    PageOrientationFeature {
        get => this.get_PageOrientationFeature()
    }

    /**
     * Gets the available page color feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.pageoutputcolorfeature
     * @type {PrintTicketFeature} 
     */
    PageOutputColorFeature {
        get => this.get_PageOutputColorFeature()
    }

    /**
     * Gets the available page quality feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.pageoutputqualityfeature
     * @type {PrintTicketFeature} 
     */
    PageOutputQualityFeature {
        get => this.get_PageOutputQualityFeature()
    }

    /**
     * Gets the available page resolution feature for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.pageresolutionfeature
     * @type {PrintTicketFeature} 
     */
    PageResolutionFeature {
        get => this.get_PageResolutionFeature()
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
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_XmlNamespace()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_XmlNode()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentBindingFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_DocumentBindingFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentCollateFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_DocumentCollateFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentDuplexFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_DocumentDuplexFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentHolePunchFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_DocumentHolePunchFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentInputBinFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_DocumentInputBinFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentNUpFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_DocumentNUpFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentStapleFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_DocumentStapleFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_JobPasscodeFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_JobPasscodeFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageBorderlessFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_PageBorderlessFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageMediaSizeFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_PageMediaSizeFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageMediaTypeFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_PageMediaTypeFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOrientationFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_PageOrientationFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOutputColorFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_PageOutputColorFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOutputQualityFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_PageOutputQualityFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageResolutionFeature() {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.get_PageResolutionFeature()
    }

    /**
     * Gets the specified print feature object.
     * @param {HSTRING} name The canonical name of the print feature.
     * @param {HSTRING} xmlNamespace The XML namespace of the print feature.
     * @returns {PrintTicketFeature} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.getfeature
     */
    GetFeature(name, xmlNamespace) {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.GetFeature(name, xmlNamespace)
    }

    /**
     * Gets the parameter definition object for the specified printing parameter.
     * @param {HSTRING} name The canonical name of the printing parameter.
     * @param {HSTRING} xmlNamespace The XML namespace of the printing parameter.
     * @returns {PrintTicketParameterDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketcapabilities.getparameterdefinition
     */
    GetParameterDefinition(name, xmlNamespace) {
        if (!this.HasProp("__IPrintTicketCapabilities")) {
            if ((queryResult := this.QueryInterface(IPrintTicketCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTicketCapabilities := IPrintTicketCapabilities(outPtr)
        }

        return this.__IPrintTicketCapabilities.GetParameterDefinition(name, xmlNamespace)
    }

;@endregion Instance Methods
}

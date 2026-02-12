#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWorkflowPrintTicket.ahk
#Include .\IWorkflowPrintTicketFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class represents an XML *PrintTicket document* and allows it to be modified easily. The *PrintTicket document* contains instructions on how the printer should set its various features for a printing task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class WorkflowPrintTicket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWorkflowPrintTicket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWorkflowPrintTicket.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} printerName 
     * @param {IInputStream} printTicketStream 
     * @returns {WorkflowPrintTicket} 
     */
    static CreateInstance(printerName, printTicketStream) {
        if (!WorkflowPrintTicket.HasProp("__IWorkflowPrintTicketFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintTicket.WorkflowPrintTicket")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWorkflowPrintTicketFactory.IID)
            WorkflowPrintTicket.__IWorkflowPrintTicketFactory := IWorkflowPrintTicketFactory(factoryPtr)
        }

        return WorkflowPrintTicket.__IWorkflowPrintTicketFactory.CreateInstance(printerName, printTicketStream)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the canonical name of this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the XML namespace for the print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.xmlnamespace
     * @type {HSTRING} 
     */
    XmlNamespace {
        get => this.get_XmlNamespace()
    }

    /**
     * Gets the XML node for the print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.xmlnode
     * @type {IXmlNode} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * Gets the document binding configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.documentbindingfeature
     * @type {PrintTicketFeature} 
     */
    DocumentBindingFeature {
        get => this.get_DocumentBindingFeature()
    }

    /**
     * Gets the document collation configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.documentcollatefeature
     * @type {PrintTicketFeature} 
     */
    DocumentCollateFeature {
        get => this.get_DocumentCollateFeature()
    }

    /**
     * Gets the duplex printing configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.documentduplexfeature
     * @type {PrintTicketFeature} 
     */
    DocumentDuplexFeature {
        get => this.get_DocumentDuplexFeature()
    }

    /**
     * Gets the document hole-punch configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.documentholepunchfeature
     * @type {PrintTicketFeature} 
     */
    DocumentHolePunchFeature {
        get => this.get_DocumentHolePunchFeature()
    }

    /**
     * Gets the printing input bin configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.documentinputbinfeature
     * @type {PrintTicketFeature} 
     */
    DocumentInputBinFeature {
        get => this.get_DocumentInputBinFeature()
    }

    /**
     * Gets the N-up printing configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.documentnupfeature
     * @type {PrintTicketFeature} 
     */
    DocumentNUpFeature {
        get => this.get_DocumentNUpFeature()
    }

    /**
     * Gets the document staple configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.documentstaplefeature
     * @type {PrintTicketFeature} 
     */
    DocumentStapleFeature {
        get => this.get_DocumentStapleFeature()
    }

    /**
     * Gets the job passcode configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.jobpasscodefeature
     * @type {PrintTicketFeature} 
     */
    JobPasscodeFeature {
        get => this.get_JobPasscodeFeature()
    }

    /**
     * Gets the document borderless configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.pageborderlessfeature
     * @type {PrintTicketFeature} 
     */
    PageBorderlessFeature {
        get => this.get_PageBorderlessFeature()
    }

    /**
     * Gets the page media size configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.pagemediasizefeature
     * @type {PrintTicketFeature} 
     */
    PageMediaSizeFeature {
        get => this.get_PageMediaSizeFeature()
    }

    /**
     * Gets the page media type configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.pagemediatypefeature
     * @type {PrintTicketFeature} 
     */
    PageMediaTypeFeature {
        get => this.get_PageMediaTypeFeature()
    }

    /**
     * Gets the page orientation configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.pageorientationfeature
     * @type {PrintTicketFeature} 
     */
    PageOrientationFeature {
        get => this.get_PageOrientationFeature()
    }

    /**
     * Gets the page color configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.pageoutputcolorfeature
     * @type {PrintTicketFeature} 
     */
    PageOutputColorFeature {
        get => this.get_PageOutputColorFeature()
    }

    /**
     * Gets the page quality configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.pageoutputqualityfeature
     * @type {PrintTicketFeature} 
     */
    PageOutputQualityFeature {
        get => this.get_PageOutputQualityFeature()
    }

    /**
     * Gets the page resolution configuration for this print ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.pageresolutionfeature
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
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_XmlNamespace() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_XmlNamespace()
    }

    /**
     * 
     * @returns {IXmlNode} 
     */
    get_XmlNode() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_XmlNode()
    }

    /**
     * Gets the print capabilities object for this print ticket.
     * @returns {PrintTicketCapabilities} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.getcapabilities
     */
    GetCapabilities() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.GetCapabilities()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentBindingFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_DocumentBindingFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentCollateFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_DocumentCollateFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentDuplexFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_DocumentDuplexFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentHolePunchFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_DocumentHolePunchFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentInputBinFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_DocumentInputBinFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentNUpFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_DocumentNUpFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_DocumentStapleFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_DocumentStapleFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_JobPasscodeFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_JobPasscodeFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageBorderlessFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_PageBorderlessFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageMediaSizeFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_PageMediaSizeFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageMediaTypeFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_PageMediaTypeFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOrientationFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_PageOrientationFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOutputColorFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_PageOutputColorFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageOutputQualityFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_PageOutputQualityFeature()
    }

    /**
     * 
     * @returns {PrintTicketFeature} 
     */
    get_PageResolutionFeature() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.get_PageResolutionFeature()
    }

    /**
     * Gets the specified print feature object.
     * @param {HSTRING} name The canonical name of the print feature.
     * @param {HSTRING} xmlNamespace The XML namespace of the print feature.
     * @returns {PrintTicketFeature} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.getfeature
     */
    GetFeature(name, xmlNamespace) {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.GetFeature(name, xmlNamespace)
    }

    /**
     * Notifies the print system that the XML DOM object has changed.
     * @remarks
     * This method should be called when the client has made direct modifications to the XML _PrintTicket document_.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.notifyxmlchangedasync
     */
    NotifyXmlChangedAsync() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.NotifyXmlChangedAsync()
    }

    /**
     * Checks that the given print ticket does not ask for any printing functionality that the printer does not support.
     * @returns {IAsyncOperation<WorkflowPrintTicketValidationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.validateasync
     */
    ValidateAsync() {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.ValidateAsync()
    }

    /**
     * Gets the parameter initializer object for a specified printing parameter.
     * @param {HSTRING} name The canonical name of the printing parameter
     * @param {HSTRING} xmlNamespace The XML namespace of the printing parameter.
     * @returns {PrintTicketParameterInitializer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.getparameterinitializer
     */
    GetParameterInitializer(name, xmlNamespace) {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.GetParameterInitializer(name, xmlNamespace)
    }

    /**
     * Sets the parameter initializer object for a specified printing parameter. This can only be done if an initializer for the specified parameter doesn't yet exist.
     * @param {HSTRING} name The canonical name of the printing parameter
     * @param {HSTRING} xmlNamespace The XML namespace of the printing parameter.
     * @param {Integer} integerValue The int value to set this parameter to.
     * @returns {PrintTicketParameterInitializer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.setparameterinitializerasinteger
     */
    SetParameterInitializerAsInteger(name, xmlNamespace, integerValue) {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.SetParameterInitializerAsInteger(name, xmlNamespace, integerValue)
    }

    /**
     * Sets the given print parameter to the given string value. This can only be done if an initializer for the specified parameter doesn't yet exist.
     * @param {HSTRING} name The canonical name of the printing parameter.
     * @param {HSTRING} xmlNamespace The XML namespace of the printing parameter.
     * @param {HSTRING} stringValue The value to set this parameter to.
     * @returns {PrintTicketParameterInitializer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.setparameterinitializerasstring
     */
    SetParameterInitializerAsString(name, xmlNamespace, stringValue) {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.SetParameterInitializerAsString(name, xmlNamespace, stringValue)
    }

    /**
     * Merges a newly configured print ticket onto the current print ticket and validates the merged ticket, guaranteeing that it does not ask for any printing functionality that the printer does not support.
     * @param {WorkflowPrintTicket} deltaShemaTicket The print ticket object that has been configured.
     * @returns {WorkflowPrintTicket} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.workflowprintticket.mergeandvalidateticket
     */
    MergeAndValidateTicket(deltaShemaTicket) {
        if (!this.HasProp("__IWorkflowPrintTicket")) {
            if ((queryResult := this.QueryInterface(IWorkflowPrintTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWorkflowPrintTicket := IWorkflowPrintTicket(outPtr)
        }

        return this.__IWorkflowPrintTicket.MergeAndValidateTicket(deltaShemaTicket)
    }

;@endregion Instance Methods
}

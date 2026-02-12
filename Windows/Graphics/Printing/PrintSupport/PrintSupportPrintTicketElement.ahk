#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportPrintTicketElement.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an element of a PrintTicket, which is a collection of various print related features and their values used to capture the user's intent for a given print job.
 * @remarks
 * This class is used to supply additional features and parameters for a PrintTicket through calls to [SetAdditionalFeatures](/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.setadditionalfeatures)) and [SetAdditionalParameters](/uwp/api/windows.graphics.printing.printsupport.printsupportprinterselectedeventargs.setadditionalparameters)).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintticketelement
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportPrintTicketElement extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportPrintTicketElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportPrintTicketElement.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    LocalName {
        get => this.get_LocalName()
        set => this.put_LocalName(value)
    }

    /**
     * @type {HSTRING} 
     */
    NamespaceUri {
        get => this.get_NamespaceUri()
        set => this.put_NamespaceUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **PrintSupportPrintTicketElement** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintSupport.PrintSupportPrintTicketElement")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalName() {
        if (!this.HasProp("__IPrintSupportPrintTicketElement")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketElement := IPrintSupportPrintTicketElement(outPtr)
        }

        return this.__IPrintSupportPrintTicketElement.get_LocalName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LocalName(value) {
        if (!this.HasProp("__IPrintSupportPrintTicketElement")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketElement := IPrintSupportPrintTicketElement(outPtr)
        }

        return this.__IPrintSupportPrintTicketElement.put_LocalName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NamespaceUri() {
        if (!this.HasProp("__IPrintSupportPrintTicketElement")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketElement := IPrintSupportPrintTicketElement(outPtr)
        }

        return this.__IPrintSupportPrintTicketElement.get_NamespaceUri()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_NamespaceUri(value) {
        if (!this.HasProp("__IPrintSupportPrintTicketElement")) {
            if ((queryResult := this.QueryInterface(IPrintSupportPrintTicketElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportPrintTicketElement := IPrintSupportPrintTicketElement(outPtr)
        }

        return this.__IPrintSupportPrintTicketElement.put_NamespaceUri(value)
    }

;@endregion Instance Methods
}

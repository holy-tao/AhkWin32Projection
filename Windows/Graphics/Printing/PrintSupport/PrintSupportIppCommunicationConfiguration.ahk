#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportIppCommunicationConfiguration.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a configuration management for Internet Printing Protocol (IPP) communications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationconfiguration
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportIppCommunicationConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportIppCommunicationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportIppCommunicationConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value from the [IppPrinterCommunicationKind](ippprintercommunicationkind.md) enumeration specifying the communication medium for the IPP printer.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationconfiguration.communicationkind
     * @type {Integer} 
     */
    CommunicationKind {
        get => this.get_CommunicationKind()
    }

    /**
     * Gets a boolean value that indicates if the timeout intervals for IPP communications can be modified.
     * @remarks
     * This property will be false when [CommunicationKind](printsupportippcommunicationconfiguration_communicationkind.md) is [PrinterConnection](ippprintercommunicationkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationconfiguration.canmodifytimeouts
     * @type {Boolean} 
     */
    CanModifyTimeouts {
        get => this.get_CanModifyTimeouts()
    }

    /**
     * Gets a [PrintSupportIppCommunicationTimeouts](printsupportippcommunicationtimeouts.md) specifying the timeout intervals for getting and setting IPP attributes.
     * @remarks
     * Setting the timeout intervals will fail if [CanModifyTimeouts](printsupportippcommunicationconfiguration_canmodifytimeouts.md) is false.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationconfiguration.ippattributetimeouts
     * @type {PrintSupportIppCommunicationTimeouts} 
     */
    IppAttributeTimeouts {
        get => this.get_IppAttributeTimeouts()
    }

    /**
     * Gets a [PrintSupportIppCommunicationTimeouts](printsupportippcommunicationtimeouts.md) specifying the timeout intervals for getting and setting IPP jobs.
     * @remarks
     * Setting the timeout intervals will fail if [CanModifyTimeouts](printsupportippcommunicationconfiguration_canmodifytimeouts.md) is false.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportippcommunicationconfiguration.ippjobtimeouts
     * @type {PrintSupportIppCommunicationTimeouts} 
     */
    IppJobTimeouts {
        get => this.get_IppJobTimeouts()
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
    get_CommunicationKind() {
        if (!this.HasProp("__IPrintSupportIppCommunicationConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationConfiguration := IPrintSupportIppCommunicationConfiguration(outPtr)
        }

        return this.__IPrintSupportIppCommunicationConfiguration.get_CommunicationKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyTimeouts() {
        if (!this.HasProp("__IPrintSupportIppCommunicationConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationConfiguration := IPrintSupportIppCommunicationConfiguration(outPtr)
        }

        return this.__IPrintSupportIppCommunicationConfiguration.get_CanModifyTimeouts()
    }

    /**
     * 
     * @returns {PrintSupportIppCommunicationTimeouts} 
     */
    get_IppAttributeTimeouts() {
        if (!this.HasProp("__IPrintSupportIppCommunicationConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationConfiguration := IPrintSupportIppCommunicationConfiguration(outPtr)
        }

        return this.__IPrintSupportIppCommunicationConfiguration.get_IppAttributeTimeouts()
    }

    /**
     * 
     * @returns {PrintSupportIppCommunicationTimeouts} 
     */
    get_IppJobTimeouts() {
        if (!this.HasProp("__IPrintSupportIppCommunicationConfiguration")) {
            if ((queryResult := this.QueryInterface(IPrintSupportIppCommunicationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportIppCommunicationConfiguration := IPrintSupportIppCommunicationConfiguration(outPtr)
        }

        return this.__IPrintSupportIppCommunicationConfiguration.get_IppJobTimeouts()
    }

;@endregion Instance Methods
}

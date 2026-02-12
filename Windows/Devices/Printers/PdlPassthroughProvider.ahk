#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPdlPassthroughProvider.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a page description language (PDL) pass-through provider.
 * @remarks
 * A page description language (PDL) is a formal way of describing a printed page at a high level (whereas a low-level way of describing a printed page might be a bitmap or raster). One well-known example of a PDL is the PDF format. The default format for Windows printing is XPS. And by default all printing content is converted to XPS before being converted to the particular PDL format that the printer supports. When the PDL is PDF, for example, converting by way of XPS causes some quality loss. And that's because XPS doesn't support the color fidelity that's supported by PDF.
 * 
 * But you can perform high-quality printing by what's called PDL pass-through. For example, you can pass a PDF document from a PDF printing application directly to an Internet Printing Protocol (IPP) printer whose PDL is PDF. And that process bypasses any intermediary and lossy conversion to XPS. The PDL in question needn't necessarily be PDF; you can perform PDL pass-through with any PDL.
 * 
 * The target printers for PDL pass-through are IPP Printers. With IPP Printers, there are no custom drivers; and print support applications (PSAs) can be added in order to provide customization. Also, the Windows print system can identify the PDL formats that are supported by the printer.
 * 
 * You can check whether a printer is an IPP by calling [IppPrintDevice.IsIppPrinter](./ippprintdevice_isippprinter_869798417.md); and you can check whether an IPP printer supports PDL pass-through by getting the value of the [IppPrintDevice.IsPdlPassthroughSupported](./ippprintdevice_ispdlpassthroughsupported_1510208979.md) property. Then, you can begin a print job by using a **PdlPassthroughProvider**, and write PDL content via PDL pass-through.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughprovider
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class PdlPassthroughProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPdlPassthroughProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPdlPassthroughProvider.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a vector of strings containing all PDL formats supported by the printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughprovider.supportedpdlcontenttypes
     * @type {IVectorView<HSTRING>} 
     */
    SupportedPdlContentTypes {
        get => this.get_SupportedPdlContentTypes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedPdlContentTypes() {
        if (!this.HasProp("__IPdlPassthroughProvider")) {
            if ((queryResult := this.QueryInterface(IPdlPassthroughProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdlPassthroughProvider := IPdlPassthroughProvider(outPtr)
        }

        return this.__IPdlPassthroughProvider.get_SupportedPdlContentTypes()
    }

    /**
     * Starts a PDL pass-through print job with Print Task options.
     * @param {HSTRING} jobName The job name.
     * @param {HSTRING} pdlContentType Represents the PDL format for the print job.
     * @param {PrintTaskOptions} taskOptions Print Task options containing options for the print job.
     * @param {PageConfigurationSettings} pageConfigurationSettings_ Specifies where page configuration (size and orientation) need to be read from&mdash;either the Print Task options or the PDL content. If *pageConfigurationSettings* is null, then all fields will be read from the Print Task options.
     * @returns {PdlPassthroughTarget} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughprovider.startprintjobwithtaskoptions
     */
    StartPrintJobWithTaskOptions(jobName, pdlContentType, taskOptions, pageConfigurationSettings_) {
        if (!this.HasProp("__IPdlPassthroughProvider")) {
            if ((queryResult := this.QueryInterface(IPdlPassthroughProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdlPassthroughProvider := IPdlPassthroughProvider(outPtr)
        }

        return this.__IPdlPassthroughProvider.StartPrintJobWithTaskOptions(jobName, pdlContentType, taskOptions, pageConfigurationSettings_)
    }

    /**
     * Starts a PDL pass-through print job with a print ticket.
     * @param {HSTRING} jobName The job name.
     * @param {HSTRING} pdlContentType Represents the PDL format for the print job.
     * @param {IInputStream} printTicket A print ticket stream containing options for the print job.
     * @param {PageConfigurationSettings} pageConfigurationSettings_ Specifies where page configuration (size and orientation) need to be read from&mdash;either the Print Ticket or the PDL content. If *pageConfigurationSettings* is null, then all fields will be read from the Print Ticket.
     * @returns {PdlPassthroughTarget} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughprovider.startprintjobwithprintticket
     */
    StartPrintJobWithPrintTicket(jobName, pdlContentType, printTicket, pageConfigurationSettings_) {
        if (!this.HasProp("__IPdlPassthroughProvider")) {
            if ((queryResult := this.QueryInterface(IPdlPassthroughProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdlPassthroughProvider := IPdlPassthroughProvider(outPtr)
        }

        return this.__IPdlPassthroughProvider.StartPrintJobWithPrintTicket(jobName, pdlContentType, printTicket, pageConfigurationSettings_)
    }

;@endregion Instance Methods
}
